import 'dart:io';
import 'package:image/image.dart';
import 'package:test/test.dart';

void main() {
  group('PNG', () {
    test('encode', () {
      final image = Image(64, 64);
      image.fill(getColor(100, 200, 255));

      // Encode the image to PNG
      final png = PngEncoder().encodeImage(image);
      File('.dart_tool/out/png/encode.png')
        ..createSync(recursive: true)
        ..writeAsBytesSync(png);
    });

    test('encodeAnimation', () {
      final anim = Animation();
      anim.loopCount = 10;
      for (var i = 0; i < 10; i++) {
        final image = Image(480, 120);
        drawString(image, arial_48, 100, 60, i.toString());
        anim.addFrame(image);
      }

      final png = encodePngAnimation(anim);
      File('.dart_tool/out/png/encodeAnimation.png')
        ..createSync(recursive: true)
        ..writeAsBytesSync(png);
    });

    test('decode', () {
      List<int> bytes = File('.dart_tool/out/png/encode.png').readAsBytesSync();
      final image = PngDecoder().decodeImage(bytes);

      expect(image.width, equals(64));
      expect(image.height, equals(64));
      var c = getColor(100, 200, 255);
      for (var i = 0, len = image.length; i < len; ++i) {
        expect(image[i], equals(c));
      }

      final png = PngEncoder().encodeImage(image);
      File('.dart_tool/out/png/decode.png').writeAsBytesSync(png);
    });

    test('iCCP', () {
      final bytes = File('test/res/png/iCCP.png').readAsBytesSync();
      final image = PngDecoder().decodeImage(bytes);
      expect(image.iccProfile, isNotNull);
      expect(image.iccProfile.data, isNotNull);

      final png = PngEncoder().encodeImage(image);

      final image2 = PngDecoder().decodeImage(png);
      expect(image2.iccProfile, isNotNull);
      expect(image2.iccProfile.data, isNotNull);
      expect(
          image2.iccProfile.data.length, equals(image.iccProfile.data.length));
    });

    final dir = Directory('test/res/png');
    var files = dir.listSync();

    for (var f in files) {
      if (f is! File || !f.path.endsWith('.png')) {
        continue;
      }

      // PngSuite File naming convention:
      // filename:                                g04i2c08.png
      //                                          || ||||
      //  test feature (in this case gamma) ------+| ||||
      //  parameter of test (here gamma-value) ----+ ||||
      //  interlaced or non-interlaced --------------+|||
      //  color-type (numerical) ---------------------+||
      //  color-type (descriptive) --------------------+|
      //  bit-depth ------------------------------------+
      //
      //  color-type:
      //
      //    0g - grayscale
      //    2c - rgb color
      //    3p - paletted
      //    4a - grayscale + alpha channel
      //    6a - rgb color + alpha channel
      //    bit-depth:
      //      01 - with color-type 0, 3
      //      02 - with color-type 0, 3
      //      04 - with color-type 0, 3
      //      08 - with color-type 0, 2, 3, 4, 6
      //      16 - with color-type 0, 2, 4, 6
      //      interlacing:
      //        n - non-interlaced
      //        i - interlaced
      final name = f.path.split(RegExp(r'(/|\\)')).last;

      test('PNG $name', () {
        final file = f as File;

        // x* png's are corrupted and are supposed to crash.
        if (name.startsWith('x')) {
          try {
            var image = PngDecoder().decodeImage(file.readAsBytesSync());
            expect(image, isNull);
          } catch (e) {
            ;
          }
        } else {
          final anim = decodeAnimation(file.readAsBytesSync());
          if (anim.length == 1) {
            final png = PngEncoder().encodeImage(anim[0]);
            File('.dart_tool/out/png/${name}')
              ..createSync(recursive: true)
              ..writeAsBytesSync(png);
          } else {
            for (var i = 0; i < anim.length; ++i) {
              final png = PngEncoder().encodeImage(anim[i]);
              File('.dart_tool/out/png/${name}-$i.png')
                ..createSync(recursive: true)
                ..writeAsBytesSync(png);
            }
          }
        }
      });
    }
  });
}
