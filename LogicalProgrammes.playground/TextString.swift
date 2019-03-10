func textPatternSearch() {
  
 var text = "AABAACAADAABAAABAA".compactMap { String($0) }
 var pattern = "AABA".compactMap { String($0) }
  
  let m = pattern.count
  let n = text.count
  for i in  0..<n - m + 1 {
    for j in 0..<m {
      //check pattern match for current index
      if text[i+j] != pattern[j] {
        break
      }
      
      // if it has reached the end of the pattern string , then log the start Index.
      if  j == m - 1 {
       print("Found at \(i)")
      }
    }
  }
}

textPatternSearch()


// Array cyclic 

//Logic : For every two increment of p increment q and check p == q if yes "cyclic" else "NO"
// Make sure to check for bounday cases.

func cyclic(arr: [Int]) -> Bool {
  var p = 0
  var q = 0
  
  while (true) {
     
    guard p >= 0 && q >= 0 && p <= arr.count && q <= arr.count else { return false }
  
    // increment p  ( once )
    p = arr[p]
    
    print("Value of p first is \(p)")
  
    if p == q { 
      print("Present") 
      return true 
    }
  
   guard p > 0 && p <= arr.count else { return false }
  
   //increment p (twice)
   p = arr[p]
    print("Value of p twice is \(p)")
  
   if p == q { return true }
  
   // Now check Q 
   q = arr[q]
    print("Value of q is \(q)")
  
   if p == q { return true }
  }
}

let status = cyclic(arr : [1,2,4,3,4,8])
print(status)
