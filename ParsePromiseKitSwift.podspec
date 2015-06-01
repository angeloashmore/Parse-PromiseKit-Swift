Pod::Spec.new do |s|
  s.name         = "ParsePromiseKitSwift"
  s.version      = "0.0.5"
  s.summary      = "A PromiseKit category for the Parse SDK in Swift using Promise<T>"
  s.homepage     = "https://github.com/doorbellapp/ParsePromiseKitSwift"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = "Angelo Ashmore"

  s.source       = { :git => "https://github.com/doorbellapp/ParsePromiseKitSwift.git", :tag => s.version }
  s.source_files = "ParsePromiseKit/*.swift"

  s.platform     = :ios, "8.0"

  s.frameworks   = "Foundation"

  s.dependency "PromiseKit", "~> 2.0"
  s.ios.dependency "Parse", "~> 1.7"
  s.ios.dependency "ParseUI", "~> 1.1.1"
  s.osx.dependency "Parse-OSX", "~> 1.7"
end
