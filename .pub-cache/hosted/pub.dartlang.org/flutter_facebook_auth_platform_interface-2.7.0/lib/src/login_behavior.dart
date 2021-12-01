/// defines the login ui Behavior on Android
enum LoginBehavior {
  nativeWithFallback,
  nativeOnly,
  katanaOnly,
  webOnly,
  dialogOnly,
  webViewOnly,
  deviceAuth,
}

/// parse the [LoginBehavior] to a String to be passed to the native code.
String getLoginBehaviorAsString(LoginBehavior behavior) {
  switch (behavior) {
    case LoginBehavior.nativeWithFallback:
      return "NATIVE_WITH_FALLBACK";
    case LoginBehavior.nativeOnly:
      return "NATIVE_ONLY";
    case LoginBehavior.katanaOnly:
      return "KATANA_ONLY";
    case LoginBehavior.webOnly:
      return "WEB_ONLY";
    case LoginBehavior.dialogOnly:
      return "DIALOG_ONLY";
    case LoginBehavior.webViewOnly:
      return "WEB_VIEW_ONLY";
    case LoginBehavior.deviceAuth:
      return "DEVICE_AUTH";
  }
}
