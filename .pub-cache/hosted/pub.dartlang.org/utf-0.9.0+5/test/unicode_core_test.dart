// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library utf.unicode_core_test;

import 'package:test/test.dart';
import 'package:utf/utf.dart';
import 'package:utf/src/util.dart';

import 'expect.dart' as expect;

void main() {
  test('codepoints to utf16 codepoints', testCodepointsToUtf16CodeUnits);
  test('utf16 bytes to codepoints', testUtf16bytesToCodepoints);
}

void testCodepointsToUtf16CodeUnits() {
  // boundary conditions
  expect.listEquals([], codepointsToUtf16CodeUnits([]), "no input");
  expect.listEquals([0x0], codepointsToUtf16CodeUnits([0x0]), "0");
  expect.listEquals(
      [0xd800, 0xdc00], codepointsToUtf16CodeUnits([0x10000]), "10000");

  expect.listEquals([0xffff], codepointsToUtf16CodeUnits([0xffff]), "ffff");
  expect.listEquals(
      [0xdbff, 0xdfff], codepointsToUtf16CodeUnits([0x10ffff]), "10ffff");

  expect.listEquals([0xd7ff], codepointsToUtf16CodeUnits([0xd7ff]), "d7ff");
  expect.listEquals([0xe000], codepointsToUtf16CodeUnits([0xe000]), "e000");

  expect.listEquals([UNICODE_REPLACEMENT_CHARACTER_CODEPOINT],
      codepointsToUtf16CodeUnits([0xd800]), "d800");
  expect.listEquals([UNICODE_REPLACEMENT_CHARACTER_CODEPOINT],
      codepointsToUtf16CodeUnits([0xdfff]), "dfff");
}

void testUtf16bytesToCodepoints() {
  // boundary conditions: First possible values
  expect.listEquals([], utf16CodeUnitsToCodepoints([]), "no input");
  expect.listEquals([0x0], utf16CodeUnitsToCodepoints([0x0]), "0");
  expect.listEquals(
      [0x10000], utf16CodeUnitsToCodepoints([0xd800, 0xdc00]), "10000");

  // boundary conditions: Last possible sequence of a certain length
  expect.listEquals([0xffff], utf16CodeUnitsToCodepoints([0xffff]), "ffff");
  expect.listEquals(
      [0x10ffff], utf16CodeUnitsToCodepoints([0xdbff, 0xdfff]), "10ffff");

  // other boundary conditions
  expect.listEquals([0xd7ff], utf16CodeUnitsToCodepoints([0xd7ff]), "d7ff");
  expect.listEquals([0xe000], utf16CodeUnitsToCodepoints([0xe000]), "e000");

  // unexpected continuation bytes
  expect.listEquals([0xfffd], utf16CodeUnitsToCodepoints([0xdc00]),
      "dc00 first unexpected continuation byte");
  expect.listEquals([0xfffd], utf16CodeUnitsToCodepoints([0xdfff]),
      "dfff last unexpected continuation byte");
  expect.listEquals([0xfffd], utf16CodeUnitsToCodepoints([0xdc00]),
      "1 unexpected continuation bytes");
  expect.listEquals(
      [0xfffd, 0xfffd],
      utf16CodeUnitsToCodepoints([0xdc00, 0xdc00]),
      "2 unexpected continuation bytes");
  expect.listEquals(
      [0xfffd, 0xfffd, 0xfffd],
      utf16CodeUnitsToCodepoints([0xdc00, 0xdc00, 0xdc00]),
      "3 unexpected continuation bytes");

  // incomplete sequences
  expect.listEquals(
      [0xfffd], utf16CodeUnitsToCodepoints([0xd800]), "d800 last byte missing");
  expect.listEquals(
      [0xfffd], utf16CodeUnitsToCodepoints([0xdbff]), "dbff last byte missing");

  // concatenation of incomplete sequences
  expect.listEquals(
      [0xfffd, 0xfffd],
      utf16CodeUnitsToCodepoints([0xd800, 0xdbff]),
      "d800 dbff last byte missing");

  // impossible bytes
  expect.listEquals(
      [0xfffd], utf16CodeUnitsToCodepoints([0x110000]), "110000 out of bounds");

  // overlong sequences not possible in utf16 (nothing < x10000)
  // illegal code positions d800-dfff not encodable (< x10000)
}
