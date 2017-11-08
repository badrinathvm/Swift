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
    
    func integerToEnglishWords(){
        let n = "1323".flatMap{ $0 }
        var englishTuple = [(Int,String)]()
        
        //constructing the tuples
        englishTuple.append((1,"one"))
        englishTuple.append((2,"Two"))
        englishTuple.append((3,"Three"))
        englishTuple.append((4,"Four"))
        englishTuple.append((5,"Five"))
        englishTuple.append((6,"Six"))
        englishTuple.append((7,"Seven"))
        englishTuple.append((8,"Eight"))
        englishTuple.append((9,"Nine"))
        englishTuple.append((10,"Ten"))
        englishTuple.append((11,"Elevem"))
        englishTuple.append((12,"Twelve"))
        englishTuple.append((13,"Thirteen"))
        englishTuple.append((14,"Fourteen"))
        englishTuple.append((15,"Fifteen"))
        englishTuple.append((16,"Sixteen"))
        englishTuple.append((17,"Seventeen"))
        englishTuple.append((18,"Eighteen"))
        englishTuple.append((19,"Ninteen"))
        englishTuple.append((20,"Twenty"))
        englishTuple.append((30,"Thirty"))
        englishTuple.append((40,"Forty"))
        englishTuple.append((50,"Fifty"))
        englishTuple.append((60,"Sixty"))
        englishTuple.append((70,"Seventy"))
        englishTuple.append((80,"Eighty"))
        englishTuple.append((90,"Ninty"))
        
        //print(englishTuple)
        
        var resultString = ""
        
        //to multiply each of the array
        var tempArray = [(1,""),(10,""),(100,"Hundred"),(1000,"Thousand")]
        //var expandArray = ["One","Ten","Hundred","thousand"]
        var count = n.count-1
        var convertArray = n.flatMap { Int(String($0)) }
        
        //Getting the multiplied array
        zip(0..<convertArray.count,convertArray[0..<convertArray.count]).forEach { (index,val) in
            convertArray[index] = val * tempArray[count].0
            count -= 1
        }
        
        print(convertArray)
        
        //fetching value from tuples and constructing output.
        (0..<convertArray.count).forEach{
            let temp = convertArray[$0]
            //fetching the index from tuple and acessing it
            if let index = englishTuple.index(where : {$0.0 == temp }){
                resultString += englishTuple[index].1 + " "
            }else{
                // for scenarios involving 100 & 1000's etc..
                var t = String(temp).flatMap { String($0)}
                if let index = englishTuple.index(where : {$0.0 == Int(String(t[0])) }){
                    resultString += englishTuple[index].1 +  " " + tempArray[t.count-1].1 + " "
                }
            }
            
        }
        
        print(resultString)
    }
    
    func dfs(_ islandArray : inout [[Int]] ,_ m :Int, _ n: Int, _ i:Int, _ j:Int ){
        
        guard i>=0 && i<m && j >= 0 && j < n && islandArray[i][j] == 1 else{
            return
        }
        
        islandArray[i][j] = 2
        
        dfs(&islandArray,m,n,i+1,j)
        dfs(&islandArray,m,n,i-1,j)
        dfs(&islandArray,m,n,i,j+1)
        dfs(&islandArray,m,n,i,j-1)
        
    }
    
    
    func numberOfIslands() -> Int{
        var islandArray = [
            [1,1,1,1,0],
            [1,1,0,1,0],
            [1,1,0,0,0],
            [0,0,0,0,0]
        ]
        
        //print(islandArray)
        
        let m = islandArray.count
        let n = islandArray[0].count
        var clusterCount = 0
        print(m)
        print(n)
        
        guard m>0 && n > 0 else{
            return 0
        }
        
        (0..<m).enumerated().forEach { i in
            zip(0..<n, islandArray[i.offset][0..<n]).forEach{ (j,val) in
                //on finding one make sure to check each of it's neighbours by using dfs method and increment the count .
                if( islandArray[i.offset][j] == 1){
                    clusterCount += 1
                    dfs(&islandArray,m,n,i.offset,j)
                }
            }
        }
        
        return clusterCount
    }
    
    func wdfs(_ wordArray: inout [[String]], _ wordContent: [Character], _ m:Int, _ n :Int , _ i :Int, _ j :Int, _ visited: inout [[Bool]], _ index:Int ) -> Bool{
        
        if index == wordContent.count {
            return true
        }
        
        guard i >= 0 && i < m && j >= 0 && j < n else{
            return false
        }
        
        guard !visited[i][j] && Character(wordArray[i][j]) == wordContent[index] else {
            return false
        }
        
        visited[i][j] = true
        
        if( wdfs(&wordArray,wordContent,m,n,i+1,j, &visited,index+1) ||
            wdfs(&wordArray,wordContent,m,n,i-1,j, &visited,index+1) ||
            wdfs(&wordArray,wordContent,m,n,i,j+1, &visited,index+1) ||
            wdfs(&wordArray,wordContent,m,n,i,j-1, &visited,index+1)){
            return true
            
        }
        
        return false
    }
    
    
    func wordSearch(){
        
        var wordArray = [
            ["A","B","C","E"],
            ["S","F","C","S"],
            ["A","D","E","E"]
        ]
        
        var word = "ABCCED"
        var foundStatus = false
        
        //instead of flatMap
        var wordContent = [Character](word.characters)
        
        let m = wordArray.count
        let n = wordArray[0].count
        
        var visited = Array(repeating: Array(repeating:false, count:n), count:m)
        
        print(visited)
        
        //Note cannot use return inside forEach - have to make use of for
        zip(0..<m, wordArray[0..<m]).forEach{ (i,value) in
            zip(0..<n,wordArray[i][0..<n]).forEach{ (j,val2) in
                if( (Character(wordArray[i][j]) == wordContent[0])
                    &&  wdfs(&wordArray,wordContent,m,n,i,j, &visited,0)){
                    foundStatus = true
                }
            }
        }
        
        if( foundStatus){
            print("Found")
        }else{
            print("Not Found")
        }
    }
    
    func longestCommonSubString(){
        
        var (s1,s2) = ("LCLC".flatMap{$0},"CLCL".flatMap{$0})  //LCS = "CLC"
        let (m,n) = (s1.count, s2.count)
        var dp = Array(repeating: Array(repeating:0, count:n) , count : m)
        var max = Int.min
        print(dp)
        var resList:[String] = []
        
        //Logic is similar to longest common sub sequence diagonal calculation.
        
        //on enumeration we will be having offset.
        (0..<m).enumerated().forEach{ i in
            (0..<n).enumerated().forEach{ j in
                if(String(s1[i.offset]) == String(s2[j.offset])){
                    
                    if ( i.offset == 0 || j.offset == 0){
                        dp[i.offset][j.offset] = 1
                    }else{
                        dp[i.offset][j.offset] = 1 + dp[i.offset-1][j.offset-1]
                    }
                    
                    if( dp[i.offset][j.offset] > max){
                        
                        max = dp[i.offset][j.offset]
                        let start = s1.index(s1.startIndex,offsetBy: (i.offset-max + 1))
                        let end = s1.index(s1.endIndex, offsetBy: -(s1.count-(i.offset+1)))
                        
                        //print(s1[start..<end])
                        resList = [String]()
                        resList.append(String(s1[start..<end]))
                        
                    }else if ( dp[i.offset][j.offset] == max){
                        print(max)
                        
                        let st = s1.index(s1.startIndex,offsetBy: (i.offset - max + 1))
                        let en = s1.index(s1.startIndex, offsetBy: (i.offset+1))
                        
                        print(s1[st..<en])
                        resList.append(String(s1[st..<en]))
                        
                    }
                }else{
                    dp[i.offset][j.offset] = 0
                }
            }
        }
        
        print(resList)
    }
    
    func tappingRainWater(){
        
        var heights = [0,1,0,2,1,0,1,3,2,1,2,1]
        
        var leftTower = Array(repeating: 0, count:heights.count)
        var rightTower = Array(repeating:0, count:heights.count)
        
        var (leftMax,rightMax) = (0,0)
        
        zip(0..<heights.count,heights[0..<heights.count]).forEach{ (i,val) in
            leftTower[i] = max(leftMax,heights[i])
            leftMax = leftTower[i]
        }
        
        
        zip(0..<heights.count,heights[0..<heights.count]).reversed().forEach{ (i,val) in
            rightTower[i] = max(rightMax,heights[i])
            rightMax = rightTower[i]
        }
        
        
        var res = 0
        zip(0..<heights.count,heights[0..<heights.count]).forEach { (i,val) in
            res += min(rightTower[i],leftTower[i]) - heights[i]
        }
        
        print(res)
    }
    
    func longConsecutive(){
        var con = [100,4,200,1,2,3]
        
        var setArray = Set(con)
        
        print(setArray)
        var maxResult = 1
        
        zip(0..<con.count ,con[0..<con.count]).forEach{ (index,value) in
            var (left,right,count) = (value - 1,value + 1,1)
            while(setArray.contains(left)){
                count += 1
                setArray.remove(left)
                left -= 1
            }
            while(setArray.contains(right)){
                count += 1
                setArray.remove(right)
                right += 1
            }
            maxResult = max(maxResult,count)
        }
        
        print(maxResult)
    }
    
    func detectRectangleMaxArea(){
        var test = [ [0,1,1,0,0,0] ,
                     [0,0,1,1,1,1] ,
                     [1,1,1,1,1,1],
                     [1,0,0,1,0,1]
        ]
        
        var n = test[0].count
        var left = [Int](repeating:0,count:n)
        var right = [Int](repeating:n,count:n)
        var height = [Int](repeating:0, count:n)
        var maxArea = 0
        
        test.enumerated().forEach { (i,val1) in
            var (curr_left,curr_right) = (0,n)
            
            test.enumerated().forEach { (j,val2) in
                height[j] = ( test[i][j] == 1 ) ? height[j] + 1 : 0
            }
            
            test.enumerated().forEach { (j,val2) in
                if test[i][j] == 1 {
                    left[j] = max(left[j], curr_left)
                } else {
                    left[j] = 0
                    curr_left = j + 1
                }
            }
            
            test.enumerated().reversed().forEach{ (j , val2) in
                if test[i][j] == 1 {
                    right[j] = min(right[j], curr_right)
                } else {
                    right[j] = n
                    curr_right = j
                }
            }
            
            test.enumerated().forEach { (j,val2) in
                maxArea = max(maxArea, (right[j] - left[j]) * height[j])
            }
            
        }
        
        print(maxArea)
    }

    func deleteConsecutive(){
      let seq = "tom jerry jerry tom tom".split(separator: " ")

      let result = seq.reduce(([String])()) { str,val -> [String] in

           //Logic here if stack is empty add it & pop the last one and compare with the 'val' if not same add it both back to stack.
      //Finally get the count of stack.

                   var _str = str
                   if( _str.isEmpty){
                     _str.append(String(val))
                    }else{
                     let temp = _str.removeLast()
                     if( !(temp == val) ){
                        _str.append(temp)
                       _str.append(String(val))
                     }
                   }

                  return _str
      }

      print(result)
      print(result.count)
}

func printMaximumOfMinimum(){
  
  //Logic here is to filter the proper ranges. If range contains array count filter it.
  
  var arr = [10, 20, 30, 50, 10, 70, 30]  //[70, 30, 20, 10, 10, 10, 10]
  var resultArray = [Int]()

  (0..<arr.count).forEach{ k in
    var tempArray = [Int]()
    arr.enumerated().forEach{ (index,val) in
                             
        let range = index...(index+k)
                             
        if(!range.contains(arr.count)){
          tempArray.append(arr[range].sorted(by:<).first!)
        }
                             
    }
    //print(tempArray)
    resultArray.append(tempArray.sorted(by:>).first!)
  }

  print(resultArray)
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
logical.integerToEnglishWords()
print(logical.numberOfIslands())
logical.wordSearch()
logical.longestCommonSubString()
logical.tappingRainWater()
logical.longConsecutive()
logical.detectRectangleMaxArea()
logical.delteConsecutive()
logical.printMaximumOfMinimum()







