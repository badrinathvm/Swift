// coin change problem
func coinChange(_ n: Int) -> Int {
  let coins = [1,5,10]
   
  var ways = Array(repeating : 0 , count: n + 1)
  
  ways[0] = 1
    
  for (i, coin) in coins.enumerated() {
    for j in 0..<ways.count {
      if coin <= j {
        ways[j] += ways[j - coin] 
      }
    }
  }
  return ways.last!
}


let result16 = coinChange(10)
print(result16)

/*Input : N=10
        Coins : 1, 5, 10
Output : 4
Explanation: 1 way: 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 = 10 cents.
             2 way: 1 + 1 + 1 + 1 + 1 + 5 = 10 cents.
             3 way: 5 + 5 = 10 cents.
             4 way: 10 cents = 10 cents. */
