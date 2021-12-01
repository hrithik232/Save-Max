// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Generates the FFI mapping files (e.g. lib/src/kernel32.dart)

import 'dart:io';

import 'shared.dart';

String wrapCommentText(String inputText, [int wrapLength = 76]) {
  final words = inputText.split(' ');
  final textLine = StringBuffer('/// ');
  final outputText = StringBuffer();

  for (final word in words) {
    if ((textLine.length + word.length) >= wrapLength) {
      textLine.write('\n');
      outputText.write(textLine);
      textLine.clear();
      textLine.write('/// $word ');
    } else {
      textLine.write('$word ');
    }
  }

  outputText.write(textLine);
  return outputText.toString().trimRight();
}

String generateDocComment(
    String library, String cPrototype, String apiComment) {
  final comment = StringBuffer();

  if (apiComment.isNotEmpty) {
    comment.writeln(wrapCommentText(apiComment));
    comment.writeln('///');
  }

  comment.writeln('/// ```c');
  comment.write('/// ');
  comment.writeln(cPrototype.split('\\n').join('\n/// '));
  comment.writeln('/// ```');

  comment.write('/// {@category $library}');
  return comment.toString();
}

void generateFfiFiles() {
  final libraries = prototypes.values.map((e) => e.dllLibrary).toSet().toList();

  for (final library in libraries) {
    final writer = File('lib/src/$library.dart').openSync(mode: FileMode.write);
    writer.writeStringSync('''
// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Maps FFI prototypes onto the corresponding Win32 API function calls

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'com/combase.dart';
import 'structs.dart';

final _$library = DynamicLibrary.open('$library${library == 'bthprops' ? '.cpl' : '.dll'}');\n
''');
    final libProtos = prototypes.values.where((p) => p.dllLibrary == library);

    for (final proto in libProtos) {
      final apiName = prototypes.keys.firstWhere(
          (k) => prototypes[k].neutralApiName == proto.neutralApiName);
      writer.writeStringSync('''
${generateDocComment(library, proto.prototype.first, proto.comment)}
final ${proto.neutralApiName} = _$library.lookupFunction<\n
  ${proto.nativeReturn} Function(
    ${proto.nativeParams.keys.map((param) => '${proto.nativeParams[param]} $param').join(', ')}),
  ${proto.dartReturn} Function(
    ${proto.dartParams.keys.map((param) => '${proto.dartParams[param]} $param').join(', ')})>
  ('$apiName');

  
''');
    }

    writer.closeSync();
  }
}

void main() {
  loadCsv('tool/win32/win32api.csv');
  generateFfiFiles();
  print('${prototypes.length} typedefs generated.');
}
