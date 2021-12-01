import 'dart:io';

import 'package:test/test.dart';

import 'package:image/image.dart';

int blackcolor = getColor(0, 0, 0);
int whitecolor = getColor(255, 255, 255);

void main() {
  Image image;

  setUp(() {
    image = Image(100, 100);
    image.fill(whitecolor);
  });

  group('vertical', () {
    test('thickness = 1', () {
      // draw a vertical line from (10, 10) to (10, 90) with thickness 1 and color black
      drawLine(image, 10, 10, 10, 90, blackcolor);

      File('.dart_tool/out/line_test_vertical_thickness_1.png')
        ..createSync(recursive: true)
        ..writeAsBytesSync(encodePng(image));

      // verify pixels from (9,10) to (9,90) and (11,10) to (11,90) are white
      for (var x in [9, 11]) {
        for (var y = 10; y < 90; y++) {
          var pixel = image.getPixel(x, y);
          expect(pixel, whitecolor);
        }
      }

      // verify pixels from (10,10) to (10,90) are black
      for (var y = 10; y < 90; y++) {
        var pixel = image.getPixel(10, y);
        expect(pixel, blackcolor);
      }
    });

    test('thickness = 4', () {
      // draw a vertical line from (90, 10) to (90, 90) with thickness 1 and color black
      drawLine(image, 90, 10, 90, 90, blackcolor, thickness: 4);

      File('.dart_tool/out/line_test_vertical_thickness_4.png')
        ..createSync(recursive: true)
        ..writeAsBytesSync(encodePng(image));

      // verify pixels from (87,10) to (87,90) and (93,10) to (93,90) are white
      for (var x in [87, 92]) {
        for (var y = 10; y < 90; y++) {
          var pixel = image.getPixel(x, y);
          expect(pixel, whitecolor);
        }
      }

      // verify pixels from (88,10) through (91,90) are black
      for (var x = 88; x < 92; x++) {
        for (var y = 10; y < 91; y++) {
          var pixel = image.getPixel(x, y);
          expect(pixel, blackcolor);
        }
      }
    });
  });

  group('horizontal', () {
    test('thickness = 1', () {
      // draw a horizontal line from (10,10) to (90,10) with thickness 1 and color black
      drawLine(image, 10, 10, 90, 10, blackcolor);

      File('.dart_tool/out/line_test_horizontal_thickness_1.png')
        ..createSync(recursive: true)
        ..writeAsBytesSync(encodePng(image));

      // verify pixels from (10,9) to (90,9) and (10,11) to (90,11) are white
      for (var y in [9, 11]) {
        for (var x = 10; x < 90; x++) {
          var pixel = image.getPixel(x, y);
          expect(pixel, whitecolor);
        }
      }

      // verify pixels from (90,10) to (90,90) are black
      for (var x = 10; x < 90; x++) {
        var pixel = image.getPixel(x, 10);
        expect(pixel, blackcolor);
      }
    });

    test('thickness = 7', () {
      // draw a vertical line from (10,90) to (90,90) with thickness 7 and color black
      drawLine(image, 10, 90, 90, 90, blackcolor, thickness: 7);

      File('.dart_tool/out/line_test_horizontal_thickness_7.png')
        ..createSync(recursive: true)
        ..writeAsBytesSync(encodePng(image));

      // verify pixels from (10,86) to (90,86) and (10,94) to (90,94) are white
      for (var y in [86, 94]) {
        for (var x = 10; x < 91; x++) {
          var pixel = image.getPixel(x, y);
          expect(pixel, whitecolor);
        }
      }

      // verify pixels from (10,87) through (90,93) are black
      for (var y = 87; y < 94; y++) {
        for (var x = 10; x < 91; x++) {
          var pixel = image.getPixel(x, y);
          expect(pixel, blackcolor);
        }
      }
    });
  });

  group('single point', () {
    test('thickness = 1', () {
      drawLine(image, 50, 50, 50, 50, blackcolor);

      File('.dart_tool/out/line_test_point_thickness_1.png')
        ..createSync(recursive: true)
        ..writeAsBytesSync(encodePng(image));

      expect(image.getPixel(50, 50), blackcolor);

      for (var x = 49; x <= 51; x++) {
        for (var y = 49; y <= 51; y++) {
          if (x == 50 && y == 50) continue;
          var pixel = image.getPixel(x, y);
          expect(pixel, whitecolor);
        }
      }
    });

    test('thickness = 3', () {
      drawLine(image, 50, 50, 50, 50, blackcolor, thickness: 3);

      File('.dart_tool/out/line_test_point_thickness_3.png')
        ..createSync(recursive: true)
        ..writeAsBytesSync(encodePng(image));

      var blackPixels = [
        Point(49, 50),
        Point(50, 49),
        Point(50, 50),
        Point(50, 51),
        Point(51, 50)
      ];

      for (var pt in blackPixels) {
        expect(image.getPixel(pt.xi, pt.yi), blackcolor);
      }

      for (var x = 48; x <= 52; x++) {
        for (var y = 48; y <= 52; y++) {
          var pt = Point(x, y);
          if (!blackPixels.contains(pt)) {
            var pixel = image.getPixel(pt.xi, pt.yi);
            expect(pixel, whitecolor);
          }
        }
      }
    });

    test('thickness = 4', () {
      drawLine(image, 50, 50, 50, 50, blackcolor, thickness: 4);

      File('.dart_tool/out/line_test_point_thickness_4.png')
        ..createSync(recursive: true)
        ..writeAsBytesSync(encodePng(image));

      var blackPixels = [
        Point(48, 49), Point(48, 50), Point(48, 51), // column 1
        Point(49, 48), Point(49, 49), Point(49, 50), Point(49, 51),
        Point(49, 52), // column 2
        Point(50, 48), Point(50, 49), Point(50, 50), Point(50, 51),
        Point(50, 52), // column 3
        Point(51, 48), Point(51, 49), Point(51, 50), Point(51, 51),
        Point(51, 52), // column 4
        Point(52, 49), Point(52, 50), Point(52, 51) // column 5
      ];

      for (var pt in blackPixels) {
        expect(image.getPixel(pt.xi, pt.yi), blackcolor);
      }

      for (var x = 47; x <= 53; x++) {
        for (var y = 47; y <= 53; y++) {
          var pt = Point(x, y);
          if (!blackPixels.contains(pt)) {
            var pixel = image.getPixel(pt.xi, pt.yi);
            expect(pixel, whitecolor);
          }
        }
      }
    });

    test('fillCircle', () {
      fillCircle(image, 50, 50, 7, blackcolor);

      File('.dart_tool/out/line_test_fillCircle.png')
        ..createSync(recursive: true)
        ..writeAsBytesSync(encodePng(image));
    });
  });
}
