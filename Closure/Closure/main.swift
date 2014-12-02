//
//  main.swift
//  Closure
//
//  Created by RincLiu on 12/1/14.
//  Copyright (c) 2014 Rinc Liu. All rights reserved.
//

import Foundation

//  Define a Function Type:
typealias FuncType = (Double, Double) -> Double

//  Define a Function which has a Function-Type parameter.
//  Like in C++, this parameter is a callable object (Callback).
//  So it also can be a Closure object.
func printFuncResult(x : Double, y : Double, fun : FuncType) {
    println("\(fun(x, y))")
}

//  Define a Closure:
let funPlus = { (x : Double, y : Double) -> Double in return x + y }

//  Use the closure as a parameter:
printFuncResult(0.1234, 5.6789, funPlus)

// Use an anonymous Closure:
printFuncResult(0.1234, 5.6789, { (x : Double, y : Double) -> Double in return x * y })

// If the Closure is the last parameter, it can be put out as a Function body.
// This is useful when the Closure's body contains more than one expressions.
printFuncResult(0.1234, 5.6789) {
    (var x : Double, var y : Double) -> Double in
    x = x * x
    y = y * y
    return x * y
}