//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func twoSum() -> [Int]{
    
    let twoSumArray = [2,1,4,1]
    let target = 5
    var dict  = [Int:Int]()
    
    for (index,element) in twoSumArray.enumerated()  {
        
        //print("Element is \(dict[target-element])")
        
        if let lastIndex = dict[target-element]{
            print(lastIndex)
            print(index)
            return [lastIndex,index]
        }
        
        dict[element] = index
    }
    
    fatalError("No valid Inputs")
    
    //print(dict)
}

twoSum()


func stringCompress() {
    //updated chunks array is passed to next iteration
    
    let chunks = str.characters.reduce([(Character, Int)]()) { (chunks, char) -> [(Character, Int)] in
        
        
        //get a mutable copy
        var _chunks = chunks
        
        //get a count if last char is same; 0 otherwise
        let count = _chunks.last?.0 == char ? _chunks.last!.1 : 0
        //remove tuple inorder order to update the latest count one.
        if count > 0 {_chunks.removeLast()}
        
        //append tuple with incremented count
        _chunks.append((char, count + 1))
        return _chunks
    }
    
    print(chunks.map { chunk in  chunk.1 == 1 ? "\(chunk.0)" : "\(chunk.0)\(chunk.1)" }.reduce("",{ String($0) + String($1) }))
    
}

stringCompress()
