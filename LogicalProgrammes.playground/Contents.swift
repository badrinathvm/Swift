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
        
        let longestPalindrome = "babad" //aba
        
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
    
    
    func bestTimeToBuySellStock() -> Int{
        
        var prices = [7, 1, 5, 3, 6, 4]
        
        guard prices.count >= 2 else {
            return 0
        }
        
        var minPrice = prices[0]
        var maxProfit = 0
        
        for price in prices {
            minPrice = min(minPrice,price)
            maxProfit = max( maxProfit , price - minPrice)
        }
        
        return maxProfit
        
    }
    
    func checkIso() -> String {
        
        let s1 = "eggaa1".flatMap { $0 }
        let s2 = "addb1".flatMap { $0 }
        
        var status = ""
        let empty = ""
        
        print(s1)
        print(s2)
        
        guard  (s1.count == s2.count) else {
            return "Not valid Inputs"
        }
        
        var countDict = [String:String]()
        
        for (index,element) in s1.enumerated(){
            
            if let ind = countDict.index(forKey: String(element)){
                
                status = countDict[ind].value == String(s2[index]) ? "Iso" : "Non ISo"
                return status
            }
            
            
            countDict[String(element), default:empty] = String(s2[index])
            
        }
        
        fatalError("Just other way of Return")
    }
    
    func uniquePath(){
        
        let (m,n) = (3,7)
        
        //initilaze to Zero
        var dp = Array(repeating: Array(repeating:0, count:n),count:m)
        
        //set first columns to 1
        zip(0..<m,dp[0..<m]).forEach{ (index,value) in
            dp[index][0] = 1
        }
        
        //set first rows to 1
        (0..<n).forEach{
            dp[0][$0] = 1
        }
        
        //current position can be calculated by  ( x, y) = (x-1,y) + (x,y-1)
        (1..<m).forEach{ i in
            (1..<n).forEach{ j in
                dp[i][j] = dp[i-1][j] + dp[i][j-1]
            }                 
        }
        
        print(dp[m-1][n-1])
    }
    
    
    func phone(_ s:String) -> [String] {
        
        let phoneKeyMap: [Character: [String]] = [
            "2": ["a","b","c"],
            "3": ["d","e","f"],
            "4": ["g","h","i"],
            "5": ["j","k","l"],
            "6": ["m","n","o"],
            "7": ["p","q","r","s"],
            "8": ["t","u","v"],
            "9": ["w","x","y","z"]
        ]
        
        guard let n = s.characters.first else { return [] } // 1
        
        guard let px = phoneKeyMap[n] else { return [] } // ['a,b,c]
        
        print(px)
        
        if s.characters.count == 1 {
            print("Data is \(px)")
            return px
        }
        
        let sx = phone(String(s.characters.dropFirst()))
        
        print(sx)
        
        let res = px.flatMap { p in sx.flatMap { s in p+s } }
        //print(res)
        
        return px.flatMap { p in sx.flatMap { s in p+s } }
        
        //return px.flatMap { _ in sx.flatMap { $1 + $0 } }
        
    }
    
    func longestCommonSubSequence() {
        let str1 = "ABCDAF".flatMap { $0 }
        let str2 = "ACBCF".flatMap { $0 }
        
        let m = str1.count
        let n = str2.count
        
        var dp = Array(repeating: Array(repeating:0, count:n+1) , count: m+1)
        
        print(dp)
        
        //set first element of each row to 0
        zip(0...m, dp[0...m]).forEach{ (index,val) in  dp[index][0] = 0}
        
        //set first columns to 0
        (0...n).forEach { dp[0][$0] = 0}
        
        //print(dp)
        
        zip(1...m, dp[1...m]).forEach { (i,row) in
            zip(1...n, dp[1...n]).forEach{ (j, col) in
                // if( i == 0 || j == 0 ){
                //     dp[i][j] = 0
                // }else
                if(str1[i-1] == str2[j-1]){
                    dp[i][j] = 1 + dp[i-1][j-1]
                } else{
                    dp[i][j] = max(dp[i-1][j] , dp[i][j-1])
                }
                
            }                          
        }
        
        print(dp)
        
        
        print(dp[m][n])
    }
    

    func longestIncreasingSubSequence(){
        var lcs = [10, 9, 2, 5, 3, 7, 101, 18]
        
        //to test guard condition
        //var lcs = [Int]()
        var dp = Array(repeating:1, count: lcs.count )
        var maxLength = 0
        
        guard lcs.count != 0  else{
            print(0)
            return
        }
        
        zip(0..<lcs.count, lcs[0..<lcs.count]).forEach{ (i,value) in
            zip(0..<i, lcs[0..<i]).forEach { (j,val2) in
                if(lcs[i] > lcs [j]){
                    dp[i] = max(dp[i], dp[j]+1)
                }
            }
            maxLength = max(maxLength, dp[i])
        }
        
        print(maxLength)
    }
    
    
    func combinations(){
        
        // output :  [1,2] [1,3] ,[1,4] [2,3] [2,4] [3,4]
        let n = 4
        let k = 2
        
        var resTupleList = [(Int,Int)]()
        
        (1..<n).enumerated().forEach{ (i,val) in
            //print(val)
            (k...n).enumerated().forEach{ (j,val2) in
                //print(val2)
                let tempTuple = (val,val2)
                //if(val != val2){
                resTupleList.append(tempTuple)
                //}
            }
        }
        
        //print(resTupleList)
        
        let dupTuples = resTupleList.filter { $0.0 == $0.1 }
        
        //removing duplicates
        dupTuples.forEach{ val in
            resTupleList = resTupleList.filter{ !( $0.0 == val.0 && $0.1 ==    val.1) }
        }
        
        var symmetryTuple = resTupleList.filter { val in
            resTupleList.filter { (val.0 == $0.1 && val.1 == $0.0) }.count > 0
        }
        
        let tupleToBeRemoved = symmetryTuple.removeLast()
        
        //removing last symmetry one
        let finalResultTuple = resTupleList.filter {
            !($0.0 == tupleToBeRemoved.0 && $0.1 == tupleToBeRemoved.1) }
        
        print(finalResultTuple)
        
        //Alternate way to remove symmetry
        // let index = resTupleList.index(where: { $0.0 == tupleToBeRemoved.0 && $0.1 == tupleToBeRemoved.1 } )
        
        // resTupleList.remove(at: index!)
        
        // print(resTupleList)
    }
}

var logical = Logical()
logical.twoSum()
logical.stringCompress()
logical.plusOne()
print(logical.threeSum(nums: [-1,0,1,2,-1,-4]))
logical.longestPalindromeSubString()
print(logical.bestTimeToBuySellStock())
print(logical.checkIso())
logical.uniquePath()
print(logical.phone("23"))
logical.longestCommonSubSequence()
logical.longestIncreasingSubSequence()
logical.combinations()







