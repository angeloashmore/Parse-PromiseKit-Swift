Pod::Spec.new do |s|
  s.name         = "ParsePromiseKitSwift"
  s.version      = "0.0.1"
  s.summary      = "A PromiseKit category for the Parse SDK in Swift using Promise<T>"
  s.homepage     = "https://github.com/angeloashmore/Parse-PromiseKit-Swift"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = "Angelo Ashmore"
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.source       = { :git => "https://github.com/angeloashmore/Parse-PromiseKit-Swift", :tag => s.version }
  s.source_files  = "ParsePromiseKitSwift/*.swift"
end
