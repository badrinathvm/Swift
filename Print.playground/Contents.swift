//: Playground - noun: a place where people can play

import UIKit

//Dictionary Operations

var seasons = ["Spring" : 20, "Summer" : 30, "Autumn" : 10]

seasons["Winter", default: 5] = 10
seasons["Monsoon", default:5] = 40

print(seasons)

let keyArray = Array(seasons.keys)  // When keys are Strings.

let keysAltArray = seasons.flatMap { $0.0 } // When keys are integers.

//Grouping
let groupDictByFirst = Dictionary(grouping: keyArray ) { $0.characters.first! }
print(groupDictByFirst)

let groupByCount = Dictionary(grouping: keyArray ) { $0.count }
print(groupByCount)

// mapValues to get new Dictionary
let newSeasonDict = seasons.mapValues { $0 * 2 }
print(newSeasonDict)

//Sorting a Dictionary
newSeasonDict.sorted { $0.0 < $1.0 }.forEach {
    print("\($0.0) ==> \($0.1)")
}

//fetch first one from sorted Dict
let firstOne = newSeasonDict.sorted { $0.0 < $1.0 }.first?.key
print(firstOne!)

//Maximum Key from a Dictionary
let maxSeason = newSeasonDict.max { $0.1 < $1.1 }?.key
print(maxSeason!)

//finding minimum from a Dictionary
let minAltSeason = newSeasonDict.max { $0.1 > $1.1}?.key
print("Min Alt Season \(minAltSeason!)")

let minSeason = newSeasonDict.min { $0.1 < $1.1 }?.key
print("Min Season \(minSeason!)")

//Fetch key and value pair from index
let summerIndex = newSeasonDict.index(forKey: "Summer")
print(newSeasonDict[summerIndex!])    //(key: "Summer", value: 60)

let whereResult = newSeasonDict.index(where: { $0.1 == 20 } )
print(newSeasonDict[whereResult!])  //(key: "Autumn", value: 20)

//Zip feature
let season = Array(seasons.keys)
let temps = Array(seasons.values)

var zippedDict = Dictionary(uniqueKeysWithValues: zip(season,temps))
print(zippedDict)

let moreSeasons = ["Rainy":  1 ,"Summer" : 10]

//Keeping the existing value for Summer  ( wont replace )
zippedDict.merge( moreSeasons ){ (current, _) in current }  // Summer : 30
print(zippedDict)

//other way of maintaning the existing value
zippedDict.merge( ["Rainy": 2], uniquingKeysWith: min )
print(zippedDict)

//Taking the new value for Summer
zippedDict.merge( moreSeasons ){ (_,new ) in new }
print(zippedDict)

//Updating Value for Dictionary
zippedDict.updateValue(2,forKey:"Rainy")
print(zippedDict)

//Filtering an Dictionary based on value.
let filteredDict = zippedDict.filter { $0.1 > 10 }
print(filteredDict)

//sort key values(array) inside dictionary
var valueArrayDict = ["a" : [1,7,5,3] , "b" :[2,6,8,4] ]
let sortedKeyValueDict = valueArrayDict.mapValues { $0.sorted { $0 < $1 }}.sorted { $0.0 < $1.0 }
print(sortedKeyValueDict)

// Note : sorted { $0 < $1 } = sorted(by: < )

//Reduce into
let str = "practiceswift"
let countDict = str.reduce(into : [:] ) { count, letters in
    count[letters, default:0] += 1
}

print(countDict.sorted { $0.0 < $1.0 })

//Sorting a Dictionary
let dict = ["A": 123, "B": 789, "C": 567, "D": 432]
let dictKeyInc = dict.sorted(by: <)
let dictKeyDec = dict.sorted(by: >)
print(dictKeyInc)
print(dictKeyDec)

//check whether array is consecutive or not

let list = [2,3,4,5,6]
let consecutives = list.map { $0 - 1 }.dropFirst() == list.dropLast()
print(consecutives)

// list.map { $0 - 1 } -> Returns  [ 1,2,3,4,5 ] ( dropping first ) => [2,3,4,5]
// list.dropLast()  -> Takes out 6 and returns [ 2,3,4,5]
