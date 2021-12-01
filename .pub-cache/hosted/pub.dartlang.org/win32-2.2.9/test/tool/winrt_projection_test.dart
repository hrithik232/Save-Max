@TestOn('windows')

import 'package:test/test.dart';
import 'package:winmd/winmd.dart';

import '../../tool/metadata/projection/typeprojector.dart';

void main() {
  test('Class valuetype is correctly identified', () {
    final winTypeDef = MetadataStore.getMetadataForType(
        'Windows.Storage.Pickers.IFileOpenPicker')!;

    final method = winTypeDef.findMethod('put_ViewMode')!;
    final classType = method.parameters.first.typeIdentifier;
    final typeProjection = TypeProjector(classType);

    expect(typeProjection.isTypeValueType, isTrue);
  });

  test('Property getter projects appropriate results for interface.', () {
    final winTypeDef =
        MetadataStore.getMetadataForType('Windows.Media.Playback.MediaPlayer')!;

    final method = winTypeDef.findMethod('get_Source')!;
    final typeProjection = TypeProjector(method.returnType.typeIdentifier);
    expect(typeProjection.dartType, equals('Pointer'));
    expect(typeProjection.nativeType, equals('Pointer'));
  });

  test('Property setter projects appropriate results for delegate.', () {
    final winTypeDef =
        MetadataStore.getMetadataForType('Windows.Foundation.IAsyncAction')!;

    final method = winTypeDef.findMethod('put_Completed')!;
    final typeProjection =
        TypeProjector(method.parameters.first.typeIdentifier);
    expect(typeProjection.dartType, equals('Pointer'));
    expect(typeProjection.nativeType, equals('Pointer'));
  });
}
