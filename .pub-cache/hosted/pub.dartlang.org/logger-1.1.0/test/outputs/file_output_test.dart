import 'dart:io';
import 'package:test/test.dart';
import 'package:logger/logger.dart';
import 'package:logger/src/outputs/file_output.dart';

void main() {
  final tempDir = Directory.systemTemp.createTempSync();
  final tempFile = File('${tempDir.path}/file_output.log')..createSync();
  final output = FileOutput(file: tempFile)..init();
  final event = OutputEvent(Level.info, ['hi there']);
  output.output(event);

  tempDir.deleteSync(recursive: true);
}
