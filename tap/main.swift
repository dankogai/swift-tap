//
//  main.swift
//  tap
//
//  Created by Dan Kogai on 1/21/16.
//  Copyright © 2016 Dan Kogai. All rights reserved.
//
let test = TAP(tests:2)
test.ok(42+0.195 == 42.195, "42 + 0.195 == 42.195")
test.eq(42+0.195,   42.195, "42 + 0.195 is 42.195")
test.done()
