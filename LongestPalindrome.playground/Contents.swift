//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


extension String {
    
    var length: Int {
        return self.characters.count
    }
    
    subscript (i: Int) -> String {
        return self[Range(i ..< i + 1)]
    }
    
    func substring(from: Int) -> String {
        return self[Range(min(from, length) ..< length)]
    }
    
    func substring(to: Int) -> String {
        return self[Range(0 ..< max(0, to))]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return self[Range(start ..< end)]
    }
    
}

// Lonest Palindrome

struct LongestPalindrome{
    
    static func longestPAlindrome(str: String){
        for i in 0..<str.characters.count{
            for j in i+2...str.characters.count {
                
                /* Getting Sub string */
                
                let startIndex = str.index(str.startIndex, offsetBy: i)
                let endIndex = str.index(str.startIndex, offsetBy: j)
            
               /* if let sub:String = str.substring(with: startIndex..<endIndex){
                        //print(sub)
                }*/

            }
        }
    }
    
}

//LongestPalindrome.longestPAlindrome(str: "aba")



var template = "Hello"
let startIndex = template.index(template.startIndex, offsetBy: 1)
let endIndex = template.index(template.startIndex, offsetBy: 3)
template.substring(with: startIndex..<endIndex)





