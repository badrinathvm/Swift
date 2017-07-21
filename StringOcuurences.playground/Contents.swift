//: Playground - noun: a place where people can play

import UIKit

var str = "helloplaygroundhello"
var subStr = "hello"


private extension String{
    subscript (index: Int) -> Character {
        return self[self.characters.index(self.startIndex, offsetBy: index)]
    }
}

var matches:Int = 0

for outer in 0..<(str.characters.count - subStr.characters.count){
    for inner in 0..<subStr.characters.count{
        if(str[(inner+outer)] == subStr[inner]){
            if ( inner == subStr.characters.count - 1){
                matches += 1
            }
        }
    }
}

print( "No of matches \(matches)")




