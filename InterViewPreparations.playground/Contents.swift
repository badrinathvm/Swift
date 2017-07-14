//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var strArr : [String] = ["str","rts","aaa"]

var result : [[String]]

var map : [String : [String]]

/*for str in strArr {
    
    var charArray : [Character]
    
    var data = str.characters.map { String ($0)}
    
    for i in 0..<str.characters.count{
        let val:Int  = (Int(data[i]))!-(Int("a"))!
        charArray[val] = Int(charArray[val]) + 1
        
        
    }
    
    
}*/

checkForAnagram(firstStr:"str", secondStr: "tsr")

func checkForAnagram(firstStr: String, secondStr: String) -> Bool {
    return firstStr.lowercased().characters.sorted() == secondStr.lowercased().characters.sorted()
}





