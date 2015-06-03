Pod::Spec.new do |s|
  s.name         = "ParsePromiseKitSwift"
  s.module_name  = "ParsePromiseKit"
  s.version      = "1.0.0"
  s.summary      = "A PromiseKit category for the Parse SDK in Swift using Promise<T>"
  s.homepage     = "https://github.com/doorbellapp/ParsePromiseKitSwift"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = "Angelo Ashmore"

  s.source       = { :git => "https://github.com/doorbellapp/ParsePromiseKitSwift.git", :tag => s.version }
  s.source_files = "ParsePromiseKitSwift.swift"

  s.platform     = :ios, "8.0"

  s.frameworks   = "Foundation"

  s.dependency "PromiseKit", "~> 2.0"
  s.dependency "PromiseKitClosures", "~> 1.0"
  s.dependency "Parse", "~> 1.7"
  s.dependency "ParseUI", "~> 1.1.1"
end
