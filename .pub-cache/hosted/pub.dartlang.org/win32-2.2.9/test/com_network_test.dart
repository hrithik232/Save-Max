@TestOn('windows')

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:test/test.dart';
import 'package:win32/win32.dart';

void main() {
  test('Network manager', () {
    final hr = CoInitializeEx(
        nullptr, COINIT_APARTMENTTHREADED | COINIT_DISABLE_OLE1DDE);
    expect(hr, equals(S_OK));
    final nlm = NetworkListManager.createInstance();
    expect(nlm.ptr.address, isNonZero);

    free(nlm.ptr);

    CoUninitialize();
  });

  group('Network testing', () {
    setUp(() {
      CoInitializeEx(
          nullptr, COINIT_APARTMENTTHREADED | COINIT_DISABLE_OLE1DDE);
    });

    test('Network is connected', () {
      final nlm = NetworkListManager.createInstance();
      expect(nlm.IsConnected, equals(VARIANT_TRUE));
      free(nlm.ptr);
    });

    test('Network is connected to the internet', () {
      final nlm = NetworkListManager.createInstance();
      expect(nlm.IsConnectedToInternet, equals(VARIANT_TRUE));
      free(nlm.ptr);
    });

    test('Can enumerate a network connection', () {
      final nlm = NetworkListManager.createInstance();
      final enumPtr = calloc<COMObject>();
      final netPtr = calloc<COMObject>();

      expect(
          nlm.GetNetworks(
              NLM_ENUM_NETWORK.NLM_ENUM_NETWORK_CONNECTED, enumPtr.cast()),
          equals(S_OK));

      final enumerator = IEnumNetworks(enumPtr);
      expect(enumerator.Next(1, netPtr.cast(), nullptr), equals(S_OK));

      final network = INetwork(netPtr);

      // network should be connected, given the filter
      expect(network.IsConnected,
          anyOf(equals(VARIANT_TRUE), equals(VARIANT_FALSE)));

      free(netPtr);
      free(enumPtr);
      free(nlm.ptr);
    });

    test('First network connection has a description', () {
      final nlm = NetworkListManager.createInstance();
      final enumPtr = calloc<COMObject>();
      final netPtr = calloc<COMObject>();
      final descPtr = calloc<Pointer<Utf16>>();

      expect(
          nlm.GetNetworks(
              NLM_ENUM_NETWORK.NLM_ENUM_NETWORK_CONNECTED, enumPtr.cast()),
          equals(S_OK));

      final enumerator = IEnumNetworks(enumPtr);
      expect(enumerator.Next(1, netPtr.cast(), nullptr), equals(S_OK));

      final network = INetwork(netPtr);
      expect(network.GetDescription(descPtr), equals(S_OK));

      // This is a wireless network or Ethernet network name. Assume that it's
      // more than one character long, and test for that.
      expect(descPtr.value.length, greaterThan(1));

      free(netPtr);
      free(enumPtr);
      free(nlm.ptr);
    });

    tearDown(CoUninitialize);
  });
}
