import 'dart:typed_data';

import '../../image_exception.dart';
import '../../internal/internal.dart';
import '../../util/input_buffer.dart';
import '../../util/output_buffer.dart';
import 'exr_compressor.dart';
import 'exr_huffman.dart';
import 'exr_part.dart';
import 'exr_wavelet.dart';

/// Wavelet compression
abstract class ExrPizCompressor extends ExrCompressor {
  factory ExrPizCompressor(
          ExrPart header, int maxScanLineSize, int numScanLines) =
      InternalExrPizCompressor;
}

@internal
class InternalExrPizCompressor extends InternalExrCompressor
    implements ExrPizCompressor {
  InternalExrPizCompressor(ExrPart header, this._maxScanLineSize,
      this._numScanLines)
      : super(header as InternalExrPart) {
    _channelData = List<_PizChannelData>(header.channels.length);
    for (var i = 0; i < _channelData.length; ++i) {
      _channelData[i] = _PizChannelData();
    }

    var tmpBufferSize = (_maxScanLineSize * _numScanLines) ~/ 2;
    _tmpBuffer = Uint16List(tmpBufferSize);
  }

  @override
  int numScanLines() => _numScanLines;

  @override
  Uint8List compress(InputBuffer inPtr, int x, int y, [int width, int height]) {
    throw ImageException('Piz compression not yet supported.');
  }

  @override
  Uint8List uncompress(InputBuffer inPtr, int x, int y,
      [int width, int height]) {
    width ??= header.width;
    height ??= header.linesInBuffer;

    var minX = x;
    var maxX = x + width - 1;
    var minY = y;
    var maxY = y + height - 1;

    if (maxX > header.width) {
      maxX = header.width - 1;
    }
    if (maxY > header.height) {
      maxY = header.height - 1;
    }

    decodedWidth = (maxX - minX) + 1;
    decodedHeight = (maxY - minY) + 1;

    var tmpBufferEnd = 0;
    var channels = header.channels;
    final numChannels = channels.length;

    for (var i = 0; i < numChannels; ++i) {
      var ch = channels[i];
      var cd = _channelData[i];
      cd.start = tmpBufferEnd;
      cd.end = cd.start;

      cd.nx = numSamples(ch.xSampling, minX, maxX);
      cd.ny = numSamples(ch.ySampling, minY, maxY);
      cd.ys = ch.ySampling;

      cd.size = ch.size ~/ 2; //2=size(HALF)

      tmpBufferEnd += cd.nx * cd.ny * cd.size;
    }

    var minNonZero = inPtr.readUint16();
    var maxNonZero = inPtr.readUint16();

    if (maxNonZero >= BITMAP_SIZE) {
      throw ImageException('Error in header for PIZ-compressed data '
          '(invalid bitmap size).');
    }

    var bitmap = Uint8List(BITMAP_SIZE);
    if (minNonZero <= maxNonZero) {
      var b = inPtr.readBytes(maxNonZero - minNonZero + 1);
      for (var i = 0, j = minNonZero, len = b.length; i < len; ++i) {
        bitmap[j++] = b[i];
      }
    }

    var lut = Uint16List(USHORT_RANGE);
    var maxValue = _reverseLutFromBitmap(bitmap, lut);

    // Huffman decoding
    var length = inPtr.readUint32();
    ExrHuffman.uncompress(inPtr, length, _tmpBuffer, tmpBufferEnd);

    // Wavelet decoding
    for (var i = 0; i < numChannels; ++i) {
      var cd = _channelData[i];
      for (var j = 0; j < cd.size; ++j) {
        ExrWavelet.decode(_tmpBuffer, cd.start + j, cd.nx, cd.size, cd.ny,
            cd.nx * cd.size, maxValue);
      }
    }

    // Expand the pixel data to their original range
    _applyLut(lut, _tmpBuffer, tmpBufferEnd);

    _output ??= OutputBuffer(
        size: (_maxScanLineSize * _numScanLines) + (65536 + 8192));

    _output.rewind();

    //int count = 0;
    // Rearrange the pixel data into the format expected by the caller.
    for (var y = minY; y <= maxY; ++y) {
      for (var i = 0; i < numChannels; ++i) {
        var cd = _channelData[i];

        if ((y % cd.ys) != 0) {
          continue;
        }

        for (var x = cd.nx * cd.size; x > 0; --x) {
          _output.writeUint16(_tmpBuffer[cd.end++]);
        }
      }
    }

    return _output.getBytes() as Uint8List;
  }

  void _applyLut(List<int> lut, List<int> data, int nData) {
    for (var i = 0; i < nData; ++i) {
      data[i] = lut[data[i]];
    }
  }

  int _reverseLutFromBitmap(Uint8List bitmap, Uint16List lut) {
    var k = 0;
    for (var i = 0; i < USHORT_RANGE; ++i) {
      if ((i == 0) || (bitmap[i >> 3] & (1 << (i & 7))) != 0) {
        lut[k++] = i;
      }
    }

    var n = k - 1;

    while (k < USHORT_RANGE) {
      lut[k++] = 0;
    }

    return n; // maximum k where lut[k] is non-zero,
  }

  static const USHORT_RANGE = 1 << 16;
  static const BITMAP_SIZE = 8192;

  OutputBuffer _output;
  final int _maxScanLineSize;
  final int _numScanLines;
  List<_PizChannelData> _channelData;
  Uint16List _tmpBuffer;
}

class _PizChannelData {
  int start;
  int end;
  int nx;
  int ny;
  int ys;
  int size;
}
