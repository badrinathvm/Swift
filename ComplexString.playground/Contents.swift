//: Playground - noun: a place where people can play

import UIKit



private extension String{
    subscript(index : Int) -> Character{
        return self[self.characters.index(self.startIndex, offsetBy: index)]
    }
}

//var x:String = "ABCDGH"
//var y:String = "AEDFHR"

var x:String = "AGGTAB"
var y:String = "GXTXAY"

var m:Int = x.characters.count
var n:Int = y.characters.count

//creating a two dimensio array

func lcs(m:Int, n:Int) -> Int{
    
var dp = Array(repeating: Array(repeatElement(0, count: n + 1)), count: m + 1)
    for i in 1...m {
        for j in 1...(n){
            if i == 0 || j == 0 {
                return 0
            }else if( x[i - 1]  == y[j - 1] ){
                    dp[i][j] = dp[i-1][j-1] + 1
            }else{
                dp[i][j] = max(dp[i-1][j], dp[i][j-1])
            }
        }
     }
    return dp[m][n]
}

print(lcs(m: m, n: n))


print("Length of the longest sub string is the forming the string wihtout repeatation")

struct LengthOfLongestSubString{
    
    static func uniqueAll(str:String,start:Int,end:Int) -> Bool{
        let ns = NSMutableSet()
        
        for i in start..<end{
         if(ns.contains(String(str[i]))){
                return false
            }else{
                ns.add(String(str[i]))
            }
         }
         return true
    }
    
    static func lengthofLongestSubString(str:String) -> Int{
        var ans:Int = 0
        for i in 0..<str.characters.count{
            for j in i+1...str.characters.count{
                if(LengthOfLongestSubString.uniqueAll(str: str, start: i, end: j)){
                    ans = max(ans,j-i)
                }
            }
        }
        
        return ans
    }
    
}

//var s = "ABDEFGABEF"
var s = "GEEKSFORGEEKS"

print(LengthOfLongestSubString.lengthofLongestSubString(str:s))








