//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


struct Anagrams{
    
    static func anagrams(_ strings: [String] ) -> [String]{
        var result: [String] = []
        
        var sortedStrings = strings
        var map = [String: [Int]]()
        for i in 0 ..< strings.count {
            var arr: [Character] = Array(sortedStrings[i].characters)
            arr.sort {$0 < $1}
            sortedStrings[i] = String(arr)
           
            if (map.keys.contains(sortedStrings[i])){
                map[sortedStrings[i]]!.append(i)
            }else{
                map[sortedStrings[i]] = [i]
            }
        }
        
           //print(map)
        
            for( _ , intArr) in map{
                if intArr.count > 1 {
                    for i in 0..<intArr.count {
                        result.append(strings[intArr[i]])
                    }
                }
            }
    

        return result
    }
    
    
    static func anagramsGrouping(_ strings: [String] ) -> [String : [String]]{
        var enhancedResult: [ String : [String]] = [:]
        
        var sortedStrings = strings
        var map = [String: [Int]]()
        for i in 0 ..< strings.count {
            var arr: [Character] = Array(sortedStrings[i].characters)
            arr.sort {$0 < $1}
            sortedStrings[i] = String(arr)
            
            if (map.keys.contains(sortedStrings[i])){
                map[sortedStrings[i]]!.append(i)
            }else{
                map[sortedStrings[i]] = [i]
            }
        }
        
        print(map)
        
        
        for (key , value) in map {
            //if value.count > 1 {
                var result: [String] = []
                for i in 0..<value.count{
                    result.append(strings[value[i]])
                    enhancedResult[key] = result
                }
            //}
        }
        
        print(enhancedResult)
        
        return enhancedResult
    }
}

Anagrams.anagrams(["bca","cba","ard","dar","rad","123"])

Anagrams.anagramsGrouping(["bca","cba","ard","dar","rad","123","321","456"])

