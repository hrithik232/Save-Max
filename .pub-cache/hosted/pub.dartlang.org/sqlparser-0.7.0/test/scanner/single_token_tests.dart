import 'package:sqlparser/src/reader/tokenizer/scanner.dart';
import 'package:sqlparser/src/reader/tokenizer/token.dart';
import 'package:test/test.dart';

void expectFullToken(String token, TokenType type) {
  final scanner = Scanner(token);
  List<Token> tokens;
  try {
    tokens = scanner.scanTokens();
  } catch (e, s) {
    print(e);
    print(s);
    fail('Parsing error while parsing $token');
  }

  if (tokens.length != 2 || tokens.last.type != TokenType.eof) {
    fail('Expected exactly one token when parsing $token, '
        'got ${tokens.length - 1}');
  }

  expect(tokens.first.type, type, reason: '$token is a $type');
  expect(tokens.first.span.text, token);
}

Map<String, TokenType> testCases = {
  '(': TokenType.leftParen,
  ')': TokenType.rightParen,
  ',': TokenType.comma,
  '.': TokenType.dot,
  '+': TokenType.plus,
  '-': TokenType.minus,
  '*': TokenType.star,
  '/': TokenType.slash,
  '<=': TokenType.lessEqual,
  '<': TokenType.less,
  '>=': TokenType.moreEqual,
  '>': TokenType.more,
  '!=': TokenType.exclamationEqual,
  "'hello there'": TokenType.stringLiteral,
  "''": TokenType.stringLiteral,
  '1.123': TokenType.numberLiteral,
  '1.32e5': TokenType.numberLiteral,
  '.123e-3': TokenType.numberLiteral,
  '0xFF13': TokenType.numberLiteral,
  '0Xf13A': TokenType.numberLiteral,
  'SELECT': TokenType.select,
  '"UPDATE"': TokenType.identifier,
  '@foo': TokenType.atSignVariable,
  ':named': TokenType.colonVariable,
  '"spo\uD83C\uDF83ky"': TokenType.identifier,
};

void main() {
  test('parses single tokens', () {
    testCases.forEach(expectFullToken);
  });

  test('can escape strings', () {
    final scanner = Scanner("'what''s up'");
    scanner.scanTokens();

    expect(scanner.tokens, hasLength(2)); // eof token at the end
    expect(
      scanner.tokens.first,
      const TypeMatcher<StringLiteralToken>()
          .having((token) => token.value, 'value', "what's up"),
    );
    expect(scanner.tokens[1].type, TokenType.eof);
  });

  test('issues error for unterminated string literals', () {
    final scanner = Scanner("'unterminated");
    scanner.scanTokens();

    expect(
      scanner.errors,
      contains(const TypeMatcher<TokenizerError>()
          .having((e) => e.message, 'message', 'Unterminated string')),
    );
  });
}
