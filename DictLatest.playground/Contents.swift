//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

import Foundation


class Swift4 {
    
    func DictZipTuples(){
        
        let tupleArray = [("Monday", 30),  ("Tuesday", 25),  ("Wednesday", 27),   ("Thursday", 20),  ("Friday", 24),  ("Saturday", 22),  ("Sunday", 26)]
        
        let dictionary = Dictionary(uniqueKeysWithValues: tupleArray)
        
        //let keys = Array(dictionary.keys)
        //let values = Array(dictionary.values)
        let altDays = Array(dictionary.keys)
        //print(altDays)
        
        let daysValues = dictionary.flatMap { $0.1 }
        //print(daysValues)
        
        var newDict = Dictionary(uniqueKeysWithValues: zip(altDays,daysValues))
        
        print(newDict)
        
        let duplicateTuples = [("Monday",1), ("Tuesday",2)]
        
        newDict.merge(duplicateTuples,uniquingKeysWith: min)
        
        print(newDict)
        
        
    }
    
}

var swift4 = Swift4()
swift4.DictZipTuples()



var seasons = ["Spring" : 20, "Summer" : 30, "Autumn" : 10]
//let winterTemperature = seasons["Winter"] ?? 0 //Swift 3
let winterTemperature = seasons["Winter", default: 0]
print(winterTemperature)

print(seasons.mapValues { $0*2 }) //returns a new Dictionary by multipying it's values.

//let mappedArray = seasons.map{season in (season.key, season.value * 2)}
let mappedArray = seasons.map { ($0.0, $0.1*2) }
print(mappedArray)



let filteredDictionary = seasons.filter{$0.value > 15}
print("Filtered Dictionary \(filteredDictionary)")

let scores = [7, 20, 5, 30, 100, 40, 200]
let groupedDictionary = Dictionary(grouping: scores, by:{ String($0).count })
print(groupedDictionary)

let groupedDictClosures = Dictionary(grouping: scores) { String($0).count }
print(groupedDictClosures)


let char = "A"
let asciiCode = char.unicodeScalars[char.unicodeScalars.startIndex].value
print(asciiCode)


extension Array where Element: Comparable {
    // 2
    subscript(minValue: Element, maxValue: Element) -> [Element] {
        // 3
        var array: [Element] = []
        // 4
        if let minimum = self.min(), minimum == minValue {
            // 5
            array.append(minValue)
        }
        // 6
        if let maximum = self.max(), maximum == maxValue {
            array.append(maxValue)
        }
        // 7
        return array
    }
}


let primeNumbers = [3, 7, 5, 19, 11, 13]

let noMinOrMaxNumber = primeNumbers[5, 11] //provided it should exists in prime number array.

print(noMinOrMaxNumber)


extension Array where Element: Comparable {
    // 1
    subscript<T: Sequence>(type: String, sequence: T) -> [T.Element] where T.Element: Equatable {
        // 2
        var array: [T.Element] = []
        // 3
        if let minimum = self.min(), let genericMinimum = minimum as? T.Element, sequence.contains(genericMinimum) {
            array.append(genericMinimum)
        }
        if let maximum = self.max(), let genericMaximum = maximum as? T.Element, sequence.contains(genericMaximum) {
            array.append(genericMaximum)
        }
        
        return array
    }
}


let noMinOrMaxArray = [3, 11, 23]
let numberFirstArray = primeNumbers["array", noMinOrMaxArray]
print(numberFirstArray)

//print(primeNumbers.sorted().first)
//print(primeNumbers.sorted().last)

print((primeNumbers.sorted().prefix(1).first)!)
print((primeNumbers.sorted().suffix(1).first)!)


var arr = [1,2,3,4,5,6]

extension Array {
    mutating func shiftRight() {
        if let obj = self.popLast(){
            self.insert(obj,at:0)
        }
    }
    
    
    // mutating func shiftLeft(){
    //   if let first = self.removeFirst(){
    //      self.insert(first,at:self.count)
    //   }
    // }
    
    
    //    mutating func shiftLeft() {
    //      if let obj = self.removeFirst(){
    
    //      }
    //    }
    
}


//arr.shiftRight()
//print(arr)


//Rotate Right

var array = [1,2,3,4,5,6]
var last = array.removeLast()
array.insert(last,at:0)
print(array)


var leftRotate = [1,2,3,4,5,6]
var first = leftRotate.removeFirst()
leftRotate.insert(first,at:leftRotate.count)
print(leftRotate)


var str = ["Aabab","Bbbb","ACCC", "Bnn"]

var alphaDict = Dictionary(grouping:str) { String($0).count }

print(alphaDict)

let alphaDict1 = Dictionary(grouping: str) { $0.characters.first! }

print(alphaDict1)


var maxDict = [1:20,2:30,3:60]
print((maxDict.max { $0.1 < $1.1 }?.key)!)


let result = maxDict.index(where: { $0.1 == 20})
print(maxDict[result!])

let keyResult = maxDict.index(forKey: 1)
print(maxDict[keyResult!])

var data = "badarinath"

let resultDict = data.reduce(into : [:]) { count,letters in
    count[letters,default:0] += 1
}

print(resultDict)

let keys = Array(resultDict.keys)
let values = Array(resultDict.values)

let zippedDictionary = Dictionary(uniqueKeysWithValues: zip(keys,values))

zippedDictionary.sorted{ $0.0 < $1.0}.forEach {
    print("\($0.0) ===> \($0.1)")
}















































