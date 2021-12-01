import 'dart:math';

import 'package:petitparser/petitparser.dart';
import 'package:test/test.dart';

import 'test_utils.dart';

typedef Evaluator = num Function(num value);

void main() {
  test('flatten().trim()', () {
    final parser = word().plus().flatten().trim();
    expectSuccess(parser, 'ab1', 'ab1');
    expectSuccess(parser, ' ab1 ', 'ab1');
    expectSuccess(parser, '  ab1  ', 'ab1');
  });
  test('trim().flatten()', () {
    final parser = word().plus().trim().flatten();
    expectSuccess(parser, 'ab1', 'ab1');
    expectSuccess(parser, ' ab1 ', ' ab1 ');
    expectSuccess(parser, '  ab1  ', '  ab1  ');
  });
  group('separatedBy()', () {
    void testWith(String name, Parser<List<T>> Function<T>(Parser<T>) builder) {
      test(name, () {
        final string = letter();
        final stringList = builder(string);
        expect(stringList is Parser<List<String>>, isTrue);
        expectSuccess(stringList, 'a,b,c', ['a', 'b', 'c']);

        final integer = digit().map(int.parse);
        final integerList = builder(integer);
        expect(integerList is Parser<List<int>>, isTrue);
        expectSuccess(integerList, '1,2,3', [1, 2, 3]);

        final mixed = string | integer;
        final mixedList = builder(mixed);
        expect(mixedList is Parser<List>, isTrue);
        expectSuccess(mixedList, '1,a,2', [1, 'a', 2]);
      });
    }

    Parser<List<T>> typeParam<T>(Parser<T> parser) =>
        parser.separatedBy<T>(char(','), includeSeparators: false);
    Parser<List<T>> castList<T>(Parser<T> parser) =>
        parser.separatedBy(char(','), includeSeparators: false).castList<T>();
    Parser<List<T>> smartCompiler<T>(Parser<T> parser) =>
        parser.separatedBy(char(','), includeSeparators: false);

    testWith('with list created using desired type', typeParam);
    testWith('with generic list cast to desired type', castList);
    testWith('with compiler inferring desired type', smartCompiler);
  });
  test('parse padded and limited number', () {
    final parser = digit().repeat(2).flatten().callCC((continuation, context) {
      final result = continuation(context);
      if (result.isSuccess && int.parse(result.value) > 31) {
        return context.failure('00-31 expected');
      } else {
        return result;
      }
    });
    expectSuccess(parser, '00', '00');
    expectSuccess(parser, '24', '24');
    expectSuccess(parser, '31', '31');
    expectFailure(parser, '32', 0, '00-31 expected');
    expectFailure(parser, '3', 1, 'digit expected');
  });
  group('date format parser', () {
    final day = 'dd'.toParser().map((token) => digit()
        .repeat(2)
        .flatten()
        .map((value) => MapEntry(#day, int.parse(value))));
    final month = 'mm'.toParser().map((token) => digit()
        .repeat(2)
        .flatten()
        .map((value) => MapEntry(#month, int.parse(value))));
    final year = 'yyyy'.toParser().map((token) => digit()
        .repeat(4)
        .flatten()
        .map((value) => MapEntry(#year, int.parse(value))));

    final spacing = whitespace().map((token) =>
        whitespace().star().map((value) => const MapEntry(#unused, 0)));
    final verbatim = any().map(
        (token) => token.toParser().map((value) => const MapEntry(#unused, 0)));

    final entries = [day, month, year, spacing, verbatim].toChoiceParser();
    final format = entries
        .star()
        .end()
        .map((parsers) => parsers.toSequenceParser().map((entries) {
              final arguments = Map.fromEntries(entries);
              return DateTime(
                arguments[#year] ?? DateTime.now().year,
                arguments[#month] ?? DateTime.january,
                arguments[#day] ?? 1,
              );
            }));

    test('iso', () {
      final date = format.parse('yyyy-mm-dd').value;
      expectSuccess(date, '1980-06-11', DateTime(1980, 6, 11));
      expectSuccess(date, '1982-08-24', DateTime(1982, 8, 24));
      expectFailure(date, '1984.10.31', 4, '"-" expected');
    });
    test('europe', () {
      final date = format.parse('dd.mm.yyyy').value;
      expectSuccess(date, '11.06.1980', DateTime(1980, 6, 11));
      expectSuccess(date, '24.08.1982', DateTime(1982, 8, 24));
      expectFailure(date, '1984', 2, '"." expected');
    });
    test('us', () {
      final date = format.parse('mm/dd/yyyy').value;
      expectSuccess(date, '06/11/1980', DateTime(1980, 6, 11));
      expectSuccess(date, '08/24/1982', DateTime(1982, 8, 24));
      expectFailure(date, 'Hello', 0, 'digit expected');
    });
  });
  test('stackoverflow.com/questions/64670722', () {
    final delimited = any().callCC((continuation, context) {
      final delimiter = continuation(context).value.toParser();
      final parser = [
        delimiter,
        delimiter.neg().star().flatten(),
        delimiter,
      ].toSequenceParser().pick(1);
      return parser.parseOn(context);
    });
    expectSuccess(delimited, '"hello"', 'hello');
    expectSuccess(delimited, '/hello/', 'hello');
    expectSuccess(delimited, ',hello,', 'hello');
    expectSuccess(delimited, 'xhellox', 'hello');
    expectFailure(delimited, 'abc', 3, '"a" expected');
  });
  test('function evaluator', () {
    final builder = ExpressionBuilder();
    builder.group()
      ..primitive(digit()
          .plus()
          .seq(char('.').seq(digit().plus()).optional())
          .flatten()
          .trim()
          .map((a) {
        final number = num.parse(a);
        return (num value) => number;
      }))
      ..primitive(char('x').trim().map((_) => (num value) => value))
      ..wrapper(char('(').trim(), char(')').trim(), (_, Evaluator a, __) => a);
    // negation is a prefix operator
    builder.group()
      ..prefix(char('-').trim(), (_, Evaluator a) => (num value) => -a(value));
    // power is right-associative
    builder.group()
      ..right(
          char('^').trim(),
          (Evaluator a, _, Evaluator b) =>
              (num value) => pow(a(value), b(value)));
    // multiplication and addition are left-associative
    builder.group()
      ..left(char('*').trim(),
          (Evaluator a, _, Evaluator b) => (num value) => a(value) * b(value))
      ..left(char('/').trim(),
          (Evaluator a, _, Evaluator b) => (num value) => a(value) / b(value));
    builder.group()
      ..left(char('+').trim(),
          (Evaluator a, _, Evaluator b) => (num value) => a(value) + b(value))
      ..left(char('-').trim(),
          (Evaluator a, _, Evaluator b) => (num value) => a(value) - b(value));
    final parser = builder.build().end();

    final expression = parser.parse('5 * x ^ 3 - 2').value;
    expect(expression(-2), -42);
    expect(expression(-1), -7);
    expect(expression(0), -2);
    expect(expression(1), 3);
    expect(expression(2), 38);
  });
}
