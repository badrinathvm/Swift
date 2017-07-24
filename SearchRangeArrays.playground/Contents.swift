//: Playground - noun: a place where people can play

import UIKit

// Input: [ 5,7,7,8,8,10 ]  output : [3,4]

struct SearchRange{
    
    static func searchRange(nums: [Int], low:Int, high:Int, target: Int, arr:inout [Int]) -> [Int]{
    
        //print(arr)
        
        //check first element and last element
        if ( nums[low] == nums[high] /* && nums[low] == target */){
            arr[0] = low
            arr[1] = high
            return arr
        }
        
        
        //compare with mid element
        let mid:Int = ( low + high)/2
        
        // checking which route to go if it's less means go towards right ( mid + 1, high) else ( low, mid-1) left
        if ( nums[mid] < target ){
            searchRange(nums: nums, low: mid+1, high: high, target: target, arr: &arr)
        } else if ( nums[mid] > target){
            searchRange(nums: nums, low: low, high: mid-1, target: target, arr: &arr)
        } else{
            arr[0] = mid
            arr[1] = mid
            
            //eliminate duplicates 
            
            var t1:Int = mid
            
            //comparing mid's & mid's left element
            while ( t1>low && nums[t1] == nums[t1-1] ){
                t1 -= 1
                arr[0] = t1
            }
            
            //comparing mid & mid+1 elements
            var t2:Int = mid
            while ( t2 < high && nums[t2] == nums[t2 + 1]){
                t2 += 1
                arr[1] = 1
            }
        }
        
        return arr
    }
    
}

var nums:[Int] = [5,7,7,8,8,10]

var arr:[Int] = Array(repeating: -1, count: 2)

print(SearchRange.searchRange(nums: nums, low: 0, high: nums.count-1 , target: 8, arr: &arr))



//Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
//
//You may assume no duplicates in the array.
//
//Here are few examples.
//[1,3,5,6], 5 → 2
//[1,3,5,6], 2 → 1
//[1,3,5,6], 7 → 4
// [1,3,5,6], 0 → 0


print("Programme for Search Insert input" , terminator:"\n")

struct SearchInsert{
    
    static func searchInsertInput(nums:[Int], target:Int) -> Int{
 
        var( low , high) = (0, nums.count-1)
        
        while (low <= high){
            
            let mid:Int = (low + high)/2
            
            if( nums[mid] < target ){
                low = mid + 1
            }else if( nums[mid] > target){
                high = mid - 1
            }else{
                return mid
            }
        }

        return low
    }
}



print(SearchInsert.searchInsertInput(nums: [1,3,5,6], target: 2))

print(SearchInsert.searchInsertInput(nums: [1,3,5,6], target: 5))

print(SearchInsert.searchInsertInput(nums: [1,3,5,6], target: 7))

print(SearchInsert.searchInsertInput(nums: [1,3,5,6], target: 0))


struct FindDuplicates{
    
    static func findDuplicates(nums:[Int]) -> [Int]{
    var result:[Int] = []
    let ns = NSMutableSet()
    
        for i in 0..<nums.count{
            if ns.contains(nums[i]){
                result.append(nums[i])
            }else{
                ns.add(nums[i])
            }
        }
    
    return result
    
    }
    
    
    static func findDuplicateAbs(nums: inout [Int]) -> [Int]{
        var result:[Int] = []
        for i in 0..<nums.count{
            if (nums[abs(nums[i])] >= 0){
                nums[abs(nums[i])] = -nums[abs(nums[i])]
            }else{
                result.append(abs(nums[i]))
            }
        }
        return result
    }
}

print(FindDuplicates.findDuplicates(nums: [4,3,2,7,8,2,3,1]))

var arr1 = [1, 2, 3, 1, 3, 6, 6]
print(FindDuplicates.findDuplicateAbs(nums: &arr1 ))




struct RotatedArrays{
    
    static func rotateArrays(nums:inout [Int], d:Int,n:Int) -> [Int]{
        var temp:Int

        for i in 0..<d{
            temp = nums[0]
            
            //Shift elements
            var k = 0
           while ( k < n-1 ){
                nums[k] = nums[k+1]
                k += 1
            }
            print(temp)
            nums[k] = temp
        }
        return nums
    }
}

var array = [1,2,3,4,5,6,7]
print(RotatedArrays.rotateArrays(nums:&array,d:4,n:7))

