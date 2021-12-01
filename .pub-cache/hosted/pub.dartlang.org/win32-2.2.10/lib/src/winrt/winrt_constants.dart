// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Enums and constants used by WinRT

// ignore_for_file: camel_case_types

/// @nodoc
const CLSID_CorMetaDataDispenser = '{E5CB7A31-7512-11D2-89CE-0080C792E5D8}';

/// Contains flag values that control metadata behavior upon opening manifest
/// files.
///
/// {@category Enum}
class CorOpenFlags {
  /// Indicates that the file should be opened for reading only.
  static const ofRead = 0x00000000;

  /// Indicates that the file should be opened for writing.
  static const ofWrite = 0x00000001;

  /// A mask for reading and writing.
  static const ofReadWriteMask = 0x00000001;

  /// Indicates that the file should be read into memory. Metadata should
  /// maintain its own copy.
  static const ofCopyMemory = 0x00000002;

  /// Obsolete. This flag is ignored.
  static const ofCacheImage = 0x00000004;

  /// Obsolete. This flag is ignored.
  static const ofManifestMetadata = 0x00000008;

  /// Indicates that the file should be opened for reading, and that a call to
  /// QueryInterface for an IMetaDataEmit cannot be made.
  static const ofReadOnly = 0x00000010;

  /// Indicates that the memory was allocated using a call to CoTaskMemAlloc and
  /// will be freed by the metadata.
  static const ofTakeOwnership = 0x00000020;

  /// Obsolete. This flag is ignored.
  static const ofNoTypeLib = 0x00000080;

  /// Indicates that automatic transforms of .winmd files should be disabled. In
  /// other words, the projection of a Windows Runtime type to a .NET Framework
  /// type should be disabled.
  static const ofNoTransform = 0x00001000;

  /// Reserved for internal use.
  static const ofReserved1 = 0x00000100;

  /// Reserved for internal use.
  static const ofReserved2 = 0x00000200;

  /// Reserved for internal use.
  static const ofReserved = 0xffffff40;
}

/// Represents the trust level of an activatable class.
///
/// {@category Enum}
class TrustLevel {
  /// The component has access to resources that are not protected.
  static const BaseTrust = 0;

  /// The component has access to resources requested in the app manifest and
  /// approved by the user.
  static const PartialTrust = 1;

  /// The component requires the full privileges of the user.
  static const FullTrust = 2;
}

/// Specifies the status of an asynchronous operation.
///
/// {@category Enum}
class AsyncStatus {
  /// The operation has started.
  static const Started = 0;

  /// The operation has completed.
  static const Completed = Started + 1;

  /// The operation was canceled.
  static const Canceled = Completed + 1;

  /// The operation has encountered an error.
  static const Error = Canceled + 1;
}

/// Indicates the view mode that the file picker is using to present items.
///
/// Windows.Storage.Pickers.PickerViewMode
/// {@category Enum}
class PickerViewMode {
  /// A list of items.
  static const List = 0;

  /// A set of thumbnail images.
  static const Thumbnail = 1;
}

/// Identifies the storage location that the file picker presents to the user.
///
/// Windows.Storage.Pickers.PickerLocationId
/// {@category Enum}
class PickerLocationId {
  /// The Documents library.
  static const DocumentsLibrary = 0;

  /// The Computer folder.
  static const ComputerFolder = 1;

  /// The Windows desktop.
  static const Desktop = 2;

  /// The Downloads folder.
  static const Downloads = 3;

  /// The HomeGroup.
  static const HomeGroup = 4;

  /// The Music library.
  static const MusicLibrary = 5;

  /// The Pictures library.
  static const PicturesLibrary = 6;

  /// The Videos library.
  static const VideosLibrary = 7;

  /// The Objects library.
  static const Objects3D = 8;

  /// An unspecified location.
  static const Unspecified = 9;
}

/// Identifies the day of the week.
///
/// Windows.Globalization.DayOfWeek
/// {@category Enum}
class DayOfWeek {
  static const Sunday = 0;
  static const Monday = 1;
  static const Tuesday = 2;
  static const Wednesday = 3;
  static const Thursday = 4;
  static const Friday = 5;
  static const Saturday = 6;
}
