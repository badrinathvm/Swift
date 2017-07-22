//: Playground - noun: a place where people can play

import UIKit

var str = "helloplaygroundhello"
var subStr = "hello"

// No of times sub string appears in input string
private extension String{
    subscript (index: Int) -> Character {
        return self[self.characters.index(self.startIndex, offsetBy: index)]
    }
    
    
    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound - r.lowerBound)
        return self[Range(start ..< end)]
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




// Lonest Palindrome

struct LongestPalindrome{
    
    static func longestPAlindrome(str: String){
        //var result = String()
        var max:Int = 0
        for i in 0..<str.characters.count-1{
            for j in i+2..<str.characters.count-1{
                //var sub = str.substring(with: i..<j)
//                if(sb == sb.reverse() && sb.charcaters.count < max){
//                    result = sb
//                    max = sb.characaters.count
//                }
            }
        }
    }
    
}


//print(LongestPalindrome.longestPAlindrome(str: "aba"))

let myString = "Hello World"
myString[2..<4]





