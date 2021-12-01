import '../color.dart';
import '../image.dart';

/// Convert the image to grayscale.
Image grayscale(Image src) {
  var p = src.getBytes();
  for (var i = 0, len = p.length; i < len; i += 4) {
    var l = getLuminanceRgb(p[i], p[i + 1], p[i + 2]);
    p[i] = l;
    p[i + 1] = l;
    p[i + 2] = l;
  }
  return src;
}
