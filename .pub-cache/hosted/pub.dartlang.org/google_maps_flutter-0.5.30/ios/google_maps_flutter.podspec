#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'google_maps_flutter'
  s.version          = '0.0.1'
  s.summary          = 'Google Maps for Flutter'
  s.description      = <<-DESC
A Flutter plugin that provides a Google Maps widget.
Downloaded by pub (not CocoaPods).
                       DESC
  s.homepage         = 'https://github.com/flutter/plugins'
  s.license          = { :type => 'BSD', :file => '../LICENSE' }
  s.author           = { 'Flutter Dev Team' => 'flutter-dev@googlegroups.com' }
  s.source           = { :http => 'https://github.com/flutter/plugins/tree/master/packages/google_maps_flutter/google_maps_flutter' }
  s.documentation_url = 'https://pub.dev/packages/google_maps_flutter'
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  # TODO: Unpin this once the fix for b/163474612 or b/163359804 rolls (avoid v3.10!)
  s.dependency 'GoogleMaps', '< 3.10'
  s.static_framework = true
  s.platform = :ios, '8.0'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end
