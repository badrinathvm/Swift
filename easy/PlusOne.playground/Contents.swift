//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

extension String{
    subscript(index:Int) -> Character{
        return self[self.characters.index(self.startIndex,offsetBy:index)]
    }
}

struct PlusOne{
    
    static func plusOne(_ digits: inout[Int]){
        let n = digits.count
        
        for i in (0...n-1).reversed(){
            if(digits[i] == 9){
                digits[i] = 0
            }else{
                digits[i] += 1
                return
            }
        }
        digits[0] = 1
        digits.append(0)
        
    }
    
    static func removeCommonElementReturnArrayLenght(arr: inout [Int] , ele:Int) -> Int{
        
        var begin = 0
        for i in 0..<arr.count{
            if ( arr[i] != ele){
                arr[begin] = arr[i]
                begin += 1
            }
        }
        return begin
    }
    
    static func palindromeNumber(_ x:Int) -> Bool{
        
        var candidate = 0
        var tmp = x
        while(tmp > 0 ) {
            if( candidate > Int.max/10){
                return false
            }
            candidate = candidate * 10 + tmp%10
            tmp = tmp/10
        }
        
        return (candidate == x)
        
    }
    
    
    static func romanToInteger(roman:String)->Int{
        let len = roman.characters.count
        var result = 0
        for i in (0...len-1).reversed(){
            let c:Character = roman[i]
            switch(c){
                case "I": result += 1 * (result>=5 ? -1 : 1)
                case "V": result += 5
                case "X": result += 10 * (result>=50 ? -1 : 1)
                case "L": result += 50
                case "C": result += 100 * (result>=500 ? -1 : 1)
                case "D": result += 500
                case "M": result += 1000
                default: break
            }
            
        }
        
        return result
        
    }
    
    
    static func duplicatesInArray(nums:inout [Int]){
    
        var resultList:[Int] = []
        for i in 0..<nums.count{
            
            let val = abs(nums[i]) - 1
            
            if(nums[val] > 0){
                nums[val] = -nums[val]
            }else{
                resultList.append(val+1)
            }
        }
        
        print(resultList)
    
    }
    
    
    static func disappearedInArray(nums:inout [Int]){
        
        var resultList:[Int] = []
        
        for i in 0..<nums.count{
            
            let val = abs(nums[i]) - 1
            
            if(nums[val] > 0){
                nums[val] = -nums[val]
            }
        }
        
        for i in 0..<nums.count{
            if(nums[i] > 0){
                resultList.append(i+1)
            }
        }
        
        print(resultList)
        
    }
    
    
    static func splitPoint(nums: inout[Int]) -> Int?{
        var (leftSum,rightSum) = (0,0)
        var splitPoint = -1
        
        for i in 0..<nums.count{
            leftSum += nums[i]
        }
        
        for i in stride(from: nums.count-1, to: 0, by: -1){
            rightSum +=  nums[i]
            leftSum -= nums[i]

            if(rightSum == leftSum){
                splitPoint = i
                return splitPoint
            }
        }
        
       return splitPoint
    }
    
    static func reverseArrayGroups(nums: inout[Int], k:Int,n:Int){
        
        for i in stride(from: 0, to: n, by: k){
            var left:Int = i
            var right:Int = min(i+k-1,n-1)
            
            while(left < right){
                swap(&nums[left],&nums[right])
                left  += 1
                right -= 1
            }
        }
    }
    
    static func minMoves(nums:inout [Int]) -> Int{
    
        var min = nums[0]
        var result = 0
        
        for i in 1..<nums.count{
            if(nums[i] >= min){
                result += (nums[i] - min)
            }else{
                result += (min - nums[i])*i
                min = nums[i]
            }
        }
        
        return result
    }
    
    static func pairSortedArray(arr: inout [Int], k:Int) -> Int{
        var (sum,maxy) = (0,0)
        var map:[Int:Int] = [:]
        
        for i in 0..<arr.count{
            sum += arr[i]

            if(sum == k){
                maxy = max(maxy,i+1)
            }
            
            let diff = sum - k
            
            if(map.keys.contains(diff)){
                maxy = max(maxy, i-map[diff]!)
            }
            
            if(!map.keys.contains(sum)){
                map[sum] = i
            }
        }
        
        return maxy
    }
    
    static func rotateArray(arr:inout [Int], d:Int){
        for i in 0..<d {
         leftRotate(arr: &arr, n: arr.count)
        }
    }
    
    static func leftRotate(arr:inout [Int],n:Int){
        var temp = arr[0]
        var k = 0
        for j in 0..<n-1{
            arr[j] = arr[j+1]
            k = j
        }
        arr[k] = temp
    }
    
    
    static func maxSumInArray(arr: inout[Int]) -> Int{
        var (newSum,maxy) = (arr[0],arr[0])
    
        for i in 1..<arr.count{
            newSum = max(newSum+arr[i], arr[i])
            maxy = max(maxy,newSum)
        }
    
     return maxy
    }
    
    static func peakElement(arr:inout [Int]) ->Int{
        var start  = 0
        var end = arr.count - 1
        while (start <= end){
            let mid = (start+end)/2
            
            if( arr[mid] >= arr[mid-1] &&  arr[mid] >= arr[mid+1]){
                return arr[mid]
            }
            
            if(arr[mid] < arr[mid-1]){
                end = mid - 1
            }else{
                start = mid + 1
            }
        }
        return -1
    }
    
}

var digits = [9,9,9]
PlusOne.plusOne(&digits)
var arr = [0,2,2,3]
PlusOne.removeCommonElementReturnArrayLenght(arr: &arr, ele: 2)

PlusOne.palindromeNumber(252)
PlusOne.romanToInteger(roman: "CX")

var arr1 = [4,3,2,7,8,2,3,1]
PlusOne.duplicatesInArray(nums: &arr1)

var arr2 = [4,3,2,7,8,2,3,1]
PlusOne.disappearedInArray(nums: &arr2)

var arr3 = [1,2,3,4,5,5]
var point = PlusOne.splitPoint(nums: &arr3)

for i in 0..<arr3.count{
    if ( point == i){
        print("")
    }
        print(arr3[i],terminator:" ")
}

var arr4 = [1,2,3,4,5,6,7,8,9]
PlusOne.reverseArrayGroups(nums: &arr4, k: 3, n: arr4.count)

var arr5 = [2,0,1]
PlusOne.minMoves(nums: &arr5)

print()
print("Max sub array is",terminator:"\n")
var arr6 = [1,-1,5,-2,3]
print(PlusOne.pairSortedArray(arr: &arr6, k: 4))


var arr7 = [1,2,3,4,5,6,7]
PlusOne.rotateArray(arr: &arr7, d: 3)

var arr8 = [-2,-1,-3,4,-1,2,1,-5,4]
PlusOne.maxSumInArray(arr: &arr8)

var arr9 = [1,2,3,1]
PlusOne.peakElement(arr: &arr9)






