
func checkAlphabet(_ character: Character) -> Bool {
   guard let asciiValue = character.unicodeScalars.first?.value else { return false }
   let status = asciiValue >= 65 && asciiValue <= 122 ? true : false
   return status
}

func reverseSkipSpecialCharacters() {
  let str = "a,b$c"  
  var arr = str.compactMap { $0 }
  print(arr)
  var l = 0 
  var r = arr.count - 1
  while l < r {
    if !checkAlphabet(arr[l]) {
      l += 1
    }else if !checkAlphabet(arr[r]) {
      r -= 1
    }else {
      arr.swapAt(l,r)
      l += 1
      r -= 1
    }
  }

  print("Original String \(str)")   // a,b$c
  let resultString = arr.reduce("", {String($0) + String($1) }) //c,b$a
  print(resultString)
}


reverseSkipSpecialCharacters()
