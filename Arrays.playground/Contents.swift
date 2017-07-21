//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct SearchRotatedArrays{
    
    static func search(arr:[Int], low:Int , high:Int,key:Int) -> Int?{
    
        if (low > high ) {
            return -1
        }
        
        let mid:Int = (low + high)/2
        
        if (key == arr[mid]){
            return mid
        }
        
        if( key >= arr[low] && key <= arr[mid] ) {
          return search(arr: arr, low: low, high: mid - 1, key: key)
        }else{
            return search(arr: arr, low: mid + 1, high: high, key: key)
        }
        
        if ( key >= arr[mid] && key <= arr[high]){
            return search(arr: arr, low: mid + 1, high: high, key: key)
        }else{
             return search(arr: arr, low: low, high: mid - 1, key: key)
        }

    }
    
    
    static func findMin(arr: [Int], low:Int, high:Int) -> Int?{
        
        //IF array is not rotated at all 
        if( high < low){
            return arr[0]
        }
        
        //If there is only one element
        if ( high == low){
            return arr[low]
        }
        
        let mid:Int = (low + high) / 2
        
        //return (mid + 1) {3,4,5,1,2}
        if ( mid < high && arr[mid+1] < arr[mid]){
            return arr[mid+1]
        }
        
        //checkign mid itself is minimum element
        if( mid > low && arr[mid] < arr[mid-1]){
            return arr[mid]
        }
        
        //decide to get left or right 
        if( arr[high] > arr[mid]){
            return findMin(arr: arr, low: low, high: mid-1)
        }else{
            return findMin(arr: arr, low: mid+1, high: high)
        }
        
    }
    
}

var arr:[Int] = [3,4,5,0,1,2]

print(SearchRotatedArrays.search(arr: arr, low: 0, high: arr.count - 1, key: 1)!)


print(SearchRotatedArrays.findMin(arr: arr, low: 0, high: arr.count - 1)!)


var number = arr.filter{ $0 > 0 }

var number1 = arr.filter { (value:Int) -> Bool in
  
    return value > 0
}

print(number1)



