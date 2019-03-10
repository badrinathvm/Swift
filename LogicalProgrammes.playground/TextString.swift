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
