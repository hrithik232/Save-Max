package com.example.e2e_example;

import android.Manifest.permission;
import androidx.test.rule.ActivityTestRule;
import androidx.test.rule.GrantPermissionRule;
import dev.flutter.plugins.e2e.FlutterTestRunner;
import io.flutter.embedding.android.FlutterActivity;
import org.junit.Rule;
import org.junit.runner.RunWith;

/**
 * Demonstrates how a E2E test on Android can be run with permissions already granted. This is
 * helpful if developers want to test native App behavior that depends on certain system service
 * results which are guarded with permissions.
 */
@RunWith(FlutterTestRunner.class)
public class FlutterActivityWithPermissionTest {

  @Rule
  public GrantPermissionRule permissionRule =
      GrantPermissionRule.grant(permission.ACCESS_COARSE_LOCATION);

  @Rule
  public ActivityTestRule<FlutterActivity> rule =
      new ActivityTestRule<>(FlutterActivity.class, true, false);
}
