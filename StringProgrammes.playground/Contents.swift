//: Playground - noun: a place where people can play

import UIKit



/* Write a Java program to reverse String in Java without using any API?
 
 Read more: http://javarevisited.blogspot.com/2012/10/10-java-string-interview-question-answers-top.html#ixzz4mr1QOg9Q */


struct ReverseString{
    
    func reverseString(_ inputStr:String) -> String{
        var outStr:String? = ""
        var s = inputStr.characters.map { $0 }
        for i in stride(from: s.count - 1, to: -1, by: -1){
            outStr?.append(s[i])
        }
        return outStr!
    }
    
    func palindrome(_ inputStr:String) -> Bool{
        
        let outStr = reverseString(inputStr)
        
        let status = (inputStr == outStr ) ? true : false
        
        return status
    }
}

print(ReverseString().reverseString("data"))
print("Palindrome status \(ReverseString().palindrome("dad"))")


struct IsAnagram{
    
    func isAnagram(_ first:String, _ second: String) -> Bool{
        return first.lowercased().characters.sorted() == second.lowercased().characters.sorted()
    }
    
    func isAnagramSet(first:String, second:String) -> Bool{

        func countedSet(string: String) -> NSCountedSet {
            let array = first.characters.map { (Character) -> String in
                    return  String(Character)
            }
            return NSCountedSet(array: array)
        }
        
        return countedSet(string: first) == countedSet(string: second)
    }
    
}


print(IsAnagram().isAnagram("dad","add"))
print(IsAnagram().isAnagramSet(first:"dad",second:"add"))



/*  Remove a character from String */

struct RemoveCharacter{
    
    func removeCharacter(_ inputStr: String, _ removeChar: Character) -> String {

        let strData = inputStr.characters.map { (ch) -> String in
            var result:String? = ""
            if (String(ch) != String(removeChar)) {
                result?.append(ch)
            }
            return result!
        }
        
        return String(describing: strData)
    }
    
    
    func removeCharacterAlt(_ inputStr: String, _ removeChar: Character) -> String {
        var result:String? = ""
        let strData = inputStr.characters.map { $0 }
        for i in 0..<strData.count{
             if (strData[i] != removeChar) {
                    result?.append(strData[i])
            }
        }
        return result!
    }
    
    func printRepeatedCharacteFirtsOccurence(_ inputStr: String, _ removeChar: Character) -> String {
        var result:String? = ""
        var occurenceFlag:Bool = false
        var dict: [Character : Int] = [:]
        
        let strData = inputStr.characters.map { $0 }
        
         for i in 0..<strData.count{
            let data = strData[i]
            if (data != removeChar ) {
                result?.append(data)
            }else{
                if(!occurenceFlag){
                    result?.append(data)
                    occurenceFlag = true
                }
            }
        }
        return result!
    }

}

print(RemoveCharacter().removeCharacterAlt("Java", "a"))
print(RemoveCharacter().printRepeatedCharacteFirtsOccurence("JavaaaaaP", "a"))







