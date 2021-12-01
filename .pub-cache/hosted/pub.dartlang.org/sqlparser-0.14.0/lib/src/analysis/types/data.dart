import 'package:sqlparser/src/engine/sql_engine.dart';

/// Something that has a type.
abstract class Typeable {}

/// A type that sql expressions can have at runtime.
enum BasicType {
  nullType,
  int,
  real,
  text,
  blob,
}

class ResolvedType {
  final BasicType? type;

  /// We set hints for additional information that might be useful for
  /// applications but aren't covered by just exposing a [BasicType]. See the
  /// comment on [TypeHint] for examples.
  final TypeHint? hint;

  /// Whether this type is nullable. A `null` value for [nullable] indicates
  /// that nullability is unknown.
  final bool? nullable;

  /// Whether this type is an array.
  final bool isArray;

  const ResolvedType(
      {this.type, this.hint, this.nullable = false, this.isArray = false});
  const ResolvedType.bool({bool? nullable = false})
      : this(type: BasicType.int, hint: const IsBoolean(), nullable: nullable);

  ResolvedType get withoutNullabilityInfo {
    return nullable == null
        ? this
        : ResolvedType(type: type, hint: hint, isArray: isArray);
  }

  ResolvedType withNullable(bool nullable) {
    return nullable == this.nullable ? this : copyWith(nullable: nullable);
  }

  ResolvedType toArray(bool? array) {
    return copyWith(isArray: array);
  }

  ResolvedType copyWith({TypeHint? hint, bool? nullable, bool? isArray}) {
    return ResolvedType(
      type: type,
      hint: hint ?? this.hint,
      nullable: nullable ?? this.nullable,
      isArray: isArray ?? this.isArray,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        other is ResolvedType &&
            other.type == type &&
            other.hint == hint &&
            other.nullable == nullable &&
            other.isArray == isArray;
  }

  @override
  int get hashCode {
    return type.hashCode + hint.hashCode + nullable.hashCode;
  }

  @override
  String toString() {
    return 'ResolvedType($type, hint: $hint, nullable: $nullable, '
        'array: $isArray)';
  }
}

/// Provides more precise hints than the [BasicType]. For instance, booleans are
/// stored as ints in sqlite, but it might be desirable to know whether an
/// expression will actually be a boolean, so we could set the
/// [ResolvedType.hint] to [IsBoolean].
abstract class TypeHint {
  const TypeHint();

  @override
  int get hashCode => runtimeType.hashCode;
  @override
  bool operator ==(dynamic other) => other.runtimeType == runtimeType;
}

/// Type hint to mark that this type will contain a boolean value.
class IsBoolean extends TypeHint {
  const IsBoolean();
}

/// Type hint to mark that this type will contain a date time value.
class IsDateTime extends TypeHint {
  const IsDateTime();
}

/// Result of resolving a type. This can either have the resolved [type] set,
/// or it can inform the called that it [needsContext] to resolve the type
/// properly. Failure to resolve the type will have the [unknown] flag set.
///
/// When you see a [ResolveResult] that is unknown or needs context in the
/// final AST returned by [SqlEngine.analyze], assume that the type cannot be
/// determined.
class ResolveResult {
  /// The resolved type.
  final ResolvedType? type;

  /// Whether more context is needed to resolve the type. Used internally by the
  /// analyzer.
  final bool needsContext;

  /// Whether type resolution failed.
  final bool unknown;

  const ResolveResult(this.type)
      : needsContext = false,
        unknown = false;
  const ResolveResult.needsContext()
      : type = null,
        needsContext = true,
        unknown = false;
  const ResolveResult.unknown()
      : type = null,
        needsContext = false,
        unknown = true;

  bool get nullable => type?.nullable ?? true;

  ResolveResult mapResult(ResolvedType Function(ResolvedType?) map) {
    if (type != null) {
      return ResolveResult(map(type));
    } else if (needsContext) {
      return const ResolveResult.needsContext();
    } else {
      return const ResolveResult.unknown();
    }
  }

  /// Copies the result with the [nullable] information, if there is one. If
  /// there isn't, the failure state will be copied into the new
  /// [ResolveResult].
  ResolveResult withNullable(bool nullable) {
    return mapResult((r) => r!.withNullable(nullable));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        other is ResolveResult &&
            other.type == type &&
            other.needsContext == needsContext &&
            other.unknown == unknown;
  }

  @override
  int get hashCode => type.hashCode + needsContext.hashCode + unknown.hashCode;

  @override
  String toString() {
    if (type != null) {
      return 'ResolveResult: $type';
    } else {
      return 'ResolveResult(needsContext: $needsContext, unknown: $unknown)';
    }
  }
}
