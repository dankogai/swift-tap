[![build status](https://secure.travis-ci.org/dankogai/swift-tap.png)](http://travis-ci.org/dankogai/swift-tap)

# swift-tap

Test Anything Protocol for Swift

## Usage

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

* `./main` actually prints as follows:

````
1..2
ok 1 - 42 + 0.195 == 42.195
ok 2 - 42 + 0.195 is 42.195
````

[tap.swift]: ./tap/tap.swift
[main.swift]: ./tap/main.swift


## See Also

* https://testanything.org
* https://en.wikipedia.org/wiki/Test_Anything_Protocol
