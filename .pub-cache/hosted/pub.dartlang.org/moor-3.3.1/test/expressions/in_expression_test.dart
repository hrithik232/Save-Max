import 'package:test/test.dart';
import 'package:moor/moor.dart';

import '../data/tables/todos.dart';
import '../data/utils/expect_generated.dart';

void main() {
  test('in expressions are generated', () {
    final innerExpression = GeneratedTextColumn('name', null, true);
    final isInExpression = innerExpression.isIn(['Max', 'Tobias']);

    final context = GenerationContext.fromDb(TodoDb(null));
    isInExpression.writeInto(context);

    expect(context.sql, 'name IN (?, ?)');
    expect(context.boundVariables, ['Max', 'Tobias']);
  });

  test('not in expressions are generated', () {
    final innerExpression = GeneratedTextColumn('name', null, true);
    final isNotIn = innerExpression.isNotIn(['Max', 'Tobias']);

    expect(isNotIn, generates('name NOT IN (?, ?)', ['Max', 'Tobias']));
  });
}
