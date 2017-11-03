//: Playground - noun: a place where people can play

import UIKit

class Logical{
    
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
    
    
    func stringCompress() {
        
        var str = "aaabccdd"
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
    
    func plusOne(){
        var arr = [9,9]
        var index = arr.count - 1
        
        while ( index >= 0){
            if( arr[index] < 9){
                arr[index] += 1
                return
            }
            
            arr[index] = 0
            index -= 1
        }
        
        arr.insert(1,at:0)
        
        print(arr)
    }
    
    
    func threeSum(nums: [Int]) -> [[Int]] {
        var nums = nums.sorted(by: <)
        var res = [[Int]]()
        
        if nums.count <= 2 {
            return res
        }
        
        for i in 0...nums.count - 3 {
            if i == 0 || nums[i] != nums[i - 1] {
                let remain = -nums[i]
                var left = i + 1
                var right = nums.count - 1
                while left < right {
                    if nums[left] + nums[right] == remain {
                        var temp = [Int]()
                        temp.append(nums[i])
                        temp.append(nums[left])
                        temp.append(nums[right])
                        
                        res.append(temp)
                        repeat {
                            left += 1
                        } while (left < right && nums[left] == nums[left - 1])
                        repeat {
                            right -= 1
                        } while (left < right && nums[right] == nums[right + 1])
                    } else if nums[left] + nums[right] < remain {
                        repeat {
                            left += 1
                        } while (left < right && nums[left] == nums[left - 1])
                    } else {
                        repeat {
                            right -= 1
                        } while (left < right && nums[right] == nums[right + 1])
                    }
                }
            }
        }
        
        return res
    }
    
    func longestPalindromeSubString(){
        
        var longestPalindrome = "babad" //aba
        
        var palTupple = [(String,Int) ]()
        
        longestPalindrome.enumerated().forEach { (index,element) in
            for j in 1...longestPalindrome.count-index{
                let start = longestPalindrome.index(longestPalindrome.startIndex,offsetBy: index)
                let end = longestPalindrome.index(longestPalindrome.endIndex,offsetBy: -(j-1))
                
                let res = longestPalindrome[start..<end]
                if( res  == String(res.reversed()) && res.count > 1 ){
                    print(res)
                    palTupple.append((String(res),res.count))
                }
            }
        }
        
        palTupple.sorted(by:<).forEach {
            print($0.0) 
        }
    }
}

var logical = Logical()
logical.twoSum()
logical.stringCompress()
logical.plusOne()
print(logical.threeSum(nums: [-1,0,1,2,-1,-4]))
logical.longestPalindromeSubString()
