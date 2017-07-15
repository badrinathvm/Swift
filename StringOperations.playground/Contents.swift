//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Read from a file in Swift

if let txtPath = Bundle.main.path(forResource: "lorem", ofType: "txt"){
    do{
        let lorem = try String(contentsOfFile: txtPath, encoding: .utf8)
    } catch{
        print("some thing wrong")
    }
}


let hello = "hello"
print(hello[hello.index(after: hello.startIndex)])
print(hello[hello.index(before: hello.endIndex - 1)])

print(str)

let cafe = "cafe"

for cafe in cafe.characters.indices{
    print (cafe)
}

print("Value is ")
