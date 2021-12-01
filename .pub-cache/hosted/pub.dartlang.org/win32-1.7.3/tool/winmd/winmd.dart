// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Parse the Windows Metadata for a type and interpret its metadata

// Sources of inspiration:
// https://stackoverflow.com/questions/54375771/how-to-read-a-winmd-winrt-metadata-file
// https://docs.microsoft.com/en-us/windows/win32/api/rometadataresolution/nf-rometadataresolution-rogetmetadatafile
// https://www.ecma-international.org/publications/files/ECMA-ST/ECMA-335.pdf

import 'dart:io';

import 'md_store.dart';
import 'type_builder.dart';
import 'type_printer.dart';

final typesToGenerate = [
  // 'Windows.Storage.Pickers.IFileOpenPicker',
  // 'Windows.Globalization.ICalendar',
  'Windows.Foundation.IPropertyValue',
  'Windows.Foundation.IAsyncInfo',
  'Windows.Foundation.IClosable',
  'Windows.Foundation.IStringable',
];

void main(List<String> args) {
  final outputDirectory = (args.length == 1)
      ? Directory(args.first)
      : Directory('lib/src/generated');

  for (final type in typesToGenerate) {
    final mdTypeDef = WinmdStore.getMetadataForType(type);
    final projection = TypeBuilder.projectWinMdType(mdTypeDef);
    final dartClass = TypePrinter.printType(projection);

    final outputFilename = type.split('.').last;
    final outputFile =
        File('${outputDirectory.uri.toFilePath()}$outputFilename.dart');

    print('Writing:    ${outputFile.path}');
    outputFile.writeAsStringSync(dartClass);
  }
}
