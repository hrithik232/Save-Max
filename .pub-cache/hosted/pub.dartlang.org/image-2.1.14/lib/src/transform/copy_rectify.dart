import '../image.dart';
import '../util/point.dart';

/// Returns a copy of the [src] image, where the given rectangle
/// has been mapped to the full image.
Image copyRectify(Image src,
    {Point topLeft,
    Point topRight,
    Point bottomLeft,
    Point bottomRight,
    Image toImage}) {
  var dst = toImage ?? Image.from(src);
  for (var y = 0; y < dst.height; ++y) {
    var v = y / (dst.height - 1);
    for (var x = 0; x < dst.width; ++x) {
      var u = x / (dst.width - 1);
      // bilinear interpolation
      var srcPixelCoord = topLeft * (1 - u) * (1 - v) +
          topRight * (u) * (1 - v) +
          bottomLeft * (1 - u) * (v) +
          bottomRight * (u) * (v);
      var srcPixel = src.getPixel(srcPixelCoord.xi, srcPixelCoord.yi);
      dst.setPixel(x, y, srcPixel);
    }
  }
  return dst;
}
