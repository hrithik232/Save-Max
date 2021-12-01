import '../../internal/internal.dart';
import '../decode_info.dart';
import 'png_frame.dart';
import 'dart:typed_data';

class PngInfo extends DecodeInfo {
  int bits;
  int colorType;
  int compressionMethod;
  int filterMethod;
  int interlaceMethod;
  List<int> palette;
  List<int> transparency;
  List<int> colorLut;
  double gamma;
  @override
  int backgroundColor = 0x00ffffff;
  String iCCPName = '';
  int iCCPCompression = 0;
  Uint8List iCCPData;

  // APNG extensions
  @override
  int numFrames = 1;
  int repeat = 0;
  final frames = <PngFrame>[];

  final _idat = <int>[];

  bool get isAnimated => frames.isNotEmpty;
}

@internal
class InternalPngInfo extends PngInfo {
  List<int> get idat => _idat;
}
