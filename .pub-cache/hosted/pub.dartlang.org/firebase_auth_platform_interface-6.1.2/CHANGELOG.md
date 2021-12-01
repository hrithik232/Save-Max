## 6.1.2

 - Update a dependency to the latest release.

## 6.1.1

 - **TEST**: Fix pre-existing HintCode.UNNECESSARY_TYPE_CHECK_TRUE (#6931).
 - **FIX**: allow setLanguage to accept null (#7050).

## 6.1.0

 - **FEAT**: Add support for `secret` on `OAuthCredential` on web (#6830).
 - **FEAT**: expose linkWithPopup() & correctly parse credentials in exceptions (#6562).

## 6.0.1

 - Update a dependency to the latest release.

## 6.0.0

> Note: This release has breaking changes.

 - **FEAT**: setSettings now possible for android (#6367).
 - **CHORE**: publish packages (#6513).
 - **BREAKING** **FEAT**: use<product>Emulator(host, port) API update (#6439).

## 5.0.0

> Note: This release has breaking changes.

 - **FEAT**: setSettings now possible for android (#6367).
 - **BREAKING** **FEAT**: useAuthEmulator(host, port) API update.

## 4.3.1

 - Update a dependency to the latest release.

## 4.3.0

 - **FEAT**: add tenantId support  (#5736).

## 4.2.4

 - Update a dependency to the latest release.

## 4.2.3

 - Update a dependency to the latest release.

## 4.2.2

 - **DOCS**: Add missing homepage/repository links (#6054).
 - **CHORE**: publish packages (#6022).
 - **CHORE**: publish packages.

## 4.2.1

 - **FIX**: authentication forceResendingToken int can be null on iOS (#5944).

## 4.2.0

 - **FIX**: Move communication to EventChannels (#4643).
 - **FEAT**: OAuthProvider.parameters is now non-nullable (#5656).
 - **DOCS**: remove implicit-cast in the doc of AuthProviders (#5862).

## 4.1.1

 - **REFACTOR**: fix formatting (#5835).
 - **FIX**: uid can be null (#5834).
 - **FIX**: ensure web is initialized before sending stream events (#5766).
 - **CI**: review changes.

## 4.1.0

 - **FEAT**: PhoneAuthProvider.credential and PhoneAuthProvider.credentialFromToken now return a PhoneAuthCredential (#5675).

## 4.0.2

 - **DOCS**: userChanges clarification (#5698).

## 4.0.1

 - Update a dependency to the latest release.

## 4.0.0

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.

## 4.0.0-1.1.nullsafety.3

 - **FIX**: Fix email link signin on Android (#4973).

## 4.0.0-1.1.nullsafety.2

 - **TESTS**: update mockito API usage in tests

## 4.0.0-1.1.nullsafety.1

 - **REFACTOR**: pubspec & dependency updates (#4932).

## 4.0.0-1.1.nullsafety.0

 - **FEAT**: implement support for `useEmulator` (#4263).

## 4.0.0-1.0.nullsafety.0

 - **FIX**: bump firebase_core_* package versions to updated NNBD versioning format (#4832).

## 4.0.0-nullsafety.1

Bump firebase_core to v0.8.0-nullsafety.1


## 4.0.0-nullsafety.0

Migrated to null safety (#4633)

## 3.0.1

 - Update a dependency to the latest release.

## 3.0.0

> Note: This release has breaking changes.

 - **FIX**: bubble exceptions (#3700).
 - **BREAKING** **REFACTOR**: remove all currently deprecated APIs (#4590).

## 2.1.4

 - Update a dependency to the latest release.

## 2.1.3

 - Update a dependency to the latest release.

## 2.1.2

 - **FIX**: fix firebase_auth listeners assigning of currentUser (#3737).

## 2.1.1

 - Update a dependency to the latest release.

## 2.1.0

 - **FIX**: fix IdTokenResult timestamps (web, ios) (#3357).
 - **FEAT**: add support for linkWithPhoneNumber (#3436).
 - **FEAT**: use named arguments for ActionCodeSettings (#3269).
 - **FEAT**: implement signInWithPhoneNumber on web (#3205).
 - **FEAT**: expose smsCode (android only) (#3308).
 - **DOCS**: fixed signOut method documentation (#3342).

## 2.0.1

* Fixed an incorrect assert when creating a `GoogleAuthCredential` instance. [(#3216)](https://github.com/FirebaseExtended/flutterfire/pull/3216/files#diff-be71096f90f1a879f17b7c94607b0885)

## 2.0.0

* See the `firebase_auth` plugin changelog.

## 1.1.8

* Update lower bound of dart dependency to 2.0.0.

## 1.1.7

* Use package:plugin_platform_interface

## 1.1.6

* Make the pedantic dev_dependency explicit.

## 1.1.5

- Fixed typo on private method name.

## 1.1.4

- **Breaking change**: Added missing `app` parameter to `confirmPasswordReset`.
  (This is an exception to the usual policy of avoiding breaking changes since
  `confirmPasswordReset` is a new API and doesn't have clients yet.)

## 1.1.3

- Added support for `confirmPasswordReset`

## 1.1.2

- Remove the deprecated `author:` field from pubspec.yaml

## 1.1.1

- Fixed crash when platform returns an auth result where `additionalUserInfo`
  is not provided.

## 1.1.0

- Added type `PlatformOAuthCredential` for generic OAuth providers.

## 1.0.0

- Initial open-source release.
