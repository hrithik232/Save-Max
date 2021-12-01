#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_facebook_auth.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_facebook_auth'
  s.version          = '3.5.3'
  s.summary          = 'Plugin to Facebook authentication for iOS in your Flutter app'
  s.description      = <<-DESC
  Plugin to Facebook authentication for iOS in your Flutter app
                       DESC
  s.homepage         = 'https://meedu.app'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'meedu.app' => 'contacto@meedu.app' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'


  s.dependency 'FBSDKCoreKit', '~> 12.0.2'
  s.dependency 'FBSDKLoginKit', '~> 12.0.2'
  s.platform = :ios, '10.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
