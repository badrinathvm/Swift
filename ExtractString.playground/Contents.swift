//: Playground - noun: a place where people can play

import UIKit

import Foundation

class ExtractDigitsString{
    
    static func extractAdd(s:String) {
        
        var temp = ""
        var list = [Int]()
        
        let resultData = s.flatMap { $0 }
        
        for i in resultData{
            if( i >= "0" && i <= "9"){
                temp += String(i)
            }else{
                if(temp.characters.count > 0){
                    list.append(Int(temp)!)
                    temp = ""
                }
            }
        }
        
        
        if( String(resultData.last!) >= "0" && String(resultData.last!) <= "9"){
            list.append(Int(temp)!)
        }
        
        let finalResult = list.reduce(0, {x,y in x+y })
        print(finalResult)
        
    }
}

ExtractDigitsString.extractAdd(s:"abd123d79d")


//Extract a single number for Array

var singleNumberArray = [1, 2, 2, 3, 3, 4, 4, 4,5]
var count = [Int:Int]()
singleNumberArray.forEach { count[$0,default:0] += 1 }
var result = count.filter { $0.1 == 1 }.flatMap { $0.0 }
print(result )

//Frequency Sort

var frequencyMap = [Int:Int]()
singleNumberArray.forEach { frequencyMap[$0,default:0] += 1 }
frequencyMap.sorted (by: { $0.1 < $1.1 }).forEach{ result in
    print( result.key )
}

//Majority element
print("Majority Element is")
var majorityArray = [3,3,3,3,3,10,10,10,10,10,10,1,2]
majorityArray.sort()
print(majorityArray[majorityArray.count/2])


//Occureneces
var occurances = ["tuples", "are", "awesome", "tuples", "are", "cool", "tuples", "tuples", "tuples", "shades"]

var dict:[String:Int] = [:]

occurances.forEach {
    dict[$0,default:0] += 1
}
print ( dict )

//First unique Character

var str = "leetcode"
var resultDict = [Character:Int]()
var strArray = str.characters.flatMap { $0 }
//print(strArray)

strArray.forEach{
    resultDict[$0,default:0] += 1
}

for ch in strArray{
    print((resultDict.filter { ($0.0 == ch ) && ($0.1 == 1) }.first?.key)! as Any )
    break
}




class Palindrome {
    
    func palindrome() -> Bool?{
        var palindromeString = " A man, a plan, a canal: Panama"
        
        palindromeString = palindromeString.replacingOccurrences(of:",|:|", with:"",options:.regularExpression).trimmingCharacters(in: .whitespaces).replacingOccurrences(of:" ",with:"").lowercased()
        
        
        if( palindromeString.count > 1){
            return palin(palindromeString, 0 , palindromeString.count-1)
        }
        
        return false
    }
    
    func palin(_ str: String, _ left:Int, _ right:Int) -> Bool? {
        
        if(left >= right){
            return true
        }
        
        let lhs = str.index(str.startIndex,offsetBy:left)
        let rhs = str.index(str.startIndex,offsetBy:right)
        
        if(str[lhs] != str[rhs]){
            return false
        }
        
        return palin(str,left+1,right-1)
    }
    
    
    func perm(){
        let str = "ABC"
        let (l,r) = (0,str.count-1)
        var s = str.characters.flatMap { $0 }
        permutate(&s,l,r)
    }
    
    
    
    func permutate(_ s: inout [Character], _ l:Int, _ r:Int){
        if(l == r){
            print(String(s))
        }else{
            for i in l...r {
                s.swapAt(l,i)
                permutate(&s, l+1, r)
                s.swapAt(l,i)
            }
        }
    }
    
    
    func ascendingSorting(){
        
        let str = "No one could disentangle correctly a"
        let s = str.split(separator: " ")
        var countDict = [String:Int]()
        
        s.forEach{
            countDict[String($0),default:0 ] = $0.count
        }
        
        for data in countDict.sorted(by: { $0.1 < $1.1 }){
            print("\(data.key) ---> \(data.value)")
        }
    }
    
}

var palindrome = Palindrome()

print(palindrome.palindrome()!)
palindrome.perm()
palindrome.ascendingSorting()


let phoneKeyMap: [Character: [String]] = [
    "2": ["a","b","c"],
    "3": ["d","e","f"],
    "4": ["g","h","i"],
    "5": ["j","k","l"],
    "6": ["m","n","o"],
    "7": ["p","q","r","s"],
    "8": ["t","u","v"],
    "9": ["w","x","y","z"]
]

func phone(_ s:String) -> [String] {
    
    guard let n = s.characters.first else { return [] } // 1
    
    guard let px = phoneKeyMap[n] else { return [] } // ['a,b,c]
    
    if s.characters.count == 1 {
        print(px)
        return px
    }
    
    let sx = phone(String(s.characters.dropFirst()))
    
    return px.flatMap { p in sx.flatMap { s in p+s } }
    
    //return px.flatMap { _ in sx.flatMap { $1 + $0 } }
    
}

print(phone("23"))


class Panagrams{
    
    /* function to detect panagrams */
    
    func detectPanagrams(){
        var str = "The quick brown fox jumps over a lazy dog."
        
        str = str.trimmingCharacters(in: .whitespaces)
            .replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: ".", with: "")
        
        var dict = [Character:Int]()
        
        str.forEach {
            if(!dict.keys.contains($0) ){
                dict[$0 ,default:0] += 1
            }
        }
        
        let values = dict.flatMap { $0.1 }.reduce(0, {x,y in x+y})
        //print(values)
        let result = (values == 26 ) ? "Panagrams" : "Not Panagrams"
        print(result)
    }
    
    
    /* Function for Max Occuring */
    
    func maxOccuring(){
        var str = "Hello! Are you all fine? What are u doing today? Hey Guyz,Listen! I  have a plan for today. Help!"
        
        str = str.replacingOccurrences(of:" ", with:"")
        
        var countDict = [Character:Int]()
        
        str.forEach{
            countDict[$0, default:0] += 1
        }
        
        //fetching the maximum count from dictionary
        let maxCount = countDict.max { $0.1 < $1.1 }?.value
        //print(maxCount)
        
        //sorting the dictionary and filtering the max time occuring ones.
        let resultDict = countDict.sorted { $0.1 > $1.1 }
            .filter { $0.1 == maxCount! }
        
        print( resultDict.flatMap { $0.0 }.sorted() )
        
    }
    
    
    //function to find Uniquness or not
    
    func unique(){
        
        let str = "ABCC"
        
        var uniqDict = [Character: Int] ()
        
        str.forEach{
            uniqDict[$0, default:0] += 1
        }
        
        
        let result = uniqDict.filter { $0.1 > 1 }.count >= 1 ? "Not Unique" : "Unique"
        
        print(result)
        
    }
    
    
    func eliminateDuplicates(){
        
        let str = "aaabbbcc"
        var removeDuplicatesDict = [Character:Int]()
        var resultString = ""
        
        str.forEach{
            if(!removeDuplicatesDict.keys.contains( $0 ) ){
                resultString += String($0)
                removeDuplicatesDict[$0, default:0] += 1
            }
        }
        
        print(resultString)
        
        //print(removeDuplicatesDict.flatMap { $0.0}.reduce("", { String($0) + String($1) }))
        
    }
    
    
    //function to reverse words
    
    func reverseWords(){
        var str = " Hello how are you"
        
        str = str.trimmingCharacters(in: .whitespaces)
        
        let strArray = str.components(separatedBy: " ")
        
        for word in strArray.reversed(){
            print(word, terminator: "\t")
        }
        
        print()
        
    }
    
    
    func productArray(){
        let arr = [10,3,5,6,2] //[180,600,360,300,900]
        
        
        // for i in 0..<arr.count{
        //   print(arr.filter { $0 != arr[i] }.reduce(1, {x,y in x*y}))
        // }
        
        let result = arr.map{ val in
            arr.filter { $0 != val }.reduce(1, {x,y in x*y})
        }
        
        print(result)
        
    }
}


let panagrams = Panagrams()
panagrams.detectPanagrams()
panagrams.maxOccuring()
panagrams.unique()
panagrams.eliminateDuplicates()
panagrams.reverseWords()
panagrams.productArray()


let str = "abcdefg"
let indexStartOfText = str.index(str.startIndex, offsetBy: 3)
let indexEndOfText = str.index(str.endIndex, offsetBy: -1)
print(str[indexStartOfText..<indexEndOfText])



class ReverseVowels{
    
    func reverseVowels(str: inout String){
        var vowList = Array<String>()
        vowList.append("a")
        vowList.append("e")
        vowList.append("i")
        vowList.append("o")
        vowList.append("u")
        
        var strArray = str.characters.flatMap { $0 }
        var ( i, j) = (0, strArray.count-1)
        
        while( i < j ){
            
            if( !vowList.contains( String(strArray[i])) ){
                i += 1
                continue
            }
            
            if( !vowList.contains( String(strArray[j])) ){
                j -= 1
                continue
            }
            
            strArray.swapAt(i,j)
            i += 1
            j -= 1
        }
        
        
        let text = strArray.reduce("", { String($0) + String($1) } )
        print(text)
    }
    
}


var s = "hello"

ReverseVowels().reverseVowels(str: &s)

let str1 = "cat"
let str2 = "tac1"

let s1 = str1.characters.sorted().reduce("", { String($0) + String($1) })
let s2 = str2.characters.sorted().reduce("", { String($0) + String($1) })

print ( s1 == s2 ? "Anagram" : "Not Anagram")

