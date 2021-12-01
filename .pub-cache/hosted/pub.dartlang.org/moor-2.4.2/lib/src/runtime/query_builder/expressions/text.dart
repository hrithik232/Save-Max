part of '../query_builder.dart';

/// Defines methods that operate on a column storing [String] values.
extension StringExpressionOperators on Expression<String, StringType> {
  /// Whether this column matches the given pattern. For details on what patters
  /// are valid and how they are interpreted, check out
  /// [this tutorial](http://www.sqlitetutorial.net/sqlite-like/).
  Expression<bool, BoolType> like(String regex) {
    return _LikeOperator(this, Variable.withString(regex));
  }

  /// Uses the given [collate] sequence when comparing this column to other
  /// values.
  Expression<String, StringType> collate(Collate collate) {
    return _CollateOperator(this, collate);
  }

  /// Performs a string concatenation in sql by appending [other] to `this`.
  Expression<String, StringType> operator +(
      Expression<String, StringType> other) {
    return _BaseInfixOperator(this, '||', other,
        precedence: Precedence.stringConcatenation);
  }

  /// Calls the sqlite function `UPPER` on `this` string. Please note that, in
  /// most sqlite installations, this only affects ascii chars.
  ///
  /// See also:
  ///  - https://www.w3resource.com/sqlite/core-functions-upper.php
  Expression<String, StringType> upper() {
    return FunctionCallExpression('UPPER', [this]);
  }

  /// Calls the sqlite function `LOWER` on `this` string. Please note that, in
  /// most sqlite installations, this only affects ascii chars.
  ///
  /// See also:
  ///  - https://www.w3resource.com/sqlite/core-functions-lower.php
  Expression<String, StringType> lower() {
    return FunctionCallExpression('LOWER', [this]);
  }

  /// Calls the sqlite function `LENGTH` on `this` string, which counts the
  /// number of characters in this string. Note that, in most sqlite
  /// installations, [length] may not support all unicode rules.
  ///
  /// See also:
  ///  - https://www.w3resource.com/sqlite/core-functions-length.php
  Expression<int, IntType> get length {
    return FunctionCallExpression('LENGTH', [this]);
  }
}

/// A `text LIKE pattern` expression that will be true if the first expression
/// matches the pattern given by the second expression.
class _LikeOperator extends Expression<bool, BoolType> {
  /// The target expression that will be tested
  final Expression<String, StringType> target;

  /// The regex-like expression to test the [target] against.
  final Expression<String, StringType> regex;

  @override
  final Precedence precedence = Precedence.comparisonEq;

  /// Perform a like operator with the target and the regex.
  _LikeOperator(this.target, this.regex);

  @override
  void writeInto(GenerationContext context) {
    writeInner(context, target);
    context.buffer.write(' LIKE ');
    writeInner(context, regex);
  }

  @override
  int get hashCode => $mrjf($mrjc(target.hashCode, regex.hashCode));

  @override
  bool operator ==(dynamic other) {
    return other is _LikeOperator &&
        other.target == target &&
        other.regex == regex;
  }
}

/// Builtin collating functions from sqlite.
///
/// See also:
/// - https://www.sqlite.org/datatype3.html#collation
enum Collate {
  /// Instruct sqlite to compare string data using memcmp(), regardless of text
  /// encoding.
  binary,

  /// The same as [Collate.binary], except the 26 upper case characters of ASCII
  /// are folded to their lower case equivalents before the comparison is
  /// performed. Note that only ASCII characters are case folded. SQLite does
  /// not attempt to do full UTF case folding due to the size of the tables
  /// required.
  noCase,

  /// The same as [Collate.binary], except that trailing space characters are
  /// ignored.
  rTrim,
}

/// A `text COLLATE collate` expression in sqlite.
class _CollateOperator extends Expression<String, StringType> {
  /// The expression on which the collate function will be run
  final Expression inner;

  /// The [Collate] to use.
  final Collate collate;

  @override
  final Precedence precedence = Precedence.postfix;

  /// Constructs a collate expression on the [inner] expression and the
  /// [Collate].
  _CollateOperator(this.inner, this.collate);

  @override
  void writeInto(GenerationContext context) {
    writeInner(context, inner);
    context.buffer..write(' COLLATE ')..write(_operatorNames[collate]);
  }

  @override
  int get hashCode => $mrjf($mrjc(inner.hashCode, collate.hashCode));

  @override
  bool operator ==(dynamic other) {
    return other is _CollateOperator &&
        other.inner == inner &&
        other.collate == collate;
  }

  static const Map<Collate, String> _operatorNames = {
    Collate.binary: 'BINARY',
    Collate.noCase: 'NOCASE',
    Collate.rTrim: 'RTRIM',
  };
}
