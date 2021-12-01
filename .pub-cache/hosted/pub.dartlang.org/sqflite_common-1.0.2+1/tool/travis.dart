import 'dart:io';

import 'package:http/io_client.dart';
import 'package:path/path.dart';
import 'package:process_run/shell_run.dart';

Future<void> main() async {
  final shell = Shell();

  await shell.run('''

dartanalyzer --fatal-warnings --fatal-infos .
dartfmt -n --set-exit-if-changed .
pub run test

''');

  // CODECOV_TOKEN must be defined on travis
  final codeCovToken = userEnvironment['CODECOV_TOKEN'];
  final dartVersion = userEnvironment['TRAVIS_DART_VERSION'];

  if (dartVersion == 'stable') {
    stdout.writeln('Publishing coverage information.');
    if (codeCovToken != null) {
      String bashFilePath;
      try {
        final dir = await Directory.systemTemp.createTemp('sqflite_common');
        bashFilePath = join(dir.path, 'codecov.bash');
        await File(bashFilePath)
            .writeAsString(await IOClient().read('https://codecov.io/bash'));
        await shell.run('bash $bashFilePath');
      } catch (e) {
        stdout.writeln('error $e running $bashFilePath');
      }
    } else {
      stdout.writeln(
          'CODECOV_TOKEN not defined. Not publishing coverage information');
    }
  } else {
    stdout.writeln('No code coverage for non-stable dart version $dartVersion');
  }
}
