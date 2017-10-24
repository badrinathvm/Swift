//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// Eliminate Dupliactes 

var arr = [1.0, 4, 2.0, 2.0, 6, 24, 15, 2, 60, 15, 6]



var arr1 = [1, 4 ,6, 24, 15 ]

extension Array where Element : Hashable{
    
    var orderedSet : Array {
        var set = Set<Element>()
        
        return filter{ set.insert($0).inserted}
        
        //return flatMap { set.insert($0).inserted ? $0 : nil  }
        
    }
}

print(arr.orderedSet)



// Print Duplicates 

var x = [5,5,1,1,2,3,4]
x.sort { (one, two) -> Bool in
    return one < two
}
print(x)

x.sort{ return $0 < $1}
print(x)

var resultSum = 0

resultSum = x.reduce(0) { (x, y) -> Int in
    return x+y
}
print( resultSum )

resultSum = x.reduce(0, { (x,y) in x+y })
print( resultSum )

resultSum = x.reduce(0, { $0 + $1 })
print( resultSum )



let data =
        x.filter { i in
            x.filter { $0 == i }
                .count > 1
        }
    
print(Set(data))


extension Array where Element: Hashable{
    var printDuplicates: Array{
        return filter { i in
             filter { $0 == i }
                .count > 1
        }
    }
}

print(Set(data.printDuplicates))


print("String Compression")

var s = "aabcccccdd"
var output = ""
var sum:Int = 1

var dataMap = s.characters.flatMap { $0 }

for i in 0..<dataMap.count-1{
    if ( dataMap[i] == dataMap[i+1]) {
        sum += 1
    }else{
        output += "\(dataMap[i])\(sum)"
        sum = 1
    }
}

output =  output + "\(dataMap[dataMap.count-1])\(sum)"

print(output)


//var opt1:String? = nil
//print(opt1)

//var opt2:String? = .none
//print(opt2)



var thing = "cars"

let closure = { [thing] in
    print("I love \(thing)")
}

thing = "airplanes"

closure()  // i love cars

let closure1 = { [thing]  in
    print("I love \(thing)")
}

closure1()  // i love airplanes

func testGuard(val : inout Int){
    
    guard val == 0 else {
        print ("Un Success")
        return
        //fatalError()
    }
    
    print ( val )
}

var guardData = 1
testGuard(val: &guardData)



struct Pizza {
    let ingredients: [String]
}

protocol Pizzeria {
    func makePizza(_ ingredients: [String]) -> Pizza
    //func makeMargherita() -> Pizza
}

extension Pizzeria {
    func makeMargherita() -> Pizza {
        return makePizza(["tomato", "mozzarella"])
    }
}

struct Lombardis: Pizzeria {
    func makePizza(_ ingredients: [String]) -> Pizza {
        return Pizza(ingredients: ingredients)
    }
    func makeMargherita() -> Pizza {
        return makePizza(["tomato", "basil", "mozzarella"])
    }
}

let lombardis1: Pizzeria = Lombardis()
let lombardis2: Lombardis = Lombardis()

print(lombardis1.makeMargherita())
print(lombardis2.makeMargherita())

class Star {
    class func spin() { }
    static func illuminate() {}
}

class Sun : Star{
    override class func spin(){
        
    }
    
    // error: class method overrides a 'final' class method
//    override static func illuminate(){
//        
//    }
}



//optional Pattern 

let z:Int? = 10
if case let g? = z {
    print (g)
}


let arraofOptionals : [Int?] = [ nil,2,3,nil,4]

for case let number? in arraofOptionals{
    print("Founder a \(number)")
}

var dict:[String: Int] = ["one":1,"two":0]

let keys = dict.flatMap {  $0.0 }
print(keys)

let values = dict.flatMap { $0.1 }
print(values)

let filtered = dict.filter{ $0.1 > 0 }
filtered.map({ (key: String, value: Int) -> Bool in
    print("\(key) \(value)")
    return true
})

let oddArray = [ 1,2,4,3,5,7]

let resultOddArray = oddArray.filter({ ($0 % 2 == 1) })

print(resultOddArray)


var unSortMap:[String:Int] = ["t":12,"z":10, "a":1]
print(unSortMap.sorted { $0.0 < $1.0 })
print(unSortMap.sorted { $0.1 < $1.1 })

for i in unSortMap.sorted(by:{ $0.0 < $1.0 } ){
    print ("\(i.key) ---> \(i.value)" )
}

//Swift 4 Solution

/* var singleNumberArray = [1, 2, 2, 3, 3, 4, 4, 4,5]
var count:[Int:Int] = [:]
singleNumberArray.forEach { count[$0,default:0] += 1 }
var result = count.filter { $0.1 == 1 }.flatMap { $0.0 }
print(result ) 
 
 
 //Frequency Sort
 
 var frequencyMap = [Int:Int]()
 singleNumberArray.forEach { frequencyMap[$0,default:0] += 1 }
 frequencyMap.sorted (by: { $0.1 < $1.1 }).forEach{ result in
 print( result.key )
 }
 */


var majorityArray = [3,3,3,3,3,10,10,1,2]
majorityArray.sort()
print(majorityArray[majorityArray.count/2])


//First unique Character

//var uniqueCharacter = "leetcode"
//var resultDict = [Character:Int]()
//var strArray = uniqueCharacter.characters.flatMap { $0 }
//
//strArray.forEach{
//    resultDict[$0,default:0] += 1
//}
//
//for ch in strArray{
//    print((resultDict.filter { ($0.0 == ch ) && ($0.1 == 1) }.first?.key)! as Any )
//    break
//}


import Foundation

class ReverseVowels{
    
    func reverseVowels(str: inout String){
        var vowList = Array<String>()
        vowList.append("a")
        vowList.append("e")
        vowList.append("i")
        vowList.append("o")
        vowList.append("u")
        
        var strArray = str.characters.flatMap { String($0) }
        var ( i, j) = (0, strArray.count-1)
        
        while( i < j ){
            
            if( !vowList.contains( strArray[i]) ){
                i += 1
                continue
            }
            
            if( !vowList.contains( strArray[j])){
                j -= 1
                continue
            }
            
            //strArray.swapAt(i,j)
            swap(&strArray[i], &strArray[j])
            i += 1
            j -= 1
        }
        
        
        //print(String(strArray))
        
        print(strArray.joined(separator: ""))
        
    }
    
}


var sz = "hello"

ReverseVowels().reverseVowels(str: &sz)

print(sz.characters.sorted())


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
        
        print(resultDict.flatMap { $0.0 }.sorted() )
        
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
}


let panagrams = Panagrams()
panagrams.detectPanagrams()
panagrams.maxOccuring()
panagrams.unique()
panagrams.eliminateDuplicates()
panagrams.reverseWords()


//let str = "abcdefg"
//let indexStartOfText = str.index(str.startIndex, offsetBy: 3)
//let indexEndOfText = str.index(str.endIndex, offsetBy: -1)
//print(str[indexStartOfText..<indexEndOfText])



// print(str[2...])

// let greeting = "Hi there! It's nice to meet you!"
// let endOfSentence = greeting.index(of: "!")!
// let firstSentence = greeting[...endOfSentence]
// print(firstSentence)






































