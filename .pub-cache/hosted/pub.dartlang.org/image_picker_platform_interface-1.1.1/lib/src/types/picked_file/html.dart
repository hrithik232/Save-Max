import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http show readBytes;

import './base.dart';

/// A PickedFile that works on web.
///
/// It wraps the bytes of a selected file.
class PickedFile extends PickedFileBase {
  final String path;
  final Uint8List _initBytes;

  /// Construct a PickedFile object from its ObjectUrl.
  ///
  /// Optionally, this can be initialized with `bytes`
  /// so no http requests are performed to retrieve files later.
  PickedFile(this.path, {Uint8List bytes})
      : _initBytes = bytes,
        super(path);

  Future<Uint8List> get _bytes async {
    if (_initBytes != null) {
      return Future.value(UnmodifiableUint8ListView(_initBytes));
    }
    return http.readBytes(path);
  }

  @override
  Future<String> readAsString({Encoding encoding = utf8}) async {
    return encoding.decode(await _bytes);
  }

  @override
  Future<Uint8List> readAsBytes() async {
    return Future.value(await _bytes);
  }

  @override
  Stream<Uint8List> openRead([int start, int end]) async* {
    final bytes = await _bytes;
    yield bytes.sublist(start ?? 0, end ?? bytes.length);
  }
}
