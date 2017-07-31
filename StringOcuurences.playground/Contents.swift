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
//
//struct LongestPalindrome{
//    
//    static func longestPAlindrome(str: String){
//        //var result = String()
//        var max:Int = 0
//        for i in 0..<str.characters.count-1{
//            for j in i+2..<str.characters.count-1{
//                //var sub = str.substring(with: i..<j)
////                if(sb == sb.reverse() && sb.charcaters.count < max){
////                    result = sb
////                    max = sb.characaters.count
////                }
//            }
//        }
//    }
//    
//}


//print(LongestPalindrome.longestPAlindrome(str: "aba"))

let myString = "Hello World"
myString[2..<4]


print("Programme for isoMorphic")

struct isoMorphic{
    
    static func iso(s:String,t:String) -> Bool?{
        
        if ( s.characters.count != t.characters.count ){
            return false
        }
        
        var dict : [Character:Character] = [:]
        
        var str1 = s.characters.map { $0 }
        var str2 = t.characters.map { $0 }
        
        for i in 0..<str2.count{
            
            var c1 = str1[i]
            var c2 = str2[i]
            
            if (dict.keys.contains(c1)){
                if (dict[c1] != c2){
                    return false
                }
                
            }else{
                if(dict.keys.contains(c2)){
                    break
                }else{
                    dict[c1] = c2
                }
            }
        }
        
        return true
    }
}

print(isoMorphic.iso(s: "egg", t: "ard")!)




