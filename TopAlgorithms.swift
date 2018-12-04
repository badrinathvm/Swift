
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


//---------------------------------------------------------------- //

func printPalindromePartitions() {
  
    let str = "nitin"
    var finalResult = [String]()
  
    str.enumerated().forEach { i, val1 in 
      for j in i+1..<str.count {
        let start = str.index(str.startIndex, offsetBy: i)
        let end = str.index(str.startIndex, offsetBy: j)

        let subStr = String(str[start...end])

        if subStr == String(subStr.reversed()) {
           if subStr.count != str.count {
              var tempArr = str.compactMap { $0 }
              //encodedOffset gives the index value of the String.Index
              tempArr.insert(" ", at: start.encodedOffset)
              // Why end + 2 , +1 is since we inserted new character , and one more + 1 is to insert at the end.
              tempArr.insert(" ", at: end.encodedOffset + 2)
              let modifiedString = tempArr.reduce("" , { String($0) + String($1) })
              finalResult.append(modifiedString)
           }else{
             finalResult.append(subStr)
           }
        }
      }
   }

   print(finalResult)
}


printPalindromePartitions()  //["nitin", "n iti n"]
