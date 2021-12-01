import 'package:test/test.dart';
import 'package:sqlparser/sqlparser.dart';

import 'utils.dart';

void main() {
  test('parses insert statements', () {
    testStatement(
      'INSERT OR REPLACE INTO tbl (a, b, c) VALUES (d, e, f)',
      InsertStatement(
        mode: InsertMode.insertOrReplace,
        table: TableReference('tbl', null),
        targetColumns: [
          Reference(columnName: 'a'),
          Reference(columnName: 'b'),
          Reference(columnName: 'c'),
        ],
        source: ValuesSource([
          Tuple(expressions: [
            Reference(columnName: 'd'),
            Reference(columnName: 'e'),
            Reference(columnName: 'f'),
          ]),
        ]),
      ),
    );
  });

  test('insert statement with default values', () {
    testStatement(
      'INSERT INTO tbl DEFAULT VALUES',
      InsertStatement(
        mode: InsertMode.insert,
        table: TableReference('tbl', null),
        targetColumns: const [],
        source: const DefaultValues(),
      ),
    );
  });

  test('insert statement with select as source', () {
    testStatement(
      'REPLACE INTO tbl SELECT * FROM tbl',
      InsertStatement(
        mode: InsertMode.replace,
        table: TableReference('tbl', null),
        targetColumns: const [],
        source: SelectInsertSource(
          SelectStatement(
            columns: [StarResultColumn(null)],
            from: [TableReference('tbl', null)],
          ),
        ),
      ),
    );
  });

  group('parses upsert clauses', () {
    const prefix = 'INSERT INTO tbl DEFAULT VALUES ON CONFLICT';
    test('without listing indexed columns', () {
      testStatement(
        '$prefix DO NOTHING',
        InsertStatement(
          table: TableReference('tbl'),
          targetColumns: const [],
          source: const DefaultValues(),
          upsert: UpsertClause(action: DoNothing()),
        ),
      );
    });

    test('listing indexed columns without where clause', () {
      testStatement(
        '$prefix (foo, bar DESC) DO NOTHING',
        InsertStatement(
          table: TableReference('tbl'),
          targetColumns: const [],
          source: const DefaultValues(),
          upsert: UpsertClause(
            onColumns: [
              IndexedColumn(Reference(columnName: 'foo')),
              IndexedColumn(
                Reference(columnName: 'bar'),
                OrderingMode.descending,
              ),
            ],
            action: DoNothing(),
          ),
        ),
      );
    });

    test('listing indexed columns and where clause', () {
      testStatement(
        '$prefix (foo, bar) WHERE 2 = foo DO NOTHING',
        InsertStatement(
          table: TableReference('tbl'),
          targetColumns: const [],
          source: const DefaultValues(),
          upsert: UpsertClause(
            onColumns: [
              IndexedColumn(Reference(columnName: 'foo')),
              IndexedColumn(Reference(columnName: 'bar')),
            ],
            where: BinaryExpression(
              NumericLiteral(2, token(TokenType.numberLiteral)),
              token(TokenType.equal),
              Reference(columnName: 'foo'),
            ),
            action: DoNothing(),
          ),
        ),
      );
    });

    test('having an update action without where', () {
      testStatement(
        '$prefix DO UPDATE SET foo = 2',
        InsertStatement(
          table: TableReference('tbl'),
          targetColumns: const [],
          source: const DefaultValues(),
          upsert: UpsertClause(
            action: DoUpdate(
              [
                SetComponent(
                  column: Reference(columnName: 'foo'),
                  expression: NumericLiteral(2, token(TokenType.numberLiteral)),
                ),
              ],
            ),
          ),
        ),
      );
    });

    test('having an update action with where', () {
      testStatement(
        '$prefix DO UPDATE SET foo = 2 WHERE ?',
        InsertStatement(
          table: TableReference('tbl'),
          targetColumns: const [],
          source: const DefaultValues(),
          upsert: UpsertClause(
            action: DoUpdate(
              [
                SetComponent(
                  column: Reference(columnName: 'foo'),
                  expression: NumericLiteral(2, token(TokenType.numberLiteral)),
                ),
              ],
              where: NumberedVariable(
                QuestionMarkVariableToken(fakeSpan('?'), null),
              ),
            ),
          ),
        ),
      );
    });
  });
}
