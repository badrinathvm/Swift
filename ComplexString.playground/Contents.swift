//: Playground - noun: a place where people can play

import UIKit



private extension String{
    subscript(index : Int) -> Character{
        return self[self.characters.index(self.startIndex, offsetBy: index)]
    }
}

//var x:String = "ABCDGH"
//var y:String = "AEDFHR"

//var x:String = "AGGTAB"
//var y:String = "GXTXAY"



//creating a two dimensio array

func lcs(m:Int, n:Int, x:String ,y:String) -> Int{
    
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

print("Longest Common Substring or Subsequence")
var x = "abcdxyz"
var y = "xyzabcd"

print(lcs(m: x.characters.count, n:y.characters.count, x:x, y:y))
print()


print("Minimum no of characters to make a palindrome")

var str1 = "abcde"
var str2 = String(str1.characters.reversed())
print((str1.characters.count - lcs(m: str1.characters.count, n:str2.characters.count, x:str1, y:str2)))
print()



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

var s = "ABDEFGABEF"
//var s = "GEEKSFORGEEKS"

print(LengthOfLongestSubString.lengthofLongestSubString(str:s))


print("Programme to eliminate adjacent duplicates")

struct EliminateAdjacentDuplicates{
    
    static func eliminateDuplicates(str: inout String, n:Int) ->String{
        
        var result:String = ""
        var (k,len,i) = (0,str.characters.count,0)
        
        var chars = Array(str.characters)
        while(i<len){
            
            //if no match copy previous characarter
            if( chars[i-1] != chars[i]){
               chars[k] = chars[i-1]
                k += 1
            }else{
                //if match happens skip character
                while( chars[i-1] == chars[i]){
                    i += 1
                }
            }
            i += 1
        }
        
        chars[k] = chars[i-1]
        
        if(k != n){
            eliminateDuplicates(str: &str, n: k)
        }else{
            result =  String(chars)
        }
        
        return result
    }
    
}

var s1 = "geeksforgeek"

//print(EliminateAdjacentDuplicates.eliminateDuplicates( str:&s, n:s.characters.count ))








