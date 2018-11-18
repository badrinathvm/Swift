func longestCommonSubSequence() -> Int {
  
  /* Logic 
  1. construct the two dimensional array with str1 as column and str2 as row
  2. iterate from 1...end of the string , compare str1[i] == str2[i]
      1. if matches , increment from it's previous row, column + 1 ( dp[i-1][j-1] + 1)
      2. else max(dp[previousRow][currentColumn], dp[currenTow, previous Column])
  */
  
  let str1 = "abc".compactMap { String($0) }
  let str2 = "bc".compactMap { String($0) }
  
  var dp = Array(repeating: Array(repeating: 0, count: str2.count + 1) , count: str1.count + 1)
  print(dp)
  
   (1...str1.count).forEach { i in
       (1...str2.count).forEach{ j in
            if i == 0 || j == 0 {
                
            }else if( str1[i-1]  == str2[j-1] ){
                    dp[i][j] = dp[i-1][j-1] + 1
            }else{
                dp[i][j] = max(dp[i-1][j], dp[i][j-1])
            }
        }
     }
  
    return dp[str1.count][str2.count]
}


let result = longestCommonSubSequence()
print(result)


/* Logic */

// 1. Assign LIS array to 1
// 2. Start i from 1 and j till less than i from 0 
// 3. if a[i] > a[j] max (lis[i] , lis[j]) then lis[i] = lis[j] + 1
// 4. Returnt the max from the LIS array.


func longestIncreasingSubSequence() {
  let arr = [10,22,9,33,21,50,41,60]
  
  var lis = Array(repeating: 1 , count:arr.count)
  
  for i in 1..<arr.count {
    for j in 0..<i {
      if arr[i] > arr[j] && lis[i] < lis[j] + 1 {
        lis[i] = lis[j] + 1
      }
    }
  }
  
  print(lis.max()!)
}

longestIncreasingSubSequence()
