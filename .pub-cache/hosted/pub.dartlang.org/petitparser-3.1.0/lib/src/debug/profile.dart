library petitparser.debug.profile;

import '../core/parser.dart';
import '../parser/action/continuation.dart';
import '../reflection/transform.dart';
import 'output.dart';

/// Returns a transformed [Parser] that when being used measures
/// the activation count and total time of each parser.
///
/// For example, the snippet
///
///     final parser = letter() & word().star();
///     profile(parser).parse('f1234567890');
///
/// produces the following output:
///
///      1  2006  Instance of 'SequenceParser'
///      1   697  Instance of 'PossessiveRepeatingParser'[0..*]
///     11   406  Instance of 'CharacterParser'[letter or digit expected]
///      1   947  Instance of 'CharacterParser'[letter expected]
///
/// The first number refers to the number of activations of each parser, and
/// the second number is the microseconds spent in this parser and all its
/// children.
Parser profile(Parser root, [OutputHandler output = print]) {
  final count = <Parser, int>{};
  final watch = <Parser, Stopwatch>{};
  final parsers = <Parser>[];
  return transformParser(root, (parser) {
    parsers.add(parser);
    return parser.callCC((continuation, context) {
      count[parser]++;
      watch[parser].start();
      final result = continuation(context);
      watch[parser].stop();
      return result;
    });
  }).callCC((continuation, context) {
    for (final parser in parsers) {
      count[parser] = 0;
      watch[parser] = Stopwatch();
    }
    final result = continuation(context);
    for (final parser in parsers) {
      output('${count[parser]}\t'
          '${watch[parser].elapsedMicroseconds}\t'
          '$parser');
    }
    return result;
  });
}
