import 'package:source_span/source_span.dart';
import 'package:sqlparser/sqlparser.dart';
import 'package:sqlparser/src/reader/tokenizer/token.dart';
import 'package:sqlparser/src/utils/ast_equality.dart';
import 'package:test/test.dart';

export 'package:sqlparser/src/reader/tokenizer/token.dart';

Token token(TokenType type) {
  return Token(type, null);
}

StringLiteralToken stringLiteral(String value) {
  return StringLiteralToken(value, null);
}

InlineDartToken inlineDart(String dartCode) {
  return InlineDartToken(fakeSpan('`$dartCode`'));
}

IdentifierToken identifier(String content) {
  return IdentifierToken(false, fakeSpan(content));
}

MoorFile parseMoor(String content) {
  return SqlEngine(EngineOptions(useMoorExtensions: true))
      .parseMoorFile(content)
      .rootNode as MoorFile;
}

void testMoorFile(String moorFile, MoorFile expected) {
  final parsed = parseMoor(moorFile);
  enforceHasSpan(parsed);
  enforceEqual(parsed, expected);
}

void testStatement(String sql, AstNode expected, {bool moorMode = false}) {
  final parsed =
      SqlEngine(EngineOptions(useMoorExtensions: moorMode)).parse(sql).rootNode;
  enforceHasSpan(parsed);
  enforceEqual(parsed, expected);
}

FileSpan fakeSpan(String content) {
  return SourceFile.fromString(content).span(0);
}

void testAll(Map<String, AstNode> testCases) {
  testCases.forEach((sql, expected) {
    test('with $sql', () {
      testStatement(sql, expected);
    });
  });
}

/// The parser should make sure [AstNode.hasSpan] is true on relevant nodes.
void enforceHasSpan(AstNode node) {
  final problematic = [node].followedBy(node.allDescendants).firstWhere(
      (node) => !node.hasSpan && !node.synthetic,
      orElse: () => null);

  if (problematic != null) {
    throw ArgumentError('Node $problematic did not have a span');
  }
}
