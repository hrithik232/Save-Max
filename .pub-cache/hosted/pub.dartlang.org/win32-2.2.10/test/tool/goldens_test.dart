@TestOn('windows')

import 'dart:io';

import 'package:test/test.dart';
import 'package:winmd/winmd.dart';

import '../../tool/metadata/projection/typeprinter.dart';

void main() {
  test('Windows Runtime golden', () {
    const type = 'Windows.Foundation.IAsyncInfo';
    final typeDef = MetadataStore.getMetadataForType(type)!;
    final dartClass = TypePrinter.printType(typeDef);

    File('test/tool/goldens/IAsyncInfo.comparison')
        .writeAsStringSync(dartClass);
    final golden =
        File('test/tool/goldens/IAsyncInfo.golden').readAsStringSync();
    expect(dartClass, equalsIgnoringWhitespace(golden));
  });

  test('COM golden', () {
    const typeToGenerate =
        'Windows.Win32.Networking.NetworkListManager.INetwork';
    final scope = MetadataStore.getWin32Scope();
    final typedef = scope.findTypeDef(typeToGenerate)!;

    final dartClass = TypePrinter.printType(typedef);

    File('test/tool/goldens/INetwork.comparison').writeAsStringSync(dartClass);
    final golden = File('test/tool/goldens/INetwork.golden').readAsStringSync();

    expect(dartClass, equalsIgnoringWhitespace(golden));
  });
}
