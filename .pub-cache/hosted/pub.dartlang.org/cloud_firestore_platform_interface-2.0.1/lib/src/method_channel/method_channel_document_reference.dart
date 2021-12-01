// Copyright 2017, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'dart:async';

import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';
import 'package:cloud_firestore_platform_interface/src/internal/pointer.dart';
import 'package:flutter/services.dart';

import 'method_channel_firestore.dart';
import 'utils/source.dart';
import 'utils/exception.dart';

/// An implementation of [DocumentReferencePlatform] that uses [MethodChannel] to
/// communicate with Firebase plugins.
class MethodChannelDocumentReference extends DocumentReferencePlatform {
  Pointer _pointer;

  /// Creates a [DocumentReferencePlatform] that is implemented using [MethodChannel].
  MethodChannelDocumentReference(
      FirebaseFirestorePlatform firestore, String path)
      : assert(firestore != null),
        super(firestore, path) {
    _pointer = Pointer(path);
  }

  @override
  Future<void> set(Map<String, dynamic> data, [SetOptions options]) {
    return MethodChannelFirebaseFirestore.channel.invokeMethod<void>(
      'DocumentReference#set',
      <String, dynamic>{
        'firestore': firestore,
        'reference': this,
        'data': data,
        'options': <String, dynamic>{
          'merge': options?.merge,
          'mergeFields': options?.mergeFields,
        },
      },
    ).catchError(catchPlatformException);
  }

  @override
  Future<void> update(Map<String, dynamic> data) {
    return MethodChannelFirebaseFirestore.channel.invokeMethod<void>(
      'DocumentReference#update',
      <String, dynamic>{
        'firestore': firestore,
        'reference': this,
        'data': data,
      },
    ).catchError(catchPlatformException);
  }

  @override
  Future<DocumentSnapshotPlatform> get(
      [GetOptions options = const GetOptions()]) async {
    final Map<String, dynamic> data = await MethodChannelFirebaseFirestore
        .channel
        .invokeMapMethod<String, dynamic>(
      'DocumentReference#get',
      <String, dynamic>{
        'firestore': firestore,
        'reference': this,
        'source': getSourceString(options.source),
      },
    ).catchError(catchPlatformException);

    return DocumentSnapshotPlatform(firestore, _pointer.path, data);
  }

  @override
  Future<void> delete() {
    return MethodChannelFirebaseFirestore.channel.invokeMethod<void>(
      'DocumentReference#delete',
      <String, dynamic>{'firestore': firestore, 'reference': this},
    ).catchError(catchPlatformException);
  }

  @override
  Stream<DocumentSnapshotPlatform> snapshots(
      {bool includeMetadataChanges = false}) {
    assert(includeMetadataChanges != null);
    int handle = MethodChannelFirebaseFirestore.nextMethodChannelHandleId;
    Completer<void> onListenComplete = Completer<void>();

    // It's fine to let the StreamController be garbage collected once all the
    // subscribers have cancelled; this analyzer warning is safe to ignore.
    StreamController<DocumentSnapshotPlatform>
        controller; // ignore: close_sinks
    controller = StreamController<DocumentSnapshotPlatform>.broadcast(
      onListen: () async {
        MethodChannelFirebaseFirestore.documentObservers[handle] = controller;
        await MethodChannelFirebaseFirestore.channel.invokeMethod<void>(
          'DocumentReference#addSnapshotListener',
          <String, dynamic>{
            'handle': handle,
            'firestore': firestore,
            'reference': this,
            'includeMetadataChanges': includeMetadataChanges,
          },
        );

        if (!onListenComplete.isCompleted) {
          onListenComplete.complete();
        }
      },
      onCancel: () async {
        await onListenComplete.future;
        await MethodChannelFirebaseFirestore.channel.invokeMethod<void>(
          'Firestore#removeListener',
          <String, dynamic>{'handle': handle},
        );
        MethodChannelFirebaseFirestore.documentObservers.remove(handle);
      },
    );
    return controller.stream;
  }
}
