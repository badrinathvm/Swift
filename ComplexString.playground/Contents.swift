//: Playground - noun: a place where people can play

import UIKit



private extension String{
    subscript(index : Int) -> Character{
        return self[self.characters.index(self.startIndex, offsetBy: index)]
    }
}

var x:String = "ABCDGH"
var y:String = "AEDFHR"

var m:Int = x.characters.count
var n:Int = y.characters.count

//creating a two dimensio array

func lcs(m:Int, n:Int) -> Int{
    
var dp = Array(repeating: Array(repeatElement(0, count: n + 1)), count: m + 1)

for i in 0...m {
    for j in 0...n{
        if i == 0 || j == 0 {
            dp[i][j] = 0
        }
        else if( x[i - 1]  == y[j - 1] ){
            dp[i][j] = dp[i-1][j-1] + 1
        }else{
            dp[i][j] = max(dp[i-1][j] , dp[i][j-1])
        }
     }
    }
    return dp[m][n]
}

print(lcs(m: m, n: n))


//var ans:Int = 0
//
//for k in 1...m{
//    ans = max(ans,dp[k][n])
//}



