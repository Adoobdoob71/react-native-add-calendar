require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "AddCalendar"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platforms    = { :ios => min_ios_version_supported }
  s.source       = { :git => "https://github.com/Adoobdoob71/react-native-add-calendar.git", :tag => "#{s.version}" }

  s.source_files = [
    "ios/**/*.{swift,m,mm}",
    "cpp/**/*.{hpp,cpp}",
  ]

  # Nitro dependencies
  s.dependency 'React-jsi'
  s.dependency 'React-callinvoker'

  # 1. Load the Nitrogen autolinking script
  load 'nitrogen/generated/ios/AddCalendar+autolinking.rb'
  add_nitrogen_files(s)

  # 2. Add the missing Header Search Paths
  # This tells the compiler to look in 'shared' for files like NewEvent.hpp
  s.pod_target_xcconfig = {
    "HEADER_SEARCH_PATHS" => [
      "\"$(PODS_TARGET_SRCROOT)/nitrogen/generated/shared\"",
      "\"$(PODS_TARGET_SRCROOT)/nitrogen/generated/ios\""
    ],
    "CLANG_CXX_LANGUAGE_STANDARD" => "c++20",
    "SWIFT_OBJC_INTEROP_MODE" => "objcxx"
  }

  install_modules_dependencies(s)
end