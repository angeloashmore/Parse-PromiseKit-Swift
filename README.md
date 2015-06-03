# ParsePromiseKitSwift
A PromiseKit category for the Parse SDK in Swift using Promise&lt;T>

*Note: This is a semi-port of [Parse+PromiseKit](https://github.com/hathway/Parse-PromiseKit).*


ParsePromiseKitSwift
====================
`ParsePromiseKitSwift` is a category that adds Swift [PromiseKit](http://promisekit.org/) integration to the
[Parse SDK](https://parse.com/docs/ios_guide).

Installation
------------
### Via CocoaPods
Add `pod 'ParsePromiseKitSwift'` to your Podfile.

Usage
-----
Import `ParsePromiseKit` once in your project.

Method names prefix Parse's asynchronous method names with `promise` and remove
`InBackground`, etc. Promises are fulfilled with the same result signature as
the appropriate completion block (with a few exceptions).

`object.saveInBackground` becomes `object.promiseSave`

`user.signUpInBackground` becomes `user.promiseSignUp`

``swift
query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
  if let error = error {
    // handle error
  } else {
    // do something with objects
  }
}
``

becomes

``swift
query.promiseFindObjects().then { objects -> Void in
  // do something with objects
}.catch { error -> Void in
  // handle error
}
``

License
-------
`ParsePromiseKitSwift` is free software and is released under the MIT license.
See [LICENSE](LICENSE) for more information.
