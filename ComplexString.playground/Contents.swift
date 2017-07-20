//: Playground - noun: a place where people can play

import UIKit



private extension String{
    subscript(index : Int) -> Character{
        return self[self.characters.index(self.startIndex, offsetBy: index)]
    }
}

var x:String = "AGGTAB"
var y:String = "GXTXAYB"

var m:Int = x.characters.count
var n:Int = y.characters.count

//creating a two dimensio array
var dp = Array(repeating: Array(repeatElement(0, count: n + 1)), count: m + 1)

//print(dp)

var (i,j,k) = (1,1,1)

for i in 1..<(m+1) {
    for j in 1..<(n+1){
        if( x[i - 1]  == y[j - 1] ){
            dp[i][j] = dp[i-1][j-1] + 1
        }else{
            dp[i][j] = dp[i][j-1]
        }
    }
}

var ans:Int = 0

for k in 1..<(m+1){
    ans = max(ans,dp[k][n])
}

print(ans)


