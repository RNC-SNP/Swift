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

var (x, y, z) = (1, 2, 3) //Use tuple to init variable list


// `...` & `..<`
let names = ["Andy", "Bob", "Chris", "Denny", "Emma", "Frank", "Rinc"]
/*
for i in 0 ... names.count { //i: 0->names.count
    println("\(i): \(names[i])")
}
*/
for i in 0 ..< names.count { //i: 0->names.count-1
    println("\(i): \(names[i])")
}


// Array:
var array1 : Array<Int> = [1, 3, 5, 7, 9] //The first way to initialize an Array.
println("array1: \(array1)")

var array2 : [Int] = [0, 2, 4, 6, 8] //The second way to initialize an Array.
println("array2: \(array2)")

var array3 = [Character](count: 10, repeatedValue: "X") //Like in C++, you can initialize an Array with specified capacity and default value.
println("array3: \(array3)")

var array4 = array1 + array2 //Array `+` Array
println("array4: \(array4)")

array1[0 ..< array1.count] = [10, 30, 50, 70, 90] //Use `..<` in Array.
println("array1: \(array1)")

array1.append(100) //Append element to Array.
array1.insert(80, atIndex: 4) //Insert element to Array.
array1.removeAtIndex(2) //Remove element from Array.

for e in array1 { //Travel an Array.
    println("\(e)")
}

for i in 0 ..< array1.count { //Use `..<` to travel an Array.
    println("\(i): \(array1[i])")
}

for (index, value) in enumerate(array1) { //Use `enumerate` to travel an Array.
    println("\(index): \(value)")
}
