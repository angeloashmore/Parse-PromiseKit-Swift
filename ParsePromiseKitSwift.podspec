Pod::Spec.new do |s|
  s.name         = "ParsePromiseKitSwift"
  s.version      = "0.0.4"
  s.summary      = "A PromiseKit category for the Parse SDK in Swift using Promise<T>"
  s.homepage     = "https://github.com/angeloashmore/Parse-PromiseKit-Swift"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = "Angelo Ashmore"

  s.source       = { :git => "https://github.com/angeloashmore/Parse-PromiseKit-Swift.git", :tag => s.version }
  s.source_files = "ParsePromiseKit/*.swift"

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"

  s.frameworks   = "Foundation"

  s.dependency "PromiseKit", "~> 2.0"
  s.ios.dependency "Parse", "~> 1.7"
  s.ios.dependency "ParseUI", "~> 1.1.1"
  s.osx.dependency "Parse-OSX", "~> 1.7"
end
