import 'package:moor/moor.dart';
import 'package:test/test.dart';

import '../data/utils/expect_generated.dart';

void main() {
  const x = CustomExpression<String>('x');
  const y = CustomExpression<int>('y');

  test('WHEN without ELSE', () {
    expect(
      x.caseMatch<int>(when: {
        const Constant('a'): const Constant(1),
        const Constant('b'): const Constant(2),
      }),
      generates("CASE x WHEN 'a' THEN 1 WHEN 'b' THEN 2 END"),
    );
  });

  test('WHEN with ELSE', () {
    expect(
      x.caseMatch<int>(
        when: {
          const Constant('a'): const Constant(1),
        },
        orElse: y,
      ),
      generates("CASE x WHEN 'a' THEN 1 ELSE y END"),
    );
  });

  test('does not allow empty WHEN map', () {
    expect(() => x.caseMatch(when: const {}), throwsA(isA<ArgumentError>()));
  });
}
