import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

import 'method_channel_firestore.dart';

class MethodChannelLoadBundleTask extends LoadBundleTaskPlatform {
  MethodChannelLoadBundleTask({
    required Future<String?> task,
    required Uint8List bundle,
    required MethodChannelFirebaseFirestore firestore,
  }) : super() {
    Stream<LoadBundleTaskSnapshotPlatform> mapNativeStream() async* {
      final observerId = await task;

      final nativePlatformStream =
          MethodChannelFirebaseFirestore.loadBundleChannel(observerId!)
              .receiveBroadcastStream(
        <String, Object>{'bundle': bundle, 'firestore': firestore},
      );
      try {
        await for (final snapshot in nativePlatformStream) {
          final taskState = convertToTaskState(snapshot['taskState']);

          yield LoadBundleTaskSnapshotPlatform(
              taskState, Map<String, dynamic>.from(snapshot));

          if (taskState == LoadBundleTaskState.success) {
            // this will close the stream and stop listening to nativePlatformStream
            return;
          }
        }
      } catch (exception) {
        if (exception is! Exception || exception is! PlatformException) {
          rethrow;
        }

        Map<String, String>? details = exception.details != null
            ? Map<String, String>.from(exception.details)
            : null;

        throw FirebaseException(
            plugin: 'cloud_firestore',
            code: 'load-bundle-error',
            message: details?['message'] ?? '');
      }
    }

    stream = mapNativeStream().asBroadcastStream(
        onListen: (sub) => sub.resume(), onCancel: (sub) => sub.pause());
  }

  @override
  late final Stream<LoadBundleTaskSnapshotPlatform> stream;
}
