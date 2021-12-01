# plugin_platform_interface

This package provides a base class for platform interfaces of [federated flutter plugins](https://fluter.dev/go/federated-plugins).

Platform implementations should extend their platform interface classes rather than implement it as
newly added methods to platform interfaces are not considered as breaking changes. Extending a platform
interface ensures that subclasses will get the default implementations from the base class, while
platform implementations that `implements` their platform interface will be broken by newly added methods.

This class package provides common functionality for platform interface to enforce that they are extended
and not implemented.

## Sample usage:

```dart
abstract class UrlLauncherPlatform extends PlatformInterface {
  UrlLauncherPlatform() : super(token: _token);

  static UrlLauncherPlatform _instance = MethodChannelUrlLauncher();

  static final Object _token = Object();

  static UrlLauncherPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [UrlLauncherPlatform] when they register themselves.
  static set instance(UrlLauncherPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

 }
```

This guarantees that UrlLauncherPlatform.instance cannot be set to an object that `implements`
UrlLauncherPlatform (it can only be set to an object that `extends` UrlLauncherPlatform).

## Mocking platform interfaces with Mockito


Mockito mocks of platform interfaces will fail the verification done by `verifyToken`.
This package provides a `MockPlatformInterfaceMixin` which can be used in test code only to disable
the `extends` enforcement.

A Mockito mock of a platform interface can be created with:

```dart
class UrlLauncherPlatformMock extends Mock
   with MockPlatformInterfaceMixin
   implements UrlLauncherPlatform {}
```
