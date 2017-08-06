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

var arr:[Int] = [3,4,5,0,1,2,3]

print(SearchRotatedArrays.search(arr: arr, low: 0, high: arr.count - 1, key: 3)!)


print(SearchRotatedArrays.findMin(arr: arr, low: 0, high: arr.count - 1)!)


var number = arr.filter{ $0 > 0 }

var number1 = arr.filter { (value:Int) -> Bool in
  
    return value > 0
}

print(number1)

print("Programm for pair in sorted rotated array")

struct PairSortedArray{
    
    static func pairSortedArray(arr:[Int], n:Int, x:Int) -> Bool{
        
        var k :Int = 0
        //Find teh pivot element
        for i in 0..<n{
            if (arr[i] > arr[i+1]){
                k = i
                break
            }
        }
        
        var l:Int = (k+1)%n
        var r:Int = k
        
        
        while (l != r){
            
            //If it equals sum
            if ( (arr[l] + arr[r]) == x){
                return true
            }
            
                // If current pair sum is less, move to the higher sum
            if ( (arr[l] + arr[r]) < x){
                l = (l+1)%n
            }else{
                //Move to the lower sum side
                r = (n+r-1)%n
            }
        }

        return false
    }
    
}

var a:[Int] = [11,15,6,8,9,10]
print(PairSortedArray.pairSortedArray(arr: a, n: a.count, x: 14))


print("Program to segregate odd and even")

struct SegregateOddEven{
    
    static func segregateOddEven(arr: inout [Int]) -> [Int]{
        var (left,right) = (0,arr.count-1)
        
        while ( left < right ){
            
            //find even number and keep on incrementing
            if ( arr[left]%2 == 0 && left < right){
                left += 1
            }
            //find odd even number and decrementing
            if(arr[right]%2 == 1 && left < right){
                right -= 1
            }
            
            if (left < right){
                let temp = arr[left]
                arr[left] = arr[right]
                arr[right] = temp
                left += 1
                right -= 1
            }
        }
        
        return arr
    }
    
    static func segregateZeroOne(arr: inout [Int]) -> [Int]{
        var (left,right) = (0,arr.count-1)
        
        while ( left < right ){
            
            //find even number and keep on incrementing
            if ( arr[left]%2 == 0 && left < right){
                left += 1
            }
            //find odd even number and decrementing
            if(arr[right]%2 == 1 && left < right){
                right -= 1
            }
            
            if (left < right){
                arr[left] = 0
                arr[right] = 1
                left += 1
                right -= 1
            }
        }
        
        return arr
    }

}

var oddEvenArray = [1,2,3,4,5,6,7]
print(SegregateOddEven.segregateOddEven(arr: &oddEvenArray))

var zeroOneArray = [1,0,0,1,1,0,0]
print(SegregateOddEven.segregateZeroOne(arr: &zeroOneArray))


print("Find the first smallest number")

struct FindFirstSmallest{
    
    static func findFirstSmallest(nums: inout [Int]) -> Int?{
        
        var k:Int = 0
        print(nums.count)
        for i in 0..<nums.count{
            if ( nums[i] > 0 && nums[i] <= nums.count){
                var temp:Int = nums[i]
                if( (nums[i]-1) != i && nums[temp-1] != nums[i]){
                    print("Swapp")
                    var t:Int = nums[temp-1]
                    nums[temp-1] = nums[i]
                    nums[i] = t
                                k = i
                    k -= 1
                }
            }
        }
        
        for i in 0..<nums.count{
            if (nums[i] != i+1){
                return i+1
            }
        }
        
        return nums.count+1
    }
}

var findArray = [3,4,-1,1]
print(FindFirstSmallest.findFirstSmallest(nums: &findArray)!)

