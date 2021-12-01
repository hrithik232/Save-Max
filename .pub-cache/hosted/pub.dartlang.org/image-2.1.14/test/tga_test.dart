import 'dart:io';
import 'package:image/image.dart';
import 'package:test/test.dart';

void main() {
  var dir = Directory('res/tga');
  if (!dir.existsSync()) {
    return;
  }
  var files = dir.listSync();

  group('TGA', () {
    for (var f in files) {
      if (f is! File || !f.path.endsWith('.tga')) {
        continue;
      }

      var name = f.path.split(RegExp(r'(/|\\)')).last;
      test('$name', () {
        var bytes = (f as File).readAsBytesSync();
        var image = TgaDecoder().decodeImage(bytes);
        if (image == null) {
          throw ImageException('Unable to decode TGA Image: $name.');
        }

        var png = PngEncoder().encodeImage(image);
        File('.dart_tool/out/tga/${name}.png')
          ..createSync(recursive: true)
          ..writeAsBytesSync(png);
      });
    }

    test('decode/encode', () {
      var bytes = File('res/tga/globe.tga').readAsBytesSync();

      // Decode the image from file.
      var image = TgaDecoder().decodeImage(bytes);
      expect(image.width, equals(128));
      expect(image.height, equals(128));

      // Encode the image as a tga
      var tga = TgaEncoder().encodeImage(image);

      File('.dart_tool/out/globe.tga')
        ..createSync(recursive: true)
        ..writeAsBytesSync(tga);

      // Decode the encoded image, make sure it's the same as the original.
      var image2 = TgaDecoder().decodeImage(tga);
      expect(image2.width, equals(128));
      expect(image2.height, equals(128));
    });
  });
}
