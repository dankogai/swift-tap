[![build status](https://secure.travis-ci.org/dankogai/swift-tap.png)](http://travis-ci.org/dankogai/swift-tap)

# swift-tap

Test Anything Protocol ([TAP]) for Swift

[TAP]: https://testanything.org


## Usage

[tap.swift]: ./tap/tap.swift
[main.swift]: ./tap/main.swift

* add [tap.swift] to your project.
* write [main.swift] like below:

````swift
let test = TAP(tests:2)
test.ok(42+0.195 == 42.195, "42 + 0.195 == 42.195") // ok 1 - 42 + 0.195 == 42.195
test.eq(42+0.195,   42.195, "42 + 0.195 is 42.195") // ok 2 - 42 + 0.195 is 42.195
test.done() 
````

* build and test like below:

````shell
$ xcrun -sdk macosx swiftc project/*.swift && prove ./main
./main .. ok   
All tests successful.
Files=1, Tests=2,  0 wallclock secs ( 0.02 usr +  0.00 sys =  0.02 CPU)
Result: PASS
````

** `./main` actually prints the following:

````
1..2
ok 1 - 42 + 0.195 == 42.195
ok 2 - 42 + 0.195 is 42.195
````


### test without plan

You should specify the number of tests to run via `TAP(tests:Int)` or `.plan(_:Int)` but this is optional.  But when you do so you cannot omit `.done()` which prints `1..number_of_tests` that the TAP protocol demands.

````
ok 1 - 42 + 0.195 == 42.195
ok 2 - 42 + 0.195 is 42.195
1..2
````

* `./main` actually prints as follows:

## Why NOT [XCTest]?

[XCTest]: https://developer.apple.com/library/ios/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/01-introduction.html
[travis]: https://travis-ci.org

* Way too fancy and resource-demanding.
* Not Cross-platform.  Swift is no longer limited to Xcode ever since it is [opensourced].

[opensourced]: https://swift.org

## See Also

* https://testanything.org
* https://en.wikipedia.org/wiki/Test_Anything_Protocol
