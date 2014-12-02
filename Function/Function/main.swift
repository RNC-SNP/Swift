//
//  main.swift
//  Function
//
//  Created by RincLiu on 11/30/14.
//  Copyright (c) 2014 Rinc Liu. All rights reserved.
//

import Foundation

//  Define a function:
func getCircleSpace(radius : Double) -> Double {
    let pi = 3.1415926535
    return pi * radius * radius
}

println("\(getCircleSpace(0.123456789))")



//  Nested Functions:
func getCircleSpaceX(radius : Double) -> Double {
    let pi = 3.1415926535
    // Define a inner function:
    func printPi() {
        println("pi: \(pi)")
    }
    // Call the inner function:
    printPi()
    return pi * radius * radius
}

println("\(getCircleSpaceX(0.123456789))")



//  Multiple Return Values:
func binarySearch(target : Int, sortedArray : [Int]) -> (exist : Bool, index : Int) {
    var exist = false, index = -1
    if(!sortedArray.isEmpty && sortedArray.count > 0) {
        var low = 0, high = sortedArray.count - 1
        while low <= high {
            let middle = (low + high) / 2
            if target > sortedArray[middle] {
                low = middle + 1
            } else if (target < sortedArray[middle]) {
                high = middle - 1
            } else {
                exist = true
                index = middle
                break
            }
        }
    }
    return (exist, index)
}

let searchResult1 = binarySearch(5, [1, 3, 5, 7, 9])
println("exist: \(searchResult1.exist), index: \(searchResult1.index)")



//  External Parameter Names (This can make it more readable, like in Objc):
func binarySearch(target : Int, inSortedArray array : [Int]) -> (exist : Bool, index : Int) {
    return binarySearch(target, array)
}

let searchResult2 = binarySearch(5, inSortedArray : [1, 3, 5, 7, 9])
println("exist: \(searchResult2.exist), index: \(searchResult2.index)")



//  If you want to provide an external parameter name for a function parameter,
//  and the local parameter name is already an appropriate name to use,
//  you do not need to write the same name twice for that parameter.
//  Instead, write the name once, and prefix the name with a hash symbol (#).
func binarySearch(#target : Int, #sortedArray : [Int]) -> (exist : Bool, index : Int) {
    return binarySearch(target, sortedArray)
}

let searchResult3 = binarySearch(target: 5, sortedArray : [1, 3, 5, 7, 9])
println("exist: \(searchResult3.exist), index: \(searchResult3.index)")



//  Default Parameter Values (Like in C++):
//
//  And in this situation, External Parameter Names is implemented in default.
func printContact(name : String = "Rinc", email : String = "i@RincLiu.com") {
    println("\(name): \(email)")
}

printContact()
printContact(name: "Taylor")
printContact(email: "taylor.swift@gmail.com")
printContact(name: "Taylor", email: "taylor.swift@gmail.com")



//  Variadic Parameters:
//
//  A function may have at most one variadic parameter, and it must always appear last in the parameter list,
//  to avoid ambiguity when calling the function with multiple parameters.
func printContact(name : String, emails: String...) {
    print("\(name):")
    // Read variadic parameters as an Array:
    for email in emails {
        print(" \(email)")
    }
    println()
}

printContact("Rinc", "i@RincLiu.com")
printContact("Rinc", "i@RincLiu.com", "rinc.liu@gmail.com")
printContact("Rinc", "i@RincLiu.com", "rinc.liu@gmail.com", "rinc.liu@msn.com")
printContact("Rinc", "i@RincLiu.com", "rinc.liu@gmail.com", "rinc.liu@msn.com", "rinc.liu@yahoo.com")



//  Constant and Variable Parameters:
//
//  Function parameters are constants by default.
//  But you can make it variable by adding a keywork `var` in front of it.
func printContactVar(var name: String, email : String) {
    name = name.uppercaseString
    printContact(name: name, email: email)
}

printContactVar("Taylor", "taylor.swift@gmail.com")



//  In-Out Parameters:
//
//  Variable parameters, as described above, can only be changed within the function itself. 
//  If you want a function to modify a parameter’s value, 
//  and you want those changes to persist after the function call has ended, 
//  define that parameter as an in-out parameter instead.
func printContactInOut(inout name: String, email : String) {
    name = name.uppercaseString
    printContact(name: name, email: email)
}

var name = "Taylor"
printContactInOut(&name, "taylor.swift@gmail.com")
println("name: \(name)")



// Function Type:
typealias FuncType = (Double, Double) -> Double



//  Function Type as variable's type:
var funcDDD : FuncType

func multiply(x : Double, y : Double) -> Double {
    return x * y
}

funcDDD = multiply
println("\(funcDDD(0.1234, 5.6789))")



//  Function Type as parameter's type:
func printFuncResult(fun : FuncType, x : Double, y : Double) {
    println(fun(x, y))
}

printFuncResult(funcDDD, 0.1234, 5.6789)



//  Function Type as return type:
func getFunc() -> FuncType {
    return funcDDD
}

let f = getFunc()
println("\(f(0.1234, 5.6789))")