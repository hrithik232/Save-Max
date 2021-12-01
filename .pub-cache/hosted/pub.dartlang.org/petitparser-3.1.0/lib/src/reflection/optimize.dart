library petitparser.reflection.optimize;

import '../core/parser.dart';
import '../parser/combinator/settable.dart';
import 'transform.dart';

/// Returns a copy of [parser] with all settable parsers removed.
Parser removeSettables(Parser parser) {
  return transformParser(parser, (each) {
    while (each is SettableParser) {
      each = each.children.first;
    }
    return each;
  });
}

/// Returns a copy of [parser] with all duplicates parsers collapsed.
Parser removeDuplicates(Parser parser) {
  final uniques = <Parser>{};
  return transformParser(parser, (source) {
    final target = uniques.firstWhere((each) {
      return source != each && source.isEqualTo(each);
    }, orElse: () => null);
    if (target == null) {
      uniques.add(source);
      return source;
    } else {
      return target;
    }
  });
}
