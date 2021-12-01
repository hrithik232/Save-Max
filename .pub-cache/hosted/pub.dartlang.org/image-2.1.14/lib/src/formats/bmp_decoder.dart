import '../animation.dart';
import '../image.dart';
import '../util/input_buffer.dart';
import 'decoder.dart';
import 'bmp/bmp_info.dart';

class BmpDecoder extends Decoder {
  InputBuffer _input;
  BmpInfo info;

  /// Is the given file a valid BMP image?
  @override
  bool isValidFile(List<int> data) {
    return BitmapFileHeader.isValidFile(InputBuffer(data));
  }

  @override
  int numFrames() => info != null ? info.numFrames : 0;

  @override
  BmpInfo startDecode(List<int> bytes) {
    if (!isValidFile(bytes)) return null;
    _input = InputBuffer(bytes);
    info = BmpInfo(_input);
    return info;
  }

  /// Decode a single frame from the data stat was set with [startDecode].
  /// If [frame] is out of the range of available frames, null is returned.
  /// Non animated image files will only have [frame] 0. An [AnimationFrame]
  /// is returned, which provides the image, and top-left coordinates of the
  /// image, as animated frames may only occupy a subset of the canvas.
  @override
  Image decodeFrame(int frame) {
    _input.offset = info.file.offset;
    var bytesPerPixel = info.bpp >> 3;
    var rowStride = (info.width * bytesPerPixel);
    while (rowStride % 4 != 0) {
      rowStride++;
    }

    var image = Image(info.width, info.height, channels: Channels.rgb);

    for (var y = image.height - 1; y >= 0; --y) {
      var line = info.readBottomUp ? y : image.height - 1 - y;
      var row = _input.readBytes(rowStride);
      for (var x = 0; x < image.width; ++x) {
        final color = info.decodeRgba(row);
        image.setPixel(x, line, color);
      }
    }

    return image;
  }

  /// Decode the file and extract a single image from it. If the file is
  /// animated, the specified [frame] will be decoded. If there was a problem
  /// decoding the file, null is returned.
  @override
  Image decodeImage(List<int> data, {int frame = 0}) {
    if (!isValidFile(data)) return null;
    startDecode(data);
    return decodeFrame(frame);
  }

  /// Decode all of the frames from an animation. If the file is not an
  /// animation, a single frame animation is returned. If there was a problem
  /// decoding the file, null is returned.
  @override
  Animation decodeAnimation(List<int> data) {
    if (!isValidFile(data)) return null;
    var image = decodeImage(data);

    var anim = Animation();
    anim.width = image.width;
    anim.height = image.height;
    anim.addFrame(image);

    return anim;
  }
}
