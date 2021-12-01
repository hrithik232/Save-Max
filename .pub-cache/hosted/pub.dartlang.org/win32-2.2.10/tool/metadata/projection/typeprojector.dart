// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:winmd/winmd.dart';

import 'win32_typemap.dart';

const Map<String, String> specialTypes = {
  'System.Guid': 'GUID',
  'Windows.Win32.System.SystemServices.LARGE_INTEGER': 'Int64',
  'Windows.Win32.System.SystemServices.ULARGE_INTEGER': 'Uint64',
};

/// Takes a WinMD type and builds a Dart representation of it.
class TypeProjector {
  final TypeIdentifier typeIdentifier;

  const TypeProjector(this.typeIdentifier);

  bool get isWin32Type => typeIdentifier.name.startsWith('Windows.Win32');

  // The Win32 metadata wraps types like HANDLE into a strongly-typed equivalent
  // (e.g. NonCloseableHandle). That seems unnecessary for now, and so we're
  // going to unwrap that to its underlying value.
  bool get isWin32WrappedType {
    final scope = MetadataStore.getWin32Scope();

    final valueTypeDef = scope.findTypeDef(typeIdentifier.name);

    return (valueTypeDef?.fields.length == 1 &&
        valueTypeDef?.fields.first.name == 'Value');
  }

  /// Converts from a Win32 type (e.g. BOOL, UINT, DWORD) to the underlying Dart
  /// FFI native type (e.g. Uint32).
  String _convertToFFIType(String win32Type) {
    if (win32TypeMap.containsKey(win32Type)) {
      return win32TypeMap[win32Type]!;
    } else {
      if (win32Type.startsWith('LP')) {
        return 'Pointer<${win32Type.substring(2)}>';
      }
      // It's a STRUCT (or an unknown type, in which case it will fail Dart
      // analysis.)
      return win32Type;
    }
  }

  TypeIdentifier? get win32WrappedType {
    // Test to see if it's a type on our exceptions list, in which case do
    // nothing.
    final win32Type = typeIdentifier.type?.name.split('.').last ?? '';
    final ffiNativeType = _convertToFFIType(win32Type);
    if (ffiNativeType != win32Type) return null;

    final scope = MetadataStore.getWin32Scope();
    final valueTypeDef = scope.findTypeDef(typeIdentifier.name);
    return valueTypeDef?.fields.first.typeIdentifier;
  }

  bool get isTypeAnEnum => typeIdentifier.type?.parent?.name == 'System.Enum';

  bool get isTypeValueType =>
      (typeIdentifier.baseType == BaseType.ValueTypeModifier ||
          typeIdentifier.type?.parent?.name == 'System.ValueType');

  String pointerType(TypeIdentifier typeIdentifier) {
    // Is it a string pointer?
    if (typeIdentifier.name == 'LPWSTR') {
      return 'Pointer<Utf16>';
    }
    if (typeIdentifier.name == 'LPSTR') {
      return 'Pointer<Utf8>';
    }
    // In ECMA-335, 'char' is understood to represent a wide character
    if (typeIdentifier.name == 'char') {
      return 'Pointer<Utf16>';
    }
    if (typeIdentifier.typeArg?.type?.parent?.name == 'System.Enum') {
      return 'Pointer<Uint32>';
    }

    // Check if it's Pointer<T>, in which case we have work
    final typeArgs = typeIdentifier.typeArg;
    if (typeArgs != null) {
      // Pointer<Void> in Dart is unnecessarily restrictive, versus the
      // Win32 meaning, which is more like "undefined type". We can
      // model that with a generic Pointer in Dart.

      if (typeArgs.baseType == BaseType.Void) {
        return 'Pointer';
      }

      final T = TypeProjector(typeArgs).nativeType;
      // If it's a Unicode Win32 type, strip off the ending 'W'.
      if (T.endsWith('W')) {
        return 'Pointer<${T.substring(0, T.length - 1)}>';
      } else {
        return 'Pointer<$T>';
      }
    } else {
      return 'Pointer';
    }
  }

  /// Take a Dart FFI native type (e.g. `Uint32`) and return the equivalent Dart
  /// type (e.g. `int`).
  String get dartType {
    final ffiType = nativeType;

    const intTypes = <String>[
      'Int8',
      'Int16',
      'Int32',
      'Int64',
      'IntPtr',
      'Uint8',
      'Uint16',
      'Uint32',
      'Uint64'
    ];

    if (['Float', 'Double'].contains(ffiType)) {
      return 'double';
    }

    if (intTypes.contains(ffiType)) {
      return 'int';
    }

    if (ffiType == 'Void') {
      return 'void';
    }

    if (ffiType == '/* Boolean */ Uint8') {
      return 'bool';
    }

    return ffiType;
  }

  String get nativeType {
    // ECMA-335 II.14.3 does not guarantee that an enum is 32-bit, but
    // per https://docs.microsoft.com/en-us/uwp/winrt-cref/winmd-files#enums,
    // enums are always signed or unsigned 32-bit values.
    if (isTypeAnEnum) {
      return 'Uint32';
    }

    // For now, treat GUIDs specially
    if (specialTypes.containsKey(typeIdentifier.name)) {
      return specialTypes[typeIdentifier.name]!;
    }

    // Unwrap Win32 value types
    if (isTypeValueType && isWin32Type && isWin32WrappedType) {
      final wrappedType = win32WrappedType;
      if (wrappedType != null) {
        return TypeProjector(wrappedType).nativeType;
      }
    }

    // Treat WinRT value types as Uint32
    if (isTypeValueType && !isWin32Type) {
      return 'Uint32';
    }

    // Handle base types
    switch (typeIdentifier.baseType) {
      case BaseType.Void:
        return 'Void';
      case BaseType.Boolean:
        return '/* Boolean */ Uint8';
      case BaseType.Char:
        return 'Uint16';
      case BaseType.Int8:
        return 'Int8';
      case BaseType.Uint8:
        return 'Uint8';
      case BaseType.Int16:
        return 'Int16';
      case BaseType.Uint16:
        return 'Uint16';
      case BaseType.Int32:
        return 'Int32';
      case BaseType.Uint32:
        return 'Uint32';
      case BaseType.Int64:
        return 'Int64';
      case BaseType.Uint64:
        return 'Uint64';
      case BaseType.Float:
        return 'Float';
      case BaseType.Double:
        return 'Double';
      case BaseType.String:
        return 'IntPtr';
      case BaseType.Object:
        return 'COMObject';
      case BaseType.ClassVariableTypeModifier:
      case BaseType.MethodVariableTypeModifier:
        return 'Pointer';
      case BaseType.GenericTypeModifier:
      case BaseType.ArrayTypeModifier:
        return TypeProjector(typeIdentifier.typeArg!).nativeType;
      case BaseType.PointerTypeModifier:
        return pointerType(typeIdentifier);
      case BaseType.FunctionPointer:
        return 'Pointer';
      case BaseType.IntPtr:
      case BaseType.UintPtr:
        return 'IntPtr';
      default:
    }

    // COM type
    if (typeIdentifier.type != null &&
        typeIdentifier.type!.interfaces.isNotEmpty &&
        typeIdentifier.type!.interfaces.first.name ==
            'Windows.Win32.Com.IUnknown') {
      return 'Pointer';
    }

    // If it's a Win32 type, we know how to get the type
    if (typeIdentifier.type != null &&
        typeIdentifier.type!.name.startsWith('Windows.Win32')) {
      final win32Type = typeIdentifier.type?.name.split('.').last ?? '';
      final ffiNativeType = _convertToFFIType(win32Type);
      return ffiNativeType;
    }

    if (typeIdentifier.baseType == BaseType.ClassTypeModifier) {
      // WinRT type
      return 'Pointer';
    }

    // Something failed. Return something egregiously wrong, so that the
    // analyzer picks it up as an error.
    return '__${typeIdentifier.name}__';
  }
}
