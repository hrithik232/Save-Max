// Copyright 2017, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of cloud_firestore;

enum FieldValueType { arrayUnion, arrayRemove, delete, serverTimestamp }

/// Sentinel values that can be used when writing document fields with set() or
/// update().
class FieldValue {
  FieldValue._(this.type, this.value);

  final FieldValueType type;
  final dynamic value;

  /// Returns a special value that tells the server to union the given elements
  /// with any array value that already exists on the server.
  ///
  /// Each specified element that doesn't already exist in the array will be
  /// added to the end. If the field being modified is not already an array it
  /// will be overwritten with an array containing exactly the specified
  /// elements.
  static FieldValue arrayUnion(List<dynamic> elements) =>
      FieldValue._(FieldValueType.arrayUnion, elements);

  /// Returns a special value that tells the server to remove the given
  /// elements from any array value that already exists on the server.
  ///
  /// All instances of each element specified will be removed from the array.
  /// If the field being modified is not already an array it will be overwritten
  /// with an empty array.
  static FieldValue arrayRemove(List<dynamic> elements) =>
      FieldValue._(FieldValueType.arrayRemove, elements);

  /// Returns a sentinel for use with update() to mark a field for deletion.
  static FieldValue delete() => FieldValue._(FieldValueType.delete, null);

  /// Returns a sentinel for use with set() or update() to include a
  /// server-generated timestamp in the written data.
  static FieldValue serverTimestamp() =>
      FieldValue._(FieldValueType.serverTimestamp, null);
}
