//
//  main.swift
//  ClassBase
//
//  Created by RincLiu on 12/11/14.
//  Copyright (c) 2014 Rinc Liu. All rights reserved.
//

import Foundation

// Lazy-Properties:
//
// The `lazy` properties will not be initialized until they're visited for the first time.
// This is very useful while I/O processing.
class Writer {
    var content = "qwertyuiop"
    func write() -> String {
        println("Write...")
        return content;
    }
}

class Reader {
    lazy var str = Writer().write() //`lazy` cannot be used with `let`
    var data = ""
}

let reader = Reader()
reader.data += "New data..."
println(reader.data)
println(reader.str)



// Setter/Getter:
//
// Just like in C#.
// If you defined a getter, then a setter is optional.
// But if you defined a setter, a getter is necessary.
// And if you want make a property readonly, you need remove the setter and `get` keyword.
class Rect {
    var width = 0.0, height = 0.0
    var space : Double { //It's readonly!
        get {
            println("Getting 'space'...")
            return width * height
        }
        set {
            println("Setting 'space' with new value: \(newValue)")
        }
    }
}

var rect = Rect()
rect.width = 0.1234
rect.height = 5.6789
rect.space = 0
println("space: \(rect.space)")
