import 'dart:html';
import 'dart:math';
import 'package:image/image.dart';

double logN(num x, num div) {
  return log(x) / div;
}

/// Render the Mandelbrot Set into an Image and display it.
void main() {
  const width = 1024;
  const height = 1024;

  // Create a canvas to put our decoded image into.
  var c = CanvasElement(width: width, height: height);
  document.body.append(c);

  var zoom = 1.0;
  var moveX = -0.5;
  var moveY = 0.0;
  const MaxIterations = 255;
  const radius = 2.0;
  const radius_squared = radius * radius;
  final log2 = log(2.0);
  var Log2MaxIterations = logN(MaxIterations, log2);
  const h_2 = height / 2.0;
  const w_2 = width / 2.0;
  const aspect = 0.5;

  var image = Image(width, height);
  for (var y = 0; y < height; ++y) {
    var pi = (y - h_2) / (0.5 * zoom * aspect * height) + moveY;

    for (var x = 0; x < width; ++x) {
      var pr = 1.5 * (x - w_2) / (0.5 * zoom * width) + moveX;

      var newRe = 0.0;
      var newIm = 0.0;
      var i = 0;
      for (; i < MaxIterations; i++) {
        var oldRe = newRe;
        var oldIm = newIm;

        newRe = oldRe * oldRe - oldIm * oldIm + pr;
        newIm = 2.0 * oldRe * oldIm + pi;

        if ((newRe * newRe + newIm * newIm) > radius_squared) {
          break;
        }
      }

      if (i == MaxIterations) {
        image.setPixelRgba(x, y, 0, 0, 0);
      } else {
        var z = sqrt(newRe * newRe + newIm * newIm);
        var b = 256.0 *
            logN(1.75 + i - logN(logN(z, log2), log2), log2) /
            Log2MaxIterations;
        var brightness = b.toInt();
        image.setPixelRgba(x, y, brightness, brightness, 255);
      }
    }
  }

  // Create a buffer that the canvas can draw.
  var d = c.context2D.createImageData(image.width, image.height);
  // Fill the buffer with our image data.
  d.data.setRange(0, d.data.length, image.getBytes(format: Format.rgba));
  // Draw the buffer onto the canvas.
  c.context2D.putImageData(d, 0, 0);
}
