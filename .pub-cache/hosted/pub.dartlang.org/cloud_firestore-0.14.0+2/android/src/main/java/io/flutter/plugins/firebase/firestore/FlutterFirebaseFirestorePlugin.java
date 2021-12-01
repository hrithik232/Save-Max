// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

package io.flutter.plugins.firebase.firestore;

import android.app.Activity;
import android.util.Log;
import android.util.SparseArray;
import androidx.annotation.NonNull;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.Tasks;
import com.google.firebase.FirebaseApp;
import com.google.firebase.firestore.DocumentReference;
import com.google.firebase.firestore.DocumentSnapshot;
import com.google.firebase.firestore.FieldPath;
import com.google.firebase.firestore.FirebaseFirestore;
import com.google.firebase.firestore.FirebaseFirestoreException;
import com.google.firebase.firestore.ListenerRegistration;
import com.google.firebase.firestore.MetadataChanges;
import com.google.firebase.firestore.Query;
import com.google.firebase.firestore.QuerySnapshot;
import com.google.firebase.firestore.SetOptions;
import com.google.firebase.firestore.Source;
import com.google.firebase.firestore.WriteBatch;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.StandardMethodCodec;
import io.flutter.plugins.firebase.core.FlutterFirebasePlugin;
import io.flutter.plugins.firebase.core.FlutterFirebasePluginRegistry;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.WeakHashMap;

public class FlutterFirebaseFirestorePlugin
    implements FlutterFirebasePlugin, MethodCallHandler, FlutterPlugin, ActivityAware {
  protected static final WeakHashMap<String, WeakReference<FirebaseFirestore>>
      firestoreInstanceCache = new WeakHashMap<>();
  private static final SparseArray<ListenerRegistration> listenerRegistrations =
      new SparseArray<>();

  private MethodChannel channel;
  private Activity activity;

  protected static FirebaseFirestore getCachedFirebaseFirestoreInstanceForKey(String key) {
    synchronized (firestoreInstanceCache) {
      WeakReference<FirebaseFirestore> existingInstance = firestoreInstanceCache.get(key);
      if (existingInstance != null) {
        return existingInstance.get();
      }

      return null;
    }
  }

  protected static void setCachedFirebaseFirestoreInstanceForKey(
      FirebaseFirestore firestore, String key) {
    synchronized (firestoreInstanceCache) {
      WeakReference<FirebaseFirestore> existingInstance = firestoreInstanceCache.get(key);
      if (existingInstance == null) {
        firestoreInstanceCache.put(key, new WeakReference<>(firestore));
      }
    }
  }

  private static void destroyCachedFirebaseFirestoreInstanceForKey(String key) {
    synchronized (firestoreInstanceCache) {
      WeakReference<FirebaseFirestore> existingInstance = firestoreInstanceCache.get(key);
      if (existingInstance != null) {
        existingInstance.clear();
        firestoreInstanceCache.remove(key);
      }
    }
  }

  public static void registerWith(PluginRegistry.Registrar registrar) {
    FlutterFirebaseFirestorePlugin instance = new FlutterFirebaseFirestorePlugin();
    instance.activity = registrar.activity();
    instance.initInstance(registrar.messenger());
  }

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
    initInstance(binding.getBinaryMessenger());
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    removeEventListeners();
    channel.setMethodCallHandler(null);
    channel = null;
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding activityPluginBinding) {
    attachToActivity(activityPluginBinding);
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    detachToActivity();
  }

  @Override
  public void onReattachedToActivityForConfigChanges(
      @NonNull ActivityPluginBinding activityPluginBinding) {
    attachToActivity(activityPluginBinding);
  }

  @Override
  public void onDetachedFromActivity() {
    detachToActivity();
  }

  private void attachToActivity(ActivityPluginBinding activityPluginBinding) {
    activity = activityPluginBinding.getActivity();
  }

  private void detachToActivity() {
    activity = null;
  }

  // Ensure any Firestore listeners are removed when the app
  // is detached from the FlutterEngine
  private void removeEventListeners() {
    for (int i = 0; i < listenerRegistrations.size(); i++) {
      int key = listenerRegistrations.keyAt(i);
      listenerRegistrations.get(key).remove();
    }
    listenerRegistrations.clear();
  }

  private Task<Void> disableNetwork(Map<String, Object> arguments) {
    return Tasks.call(
        cachedThreadPool,
        () -> {
          FirebaseFirestore firestore =
              (FirebaseFirestore) Objects.requireNonNull(arguments.get("firestore"));
          return Tasks.await(firestore.disableNetwork());
        });
  }

  private Task<Void> enableNetwork(Map<String, Object> arguments) {
    return Tasks.call(
        cachedThreadPool,
        () -> {
          FirebaseFirestore firestore =
              (FirebaseFirestore) Objects.requireNonNull(arguments.get("firestore"));
          return Tasks.await(firestore.enableNetwork());
        });
  }

  private Task<Integer> addSnapshotsInSyncListener(Map<String, Object> arguments) {
    return Tasks.call(
        cachedThreadPool,
        () -> {
          int handle = (int) Objects.requireNonNull(arguments.get("handle"));
          FirebaseFirestore firestore =
              (FirebaseFirestore) Objects.requireNonNull(arguments.get("firestore"));

          Runnable snapshotsInSyncRunnable =
              () -> {
                Map<String, Integer> data = new HashMap<>();
                data.put("handle", handle);
                activity.runOnUiThread(
                    () -> channel.invokeMethod("Firestore#snapshotsInSync", data));
              };

          listenerRegistrations.put(
              handle, firestore.addSnapshotsInSyncListener(snapshotsInSyncRunnable));

          return handle;
        });
  }

  private Task<Object> transactionCreate(Map<String, Object> arguments) {
    return Tasks.call(
        cachedThreadPool,
        () -> {
          FirebaseFirestore firestore =
              (FirebaseFirestore) Objects.requireNonNull(arguments.get("firestore"));
          int transactionId = (int) Objects.requireNonNull(arguments.get("transactionId"));

          Object value = arguments.get("timeout");
          Long timeout;

          if (value instanceof Long) {
            timeout = (Long) value;
          } else if (value instanceof Integer) {
            timeout = Long.valueOf((Integer) value);
          } else {
            timeout = 5000L;
          }

          FlutterFirebaseFirestoreTransactionResult transactionResult =
              Tasks.await(
                  new FlutterFirebaseFirestoreTransactionHandler(channel, activity, transactionId)
                      .create(firestore, timeout));

          FlutterFirebaseFirestoreTransactionHandler.dispose(transactionId);

          if (transactionResult.exception != null) {
            throw transactionResult.exception;
          } else {
            return null;
          }
        });
  }

  private Task<DocumentSnapshot> transactionGet(Map<String, Object> arguments) {
    return Tasks.call(
        cachedThreadPool,
        () -> {
          DocumentReference documentReference = (DocumentReference) arguments.get("reference");
          return FlutterFirebaseFirestoreTransactionHandler.getDocument(
              (int) Objects.requireNonNull(arguments.get("transactionId")), documentReference);
        });
  }

  private Task<Void> batchCommit(Map<String, Object> arguments) {
    return Tasks.call(
        cachedThreadPool,
        () -> {
          @SuppressWarnings("unchecked")
          List<Map<String, Object>> writes =
              (List<Map<String, Object>>) Objects.requireNonNull(arguments.get("writes"));
          FirebaseFirestore firestore =
              (FirebaseFirestore) Objects.requireNonNull(arguments.get("firestore"));
          WriteBatch batch = firestore.batch();

          for (Map<String, Object> write : writes) {
            String type = (String) Objects.requireNonNull(write.get("type"));
            String path = (String) Objects.requireNonNull(write.get("path"));
            @SuppressWarnings("unchecked")
            Map<String, Object> data = (Map<String, Object>) write.get("data");

            DocumentReference documentReference = firestore.document(path);

            switch (type) {
              case "DELETE":
                batch = batch.delete(documentReference);
                break;
              case "UPDATE":
                batch = batch.update(documentReference, Objects.requireNonNull(data));
                break;
              case "SET":
                @SuppressWarnings("unchecked")
                Map<String, Object> options =
                    (Map<String, Object>) Objects.requireNonNull(write.get("options"));

                if (options.get("merge") != null && (boolean) options.get("merge")) {
                  batch =
                      batch.set(
                          documentReference, Objects.requireNonNull(data), SetOptions.merge());
                } else if (options.get("mergeFields") != null) {
                  @SuppressWarnings("unchecked")
                  List<FieldPath> fieldPathList =
                      (List<FieldPath>) Objects.requireNonNull(options.get("mergeFields"));
                  batch =
                      batch.set(
                          documentReference,
                          Objects.requireNonNull(data),
                          SetOptions.mergeFieldPaths(fieldPathList));
                } else {
                  batch = batch.set(documentReference, Objects.requireNonNull(data));
                }
                break;
            }
          }

          return Tasks.await(batch.commit());
        });
  }

  private Task<Void> queryAddSnapshotListener(Map<String, Object> arguments) {
    return Tasks.call(
        cachedThreadPool,
        () -> {
          final int handle = (int) Objects.requireNonNull(arguments.get("handle"));

          MetadataChanges metadataChanges =
              (Boolean) Objects.requireNonNull(arguments.get("includeMetadataChanges"))
                  ? MetadataChanges.INCLUDE
                  : MetadataChanges.EXCLUDE;

          Query query = (Query) arguments.get("query");

          if (query == null) {
            throw new IllegalArgumentException(
                "An error occurred while parsing query arguments, see native logs for more information. Please report this issue.");
          }

          ListenerRegistration listenerRegistration =
              query.addSnapshotListener(
                  metadataChanges,
                  (querySnapshot, exception) -> {
                    Map<String, Object> querySnapshotMap = new HashMap<>();

                    querySnapshotMap.put("handle", handle);

                    if (exception != null) {
                      Map<String, Object> exceptionMap = new HashMap<>();
                      FlutterFirebaseFirestoreException firestoreException =
                          new FlutterFirebaseFirestoreException(exception, exception.getCause());
                      exceptionMap.put("code", firestoreException.getCode());
                      exceptionMap.put("message", firestoreException.getMessage());
                      querySnapshotMap.put("error", exceptionMap);

                      channel.invokeMethod("QuerySnapshot#error", querySnapshotMap);
                    } else {
                      //noinspection ConstantConditions
                      querySnapshotMap.put("snapshot", querySnapshot);
                      channel.invokeMethod("QuerySnapshot#event", querySnapshotMap);
                    }
                  });

          listenerRegistrations.put(handle, listenerRegistration);
          return null;
        });
  }

  private Task<QuerySnapshot> queryGet(Map<String, Object> arguments) {
    return Tasks.call(
        cachedThreadPool,
        () -> {
          Source source = getSource(arguments);
          Query query = (Query) arguments.get("query");

          if (query == null) {
            throw new IllegalArgumentException(
                "An error occurred while parsing query arguments, see native logs for more information. Please report this issue.");
          }

          return Tasks.await(query.get(source));
        });
  }

  @SuppressWarnings("ConstantConditions")
  private Task<Void> documentAddSnapshotListener(Map<String, Object> arguments) {
    return Tasks.call(
        cachedThreadPool,
        () -> {
          final int handle = (int) Objects.requireNonNull(arguments.get("handle"));

          MetadataChanges metadataChanges =
              (Boolean) Objects.requireNonNull(arguments.get("includeMetadataChanges"))
                  ? MetadataChanges.INCLUDE
                  : MetadataChanges.EXCLUDE;

          DocumentReference documentReference =
              (DocumentReference) Objects.requireNonNull(arguments.get("reference"));

          ListenerRegistration listenerRegistration =
              documentReference.addSnapshotListener(
                  metadataChanges,
                  (documentSnapshot, exception) -> {
                    Map<String, Object> eventMap = new HashMap<>();

                    eventMap.put("handle", handle);

                    if (exception != null) {
                      Map<String, Object> exceptionMap = new HashMap<>();
                      FlutterFirebaseFirestoreException firestoreException =
                          new FlutterFirebaseFirestoreException(exception, exception.getCause());

                      exceptionMap.put("code", firestoreException.getCode());
                      exceptionMap.put("message", firestoreException.getMessage());
                      eventMap.put("error", exceptionMap);
                      channel.invokeMethod("DocumentSnapshot#error", eventMap);
                    } else {
                      eventMap.put("snapshot", documentSnapshot);
                      channel.invokeMethod("DocumentSnapshot#event", eventMap);
                    }
                  });

          listenerRegistrations.put(handle, listenerRegistration);

          return null;
        });
  }

  private Task<DocumentSnapshot> documentGet(Map<String, Object> arguments) {
    return Tasks.call(
        cachedThreadPool,
        () -> {
          Source source = getSource(arguments);
          DocumentReference documentReference =
              (DocumentReference) Objects.requireNonNull(arguments.get("reference"));
          return Tasks.await(documentReference.get(source));
        });
  }

  private Task<Void> documentSet(Map<String, Object> arguments) {
    return Tasks.call(
        cachedThreadPool,
        () -> {
          DocumentReference documentReference =
              (DocumentReference) Objects.requireNonNull(arguments.get("reference"));

          @SuppressWarnings("unchecked")
          Map<String, Object> data =
              (Map<String, Object>) Objects.requireNonNull(arguments.get("data"));
          @SuppressWarnings("unchecked")
          Map<String, Object> options =
              (Map<String, Object>) Objects.requireNonNull(arguments.get("options"));

          Task<Void> setTask;

          if (options.get("merge") != null && (boolean) options.get("merge")) {
            setTask = documentReference.set(data, SetOptions.merge());
          } else if (options.get("mergeFields") != null) {
            @SuppressWarnings("unchecked")
            List<FieldPath> fieldPathList =
                (List<FieldPath>) Objects.requireNonNull(options.get("mergeFields"));
            setTask = documentReference.set(data, SetOptions.mergeFieldPaths(fieldPathList));
          } else {
            setTask = documentReference.set(data);
          }

          return Tasks.await(setTask);
        });
  }

  private Task<Void> documentUpdate(Map<String, Object> arguments) {
    return Tasks.call(
        cachedThreadPool,
        () -> {
          DocumentReference documentReference =
              (DocumentReference) Objects.requireNonNull(arguments.get("reference"));
          @SuppressWarnings("unchecked")
          Map<String, Object> data =
              (Map<String, Object>) Objects.requireNonNull(arguments.get("data"));

          return Tasks.await(documentReference.update(data));
        });
  }

  private Task<Void> documentDelete(Map<String, Object> arguments) {
    return Tasks.call(
        cachedThreadPool,
        () -> {
          DocumentReference documentReference =
              (DocumentReference) Objects.requireNonNull(arguments.get("reference"));
          return Tasks.await(documentReference.delete());
        });
  }

  private Task<Void> clearPersistence(Map<String, Object> arguments) {
    return Tasks.call(
        cachedThreadPool,
        () -> {
          FirebaseFirestore firestore =
              (FirebaseFirestore) Objects.requireNonNull(arguments.get("firestore"));
          return Tasks.await(firestore.clearPersistence());
        });
  }

  private Task<Void> terminate(Map<String, Object> arguments) {
    return Tasks.call(
        cachedThreadPool,
        () -> {
          FirebaseFirestore firestore =
              (FirebaseFirestore) Objects.requireNonNull(arguments.get("firestore"));
          Tasks.await(firestore.terminate());
          destroyCachedFirebaseFirestoreInstanceForKey(firestore.getApp().getName());
          return null;
        });
  }

  private Task<Void> waitForPendingWrites(Map<String, Object> arguments) {
    return Tasks.call(
        cachedThreadPool,
        () -> {
          FirebaseFirestore firestore =
              (FirebaseFirestore) Objects.requireNonNull(arguments.get("firestore"));
          return Tasks.await(firestore.waitForPendingWrites());
        });
  }

  @Override
  public void onMethodCall(MethodCall call, @NonNull final MethodChannel.Result result) {
    Task<?> methodCallTask;

    switch (call.method) {
      case "Firestore#removeListener":
        int handle = Objects.requireNonNull(call.argument("handle"));
        if (listenerRegistrations.get(handle) != null) {
          listenerRegistrations.get(handle).remove();
          listenerRegistrations.remove(handle);
        }
        result.success(null);
        return;
      case "Firestore#disableNetwork":
        methodCallTask = disableNetwork(call.arguments());
        break;
      case "Firestore#enableNetwork":
        methodCallTask = enableNetwork(call.arguments());
        break;
      case "Firestore#addSnapshotsInSyncListener":
        methodCallTask = addSnapshotsInSyncListener(call.arguments());
        break;
      case "Transaction#create":
        methodCallTask = transactionCreate(call.arguments());
        break;
      case "Transaction#get":
        methodCallTask = transactionGet(call.arguments());
        break;
      case "WriteBatch#commit":
        methodCallTask = batchCommit(call.arguments());
        break;
      case "Query#addSnapshotListener":
        methodCallTask = queryAddSnapshotListener(call.arguments());
        break;
      case "Query#get":
        methodCallTask = queryGet(call.arguments());
        break;
      case "DocumentReference#addSnapshotListener":
        methodCallTask = documentAddSnapshotListener(call.arguments());
        break;
      case "DocumentReference#get":
        methodCallTask = documentGet(call.arguments());
        break;
      case "DocumentReference#set":
        methodCallTask = documentSet(call.arguments());
        break;
      case "DocumentReference#update":
        methodCallTask = documentUpdate(call.arguments());
        break;
      case "DocumentReference#delete":
        methodCallTask = documentDelete(call.arguments());
        break;
      case "Firestore#clearPersistence":
        methodCallTask = clearPersistence(call.arguments());
        break;
      case "Firestore#terminate":
        methodCallTask = terminate(call.arguments());
        break;
      case "Firestore#waitForPendingWrites":
        methodCallTask = waitForPendingWrites(call.arguments());
        break;
      default:
        result.notImplemented();
        return;
    }

    methodCallTask.addOnCompleteListener(
        task -> {
          if (task.isSuccessful()) {
            result.success(task.getResult());
          } else {
            Exception exception = task.getException();
            Map<String, String> exceptionDetails = getExceptionDetails(exception);
            if (exceptionDetails.containsKey("code")
                && Objects.requireNonNull(exceptionDetails.get("code")).equals("unknown")) {
              Log.e(
                  "FLTFirebaseFirestore",
                  "An unknown error occurred calling method " + call.method,
                  exception);
            }
            result.error(
                "firebase_firestore",
                exception != null ? exception.getMessage() : null,
                exceptionDetails);
          }
        });
  }

  private void initInstance(BinaryMessenger messenger) {
    String channelName = "plugins.flutter.io/firebase_firestore";
    channel =
        new MethodChannel(
            messenger,
            "plugins.flutter.io/firebase_firestore",
            new StandardMethodCodec(FlutterFirebaseFirestoreMessageCodec.INSTANCE));

    channel.setMethodCallHandler(this);
    FlutterFirebasePluginRegistry.registerPlugin(channelName, this);
  }

  private Map<String, String> getExceptionDetails(Exception exception) {
    Map<String, String> details = new HashMap<>();

    if (exception == null) {
      return details;
    }

    FlutterFirebaseFirestoreException firestoreException = null;

    if (exception instanceof FirebaseFirestoreException) {
      firestoreException =
          new FlutterFirebaseFirestoreException(
              (FirebaseFirestoreException) exception, exception.getCause());
    } else if (exception.getCause() != null
        && exception.getCause() instanceof FirebaseFirestoreException) {
      firestoreException =
          new FlutterFirebaseFirestoreException(
              (FirebaseFirestoreException) exception.getCause(),
              exception.getCause().getCause() != null
                  ? exception.getCause().getCause()
                  : exception.getCause());
    }

    if (firestoreException != null) {
      details.put("code", firestoreException.getCode());
      details.put("message", firestoreException.getMessage());
    }

    return details;
  }

  private Source getSource(Map<String, Object> arguments) {
    String source = (String) Objects.requireNonNull(arguments.get("source"));

    switch (source) {
      case "server":
        return Source.SERVER;
      case "cache":
        return Source.CACHE;
      default:
        return Source.DEFAULT;
    }
  }

  @Override
  public Task<Map<String, Object>> getPluginConstantsForFirebaseApp(FirebaseApp firebaseApp) {
    return Tasks.call(cachedThreadPool, () -> null);
  }

  @Override
  public Task<Void> didReinitializeFirebaseCore() {
    return Tasks.call(
        cachedThreadPool,
        () -> {
          removeEventListeners();
          // Context is ignored by API so we don't send it over even though annotated non-null.

          for (FirebaseApp app : FirebaseApp.getApps(null)) {
            FirebaseFirestore firestore = FirebaseFirestore.getInstance(app);
            Tasks.await(firestore.terminate());
            FlutterFirebaseFirestorePlugin.destroyCachedFirebaseFirestoreInstanceForKey(
                app.getName());
          }
          return null;
        });
  }
}
