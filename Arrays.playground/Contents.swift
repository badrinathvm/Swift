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

print("Programme for finding the difference")

extension Int {
    var array: [Int] {
        return description.characters.flatMap{Int(String($0))}
    }
}

var b = 4321
var a = 2210

func getCount( a:Int , b :Int){
    
    let aArray = a.array
    let bArray = b.array
    var diff:Int = 0
    var counter:Int = 0
    
    print(aArray)
    print(bArray)
    
    for i in 0..<aArray.count{
        
        if (bArray[i] < aArray[i]){
            diff = bArray[i] - aArray[i]
            let res = diff + aArray[i]
            if (res == bArray[i]){
                print("success")
            }
        }else{
            diff = bArray[i] + aArray[i]
            let res = diff - aArray[i]
            if (res == bArray[i]){
                print("success else")
            }
        }
        counter += 1
        
    }
    print(counter)
}

getCount(a: a, b: b)


print("Programm for disppaeared numbers in an array")

struct DisappearedNumbers{
    
    static func findDisppearedNumbers(nums: inout [Int]) ->[Int]{
        
        for i in 0..<nums.count{
            let value:Int = abs(nums[i]) - 1
            
            //mark them as visited
            if(nums[value] > 0){
                nums[value] = -nums[value]
            }
        }
        
        var result:[Int] = []
        
        //if number is positive return their index + 1
        for i in 0..<nums.count{
            if(nums[i] > 0 ){
                result.append(i+1)
            }
        }
    
        return result

    }
    
    
    static func findConsectivesCount(nums: [Int]) ->Int{
        var counter:Int = 0
        var result:Int = 0
        
        for i in 0..<nums.count{
            
            if ( nums[i] == 1){
                counter += 1
                result = max(counter,result)
            }else{
                counter = 0
            }
        }
        
        return result
    }
    
    static func nonDuplicates(nums: [Int]){
        
        var dict:[Int:Int] = [:]
        for i in 0..<nums.count{
            if dict.keys.contains(nums[i]){
                dict[nums[i]] = dict[nums[i]]! + 1
            }else{
                dict[nums[i]] = 1
            }
        }
        
        for (key,value) in dict{
            if value == 1 {
                print(key,terminator:" ")
            }
        }
    }
    
    static func findGreatestProduct(nums: [Int]) -> Int?{
        
        var result: Int = -1
        
        for i in 0..<nums.count{
            for j in 0..<nums.count-1{
                for k in j+1..<nums.count{
                    if(nums[j] * nums[k] == nums[i]){
                        result = max(result,nums[i])
                    }
                }
            }
        }
        
        return result
    }
    
    static func mergeTwoArrays(ar1:[Int], ar2:[Int]){
        

        var (i,j,n1,n2,k) = (0,0,ar1.count,ar2.count,0)
        
        var ar3 = Array(repeating: 0, count: (n1+n2))
        
        while ( i<n1 && j<n2){
            
            if ( ar1[i] < ar2[j]){
                ar3[k] = ar1[i]
                k += 1
                i += 1
            }else{
                ar3[k] = ar2[j]
                k += 1
                j += 1
            }
        }
        
        while (i < n1){
            ar3[k] = ar1[i]
            k += 1
            i += 1
        }
        
        while ( j < n2){
            ar3[k] = ar2[j]
            k += 1
            j += 1
        }
        
        
        print(ar3)
        
    }
    
}

var ar = [4,3,2,7,8,2,3,1]
print(DisappearedNumbers.findDisppearedNumbers(nums: &ar))

var ar2 = [1,1,0,0,1,1,1,1]
print(DisappearedNumbers.findConsectivesCount(nums: ar2))

var ar3 = [4,3,2,7,8,2,3,1]
DisappearedNumbers.nonDuplicates(nums: ar3)
print()


print("Find a pair with gratest product in an array")
var ar4 = [30,10,9,3,35]
print(DisappearedNumbers.findGreatestProduct(nums: ar4)!)
print()

print("Program to merge two sorted arrays")
var ar5 = [1,3,5,7]
var ar6 = [2,4,6,8]

DisappearedNumbers.mergeTwoArrays(ar1: ar5, ar2: ar6)
print()

print("Split array in to two sub arrays ")

struct SplitArrays{
    
    static func splitArrays(nums:[Int], n:Int) -> Int?{
    
        var (leftSum,rightSum) = (0,0)
    
        for i in 0..<n{
            leftSum += nums[i]
        }
    
        for i in stride(from:n-1, to:0, by:-1){
            
            // add current element to right_sum
            
            rightSum += nums[i]
            
                    // exclude current element to the left_sum
            leftSum -= nums[i]
            
            if( rightSum == leftSum){
                return i
            }
        }
    
    return -1
    
    }
    
    static func printTwoParts(nums:[Int],n:Int){
        
        let splitPoint = splitArrays(nums:nums,n:n)
        
        if (splitPoint == -1 || splitPoint == n){
             print("Not possible")
            return
        }
        
        for i in 0..<nums.count {
            
            if (splitPoint == i){
                print()
            }
                print(nums[i],terminator:" ")
            
        }
    }
}

var ar7 = [1,2,3,4,5,5]



SplitArrays.printTwoParts(nums:ar7,n:ar7.count)


print()
print("Programm for finding thr count of maximum consecutive ones")
struct MaxConsecutiveOnes{
    
    static func maxConsecutiveOnes(nums:[Int]) ->Int{
        
        var (maxy,current) = (0,0)
        
        for i in nums{
            
            current = (i == 0) ? 0 : (current + 1)
            
            maxy = max(maxy, current)
        }
        
        return maxy
    }
    
}

print(MaxConsecutiveOnes.maxConsecutiveOnes(nums: [1,1,1,0,1,1,1,1]))


print()
print("Programme for finding the third maximum")

struct ThirdMaximum{
    
    static func thirdMaximum(nums:[Int]){
        let set = NSMutableSet()
        
        for n in nums{
            set.add(n)
            
            if(set.count > 3){
                set.remove(set.dropLast())
            }
        }


        if( set.count < 3 ){
            set.dropLast()
        } else {
            set.dropFirst()
        }
    }
}

var ar8 = [3,2,4,0]
ThirdMaximum.thirdMaximum(nums:ar8)


print("Prpogramms to end and beginning of zeros")

struct MoveZerosToEnd{
    
    static func moveZerosToEnd(nums:inout [Int]){
        var counter = 0
        
        for i in 0..<nums.count{
            
            if ( nums [i] != 0){
                nums[counter] = nums[i]
                counter += 1
            }
        }
        
        while (counter < nums.count){
            nums[counter] = 0
            counter += 1
        }
        
        print(nums)
    }
    
    static func movZerosToBeginning(nums: inout[Int]){
        
        var counter: Int = nums.count - 1
        
        for i in stride(from: nums.count-1, to: -1, by: -1){
            if (nums[i] != 0){
                nums[counter] = nums[i]
                counter -= 1
            }
        }
        
        
        while(counter >= 0){
            nums[counter] = 0
            counter -= 1
        }
        
        print(nums)
        
    }
    
}

var ar9 = [0,12,1,0,8]

MoveZerosToEnd.moveZerosToEnd(nums: &ar9)

MoveZerosToEnd.movZerosToBeginning(nums: &ar9)













