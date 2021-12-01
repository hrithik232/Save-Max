import 'package:sqlparser/src/ast/ast.dart';

/// Checks whether [a] and [b] are equal. If they aren't, throws an exception.
void enforceEqual(AstNode a, AstNode b) {
  if (a.runtimeType != b.runtimeType) {
    throw ArgumentError('Not equal: First was $a, second $b');
  }

  if (!a.contentEquals(b)) {
    throw ArgumentError('Content not equal: $a and $b');
  }

  final childrenA = a.childNodes.iterator;
  final childrenB = b.childNodes.iterator;

  // always move both iterators
  while (childrenA.moveNext() & childrenB.moveNext()) {
    enforceEqual(childrenA.current, childrenB.current);
  }

  if (childrenA.moveNext() || childrenB.moveNext()) {
    throw ArgumentError("$a and $b don't have an equal amount of children");
  }
}
