//
//  main.swift
//  Base
//
//  Created by RincLiu on 11/23/14.
//  Copyright (c) 2014 Rinc Liu. All rights reserved.
//

import Foundation

// Define Type-Alias:
typealias NameType = String //Just like `typedef` in C/C++, or `type` in Golang.

// Declare variables:
var i : Int = 25
var f = 12345.0; f += 0.56789
var d : Double = Double(f) //Convert variable's type.
var l = 9_876_543_210 //Use `_` to devide large numbers, this way can make them readable.
println("i: \(i), f: \(f), d: \(d), l: \(l)")

// Declare constants:
let name : NameType = "Rinc"
let pi = 3.1415926535
println("name: \(name), pi: \(pi)")

// Character:
let char : Character = "X" //A Character MUST be put in `""`, which is different from many other languages.
println("char: \(char)")

// String:
var str1 = String("Taylor"); str1 += " Swift"
var str2 = str1.uppercaseString
for char in str2 { //Travel characters in String.
    println("\(char)")
}
for uchar in str2.unicodeScalars { //Travel unicodes in String.
    println("\(uchar.value)")
}

// Tuple:
let people1 = ("Rinc", age : 25, 1.61) //You can specify the property's name in front of it.
println("people1: \(people1), age1: \(people1.age)")
var (name1, age1, _) = people1 //Read properties of the tuple. And like in Golang, you can use `_`.
println("name1: \(name1), age1: \(age1)")
