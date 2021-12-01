import 'package:moor/moor.dart';
import 'package:moor/moor.dart' as moor;
import 'package:test/test.dart';

import '../data/tables/todos.dart';
import '../data/utils/expect_equality.dart';

void main() {
  final innerExpression = GeneratedTextColumn('name', null, true);

  test('IS NULL expressions are generated', () {
    final expr = moor.isNull(innerExpression);

    final context = GenerationContext.fromDb(TodoDb(null));
    expr.writeInto(context);

    expect(context.sql, 'name IS NULL');
  });

  test('IS NOT NULL expressions are generated', () {
    final expr = moor.isNotNull(innerExpression);

    final context = GenerationContext.fromDb(TodoDb(null));
    expr.writeInto(context);

    expect(context.sql, 'name IS NOT NULL');

    expectEquals(expr, moor.isNotNull(innerExpression));
  });
}
