//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

import Foundation

class ArrayProblems{
    
    func groupPositiveNegatives(){
        
        let arr = [1, -1, 3, 2, -7, -5, 11, 6 ]
        let positiveArray = arr.filter{   $0 > 0 }
        let negativeArray = arr.filter{   $0 < 0 }
        
        // negativeArray.map{
        //   positiveArray.append($0)
        // }
        
        let result = positiveArray + negativeArray
        
        print(result)
    }
    
    func groupOneZeroArray(){
        let arr =  [0, 1, 0, 1, 0, 0, 1, 1, 1, 0]
        let oneArray = arr.filter { $0 == 1 }
        let zeroArray = arr.filter { $0 == 0 }
        print( oneArray + zeroArray )
    }
    
   // http://www.geeksforgeeks.org/sort-an-array-according-to-absolute-difference-with-given-value/
    
    func sortArrayAccordingToAbsoluteDifference(){
        
        let arr = [10, 5, 3, 9, 2]
        let x = 7
        var sortDict = [Int:Int]()
        
        arr.forEach{
            sortDict[$0, default:0] = abs($0 - x)
        }
        
        let result = sortDict.sorted { $0.1 < $1.1 }.flatMap { $0.0 }
        
        print(result)
        
    }
    
}

let arrayProblems = ArrayProblems()
arrayProblems.groupPositiveNegatives()
arrayProblems.groupOneZeroArray()
arrayProblems.sortArrayAccordingToAbsoluteDifference()

















