import 'package:sqlparser/sqlparser.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  test('parses limit components', () {
    testStatement(
      r'SELECT * FROM tbl LIMIT $limit',
      SelectStatement(
        columns: [StarResultColumn(null)],
        from: TableReference('tbl', null),
        limit: DartLimitPlaceholder(name: 'limit'),
      ),
      moorMode: true,
    );
  });

  test('parses limit count as expressions', () {
    testStatement(
      r'SELECT * FROM tbl LIMIT $amount OFFSET 3',
      SelectStatement(
        columns: [StarResultColumn(null)],
        from: TableReference('tbl', null),
        limit: Limit(
          count: DartExpressionPlaceholder(name: 'amount'),
          offsetSeparator: token(TokenType.offset),
          offset: NumericLiteral(3, token(TokenType.numberLiteral)),
        ),
      ),
      moorMode: true,
    );
  });

  test('parses ordering terms and ordering expressions', () {
    testStatement(
      r'SELECT * FROM tbl ORDER BY $term, $expr DESC',
      SelectStatement(
        columns: [StarResultColumn(null)],
        from: TableReference('tbl', null),
        orderBy: OrderBy(
          terms: [
            DartOrderingTermPlaceholder(name: 'term'),
            OrderingTerm(
              expression: DartExpressionPlaceholder(name: 'expr'),
              orderingMode: OrderingMode.descending,
            ),
          ],
        ),
      ),
      moorMode: true,
    );
  });

  test('parses full order by placeholders', () {
    testStatement(
      r'SELECT * FROM tbl ORDER BY $order',
      SelectStatement(
        columns: [StarResultColumn(null)],
        from: TableReference('tbl', null),
        orderBy: DartOrderByPlaceholder(name: 'order'),
      ),
      moorMode: true,
    );
  });
}
