//
//  tap.swift
//  tap
//
//  Created by Dan Kogai on 1/21/16.
//  Copyright © 2016 Dan Kogai. All rights reserved.
//
#if os(Linux)
    import Glibc
#else
    import Foundation
#endif

public class TAP {
    var tests = 0, runs = [Bool]()
    public init() {}
    public init(tests:Int) {
        self.plan(tests)
    }
    /// sets the number of tests to run. call it before the first test
    public func plan(tests:Int) {
        self.tests = tests
        print("1..\(tests)")
    }
    /// ok if `predicate` is true
    public func ok(@autoclosure predicate:()->Bool, _ message:String = "")->Bool {
        let ok = predicate()
        runs.append(ok)
        let ornot = ok ? "" : "not "
        print("\(ornot)ok \(runs.count) - \(message)")
        return ok
    }
    /// ok if `actual` == `expected`
    public func eq<T:Equatable>(actual:T, _ expected:T, _ message:String = "")->Bool {
        if ok(actual == expected, message) { return true }
        print("#       got: \(actual)")
        print("#  expected: \(expected)")
        return false
    }
    /// ok if `actual` != `expected`
    public func ne<T:Equatable>(actual:T, _ expected:T, _ message:String = "")->Bool {
        if ok(actual != expected, message) { return true }
        print("#       got: \(actual)")
        print("#  expected: anthing but \(expected)")
        return false
    }
    /// checks the test results, print stuff if neccesary,
    /// and `exit()` with code == number of failures
    public func done() {
        if tests == 0 {
            print("1..\(runs.count)")
            tests == runs.count
        }
        else if runs.count != tests {
            print("not ok \(runs.count + 1) - planned to run \(tests) but actually ran \(runs.count)")
            runs.append(false)
        }
        exit(Int32(runs.filter{ $0 == false }.count) & 255)
    }
    deinit {
        done()
    }
}