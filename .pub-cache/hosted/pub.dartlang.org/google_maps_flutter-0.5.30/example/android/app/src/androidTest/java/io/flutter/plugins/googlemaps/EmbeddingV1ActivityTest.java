package io.flutter.plugins.googlemaps;

import androidx.test.rule.ActivityTestRule;
import dev.flutter.plugins.e2e.FlutterTestRunner;
import io.flutter.plugins.googlemapsexample.*;
import org.junit.Rule;
import org.junit.runner.RunWith;

@RunWith(FlutterTestRunner.class)
public class EmbeddingV1ActivityTest {
  @Rule
  public ActivityTestRule<EmbeddingV1Activity> rule =
      new ActivityTestRule<>(EmbeddingV1Activity.class);
}
