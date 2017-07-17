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


/* Program to print all combinations of String */


struct Combinations{
    
    func combinations(_ input:String ) -> [String]{
        var list:[String] = []
        var strData = input.characters.map { $0 }
        for i in 0..<strData.count {
            
            var test:String = ""
            
            test += String(strData[i])
            
            list.append(test)
        }
        
        return list
    }
    
    
    func permuteWirth<T>(_ a: [T], _ n: Int) {
        if n == 0 {
               // display the current permutation
            print(a)
            //printy(a as! [String])
            
        } else {
            var a = a
            permuteWirth(a, n - 1)  //   (a,1) (a,0) => abc
            for i in 0..<n {          //2
                swap(&a[i], &a[n])
                permuteWirth(a, n - 1)  //
                swap(&a[i], &a[n])
            }
        }
    }
    
    func printy(_ array: [String]){
        
        print(array.joined(separator: ""))

    }
    
}

//print(Combinations().combinations("ABC"))

let letters = [1, 2, 3]
Combinations().permuteWirth(letters, letters.count - 1)


let cafe = "Str"

print(cafe.characters.indices)


/* Program for length of the last word */

private extension String{
    subscript (index: Int) -> Character {
        return self[self.characters.index(self.startIndex, offsetBy: index)]
    }
}


struct LengthLastWord {
    
    static func lengthOfLastWord(_ str:String) -> Int {
    
        var (len,i) = (0,0)
      
        while i < str.characters.count{
            if str[i] != " "{
                    len += 1
            } else if i+1 < str.characters.count && str[i+1] != " "{
                    len = 0
            }
            i += 1
        }
        
        return len
    }
}

print(LengthLastWord.lengthOfLastWord("Hello World!"))









