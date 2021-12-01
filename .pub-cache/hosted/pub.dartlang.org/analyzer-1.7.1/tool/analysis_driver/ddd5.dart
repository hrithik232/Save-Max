import 'dart:io' as io;

import 'package:analyzer/src/summary2/package_bundle_format.dart';

main() async {
  var path = '/Users/scheglov/Source/Dart/sdk.git/sdk/1.sum';
  var bytes = io.File(path).readAsBytesSync();
  var reader = PackageBundleReader(bytes);
  print(reader.resolutionBytes.length);
}
