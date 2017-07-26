//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print()

print("Function to reverse sub arrays ")

struct ReverseArrayGroups{
    
    static func reverseSubArrays(num: inout [Int],k:Int,n:Int)->[Int]{
        
        for i in stride(from: 0, to: n, by: k){
            var left:Int = i
            
                    // to handle case when k is not multiple of n
            var right:Int = min(i+k-1, n-1)
            
            while(left < right){
                swap(&num[left],&num[right])
                left+=1
                right-=1
            }
        }
        
        return num
    }
}

var arr = [1,2,3,4,5,6,7,8,9]
print(ReverseArrayGroups.reverseSubArrays(num: &arr, k: 3, n: arr.count))