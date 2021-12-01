@TestOn('windows')

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:test/test.dart';
import 'package:win32/win32.dart';

void main() {
  test('OVERLAPPED struct', () {
    final pOverlapped = calloc<OVERLAPPED>();
    final overlapped = pOverlapped.ref;

    overlapped.pointer = Pointer.fromAddress(0x0807060504030201);
    expect(overlapped.pointer.address, equals(0x0807060504030201));
    expect(overlapped.Offset, equals(0x04030201));
    expect(overlapped.OffsetHigh, equals(0x08070605));

    overlapped.Offset = 0xDEADBEEF;
    expect(overlapped.Offset, equals(0xDEADBEEF));
    expect(overlapped.OffsetHigh, equals(0x08070605));
    expect(overlapped.pointer.address, equals(0x08070605DEADBEEF));

    overlapped.OffsetHigh = 0xFACEFEED;
    expect(overlapped.Offset, equals(0xDEADBEEF));
    expect(overlapped.OffsetHigh, equals(0xFACEFEED));
    expect(overlapped.pointer.address, equals(0xFACEFEEDDEADBEEF));

    free(pOverlapped);
  });
}
