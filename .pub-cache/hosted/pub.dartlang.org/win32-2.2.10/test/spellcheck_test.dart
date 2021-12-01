@TestOn('windows')

import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:test/test.dart';
import 'package:win32/win32.dart';

import 'helpers.dart';

void main() {
  test('Spellcheck', () {
    // ISpellCheckerFactory is only available on Windows 8 or higher, per:
    // https://docs.microsoft.com/en-us/windows/win32/api/spellcheck/nn-spellcheck-ispellcheckerfactory
    if (getWindowsBuildNumber() >= 9200) {
      var hr = CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED);
      expect(hr, equals(S_OK));

      final spellCheckerFactory = SpellCheckerFactory.createInstance();
      expect(spellCheckerFactory.ptr.address, isNonZero);

      final supportedPtr = calloc<Int32>();

      // Dart reports locale as (for example) en_US; Windows expects en-US
      var languageTagPtr =
          Platform.localeName.replaceAll('_', '-').toNativeUtf16();

      hr = spellCheckerFactory.IsSupported(languageTagPtr, supportedPtr);
      expect(hr, equals(S_OK));
      expect(supportedPtr.value, equals(1));

      free(languageTagPtr);

      languageTagPtr = 'en-US'.toNativeUtf16();
      hr = spellCheckerFactory.IsSupported(languageTagPtr, supportedPtr);
      expect(hr, equals(S_OK));

      if (supportedPtr.value == 1) {
        final spellCheckerPtr = calloc<COMObject>();
        hr = spellCheckerFactory.CreateSpellChecker(
            languageTagPtr, spellCheckerPtr.cast());
        expect(hr, equals(S_OK));

        final spellChecker = ISpellChecker(spellCheckerPtr);

        final errorsPtr = calloc<COMObject>();
        final textPtr = 'haev'.toNativeUtf16();
        hr = spellChecker.Check(textPtr, errorsPtr.cast());
        expect(hr, equals(S_OK));

        final errors = IEnumSpellingError(errorsPtr);
        final errorPtr = calloc<COMObject>();

        while (errors.Next(errorPtr.cast()) == S_OK) {
          final error = ISpellingError(errorPtr);
          expect(error.CorrectiveAction, equals(CORRECTIVE_ACTION.REPLACE));
          final replacment = error.Replacement;
          expect(replacment.toDartString(), equals('have'));
          WindowsDeleteString(replacment.address);
          error.Release();
        }

        errors.Release();
        free(textPtr);
        spellChecker.Release();
      }

      free(supportedPtr);
      free(languageTagPtr);

      spellCheckerFactory.Release();

      CoUninitialize();
    }
  });
}
