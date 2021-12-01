import 'dart:io';
import 'package:path/path.dart' as path;
import 'input_file_stream.dart';
import 'output_file_stream.dart';
import '../archive_file.dart';
import '../zip_encoder.dart';

class ZipFileEncoder {
  String zip_path;
  OutputFileStream _output;
  ZipEncoder _encoder;

  static const int STORE = 0;
  static const int GZIP = 1;

  void zipDirectory(Directory dir, {String filename}) {
    final dirPath = dir.path;
    final zip_path = filename ?? '${dirPath}.zip';
    create(zip_path);
    addDirectory(dir, includeDirName: false);
    close();
  }

  void open(String zip_path) => create(zip_path);

  void create(String zip_path) {
    this.zip_path = zip_path;

    _output = OutputFileStream(zip_path);
    _encoder = ZipEncoder();
    _encoder.startEncode(_output);
  }

  void addDirectory(Directory dir, {bool includeDirName = true}) {
    List files = dir.listSync(recursive: true);
    for (var file in files) {
      if (file is! File) {
        continue;
      }

      final f = file as File;
      final dir_name = path.basename(dir.path);
      final rel_path = path.relative(f.path, from: dir.path);
      addFile(f, includeDirName ? (dir_name + '/' + rel_path) : rel_path);
    }
  }

  void addFile(File file, [String filename]) {
    var file_stream = InputFileStream.file(file);
    var f = ArchiveFile.stream(
        filename ?? path.basename(file.path),
        file.lengthSync(),
        file_stream);

    f.lastModTime = file.lastModifiedSync().millisecondsSinceEpoch;
    f.mode = file.statSync().mode;

    _encoder.addFile(f);
    file_stream.close();
  }

  void close() {
    _encoder.endEncode();
    _output.close();
  }
}
