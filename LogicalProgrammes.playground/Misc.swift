func fibonnaciSubSequence() -> Int {
  let arr = [1,2,3,4,5,6,7,8] 

  var maxLength = Int.min
  let set = Set(arr)

  for i in 0..<arr.count {
    for j in i+1..<arr.count {

      var x = arr[i]
      var y = arr[i] + arr[j]
      var length = 2

      while set.contains(y) {
        let z = x + y
        x = y
        y = z
        length += 1
        maxLength = max(maxLength , length)
      }
    }
  }

  return maxLength >= 3 ? maxLength : 0
}

//------------------------  Grouping Strings  -------------------------- //

func groupString() {
  
  let words = [ "may", "student", "students", "dog",
                 "studentssess", "god", "cat", "act",
                 "tab", "bat", "flow", "wolf", "lambs",
                 "amy", "yam", "balms", "looped", 
                 "poodle"]
  
  var mainDict = [String: [String]]()

  words.forEach {
    
    let word = Array($0.sorted())

    //create a dictionary of each word and then extract only the keys and then join to form a right key
    let result = word.reduce(into : [:]) { dict, value in 
      dict[String(value), default: 0 ] += 1
    }

    let key = Array(result.keys).reduce("" , { String($0) + String($1) })
    print(key)

    mainDict[key , default: []] += [$0]                                     
  }

  print(mainDict.values)
}


groupString() 


//o/p:  [["lambs", "balms"], ["looped", "poodle"], ["cat", "act"], ["may", "amy", "yam"], ["flow", "wolf"], ["tab", "bat"], ["student", "students", "studentssess"], ["dog", "god"]]


//---- find common Elements 

//Create a hashArray for 26 Alphabets
//iterate through each word , get the ascii value , and update the array with right index
//Extract the offset with > wordsArray.count 
//iterate that array convert each of the index in to char

func findCommonElements() {
  
  let words = ["geeksforgeeks","gemkstones","acknowledges","aguelikes"]
  var hashArray = Array(repeating: 0 , count: 26)
  
  words.forEach {
    let elements = $0.compactMap { $0 }
    elements.forEach {
      guard let asciiValue = $0.unicodeScalars.first?.value else { return }
      let index = Int(asciiValue - 97)
      hashArray[index] += 1
    }
  }
  
  let result = hashArray.enumerated().reduce([],{
    return $1.element > words.count ? $0 + [$1.offset] : $0
  })
  
  result.forEach {
    guard let unicode = UnicodeScalar( $0 + 97) else { return }
    let char = Character(unicode)
    print(char)
  }
  
}


findCommonElements()  // e, g, k, s

//--------- substring-with-concatenation-of-all-words

func findSubstring(_ s: String, _ words: [String]) -> [Int] {
  let variation1 = words.reduce("" , {String($0) + String($1)})
  let variation2 = words.reduce("" , {String($1) + String($0)})
  var tuplesArray = [(Int,Int)]()

  for index in 0..<str.count - 1 { 
    let startIndex = str.index(str.startIndex , offsetBy: index)
    //calculate the end Index , if it goes negative then it's out of end Index. 
    let value = str.count - ( variation1.count - 1 + index)
    if value > 0 {
      let endIndex = str.index(str.endIndex, offsetBy:  -value)   
      let range = startIndex...endIndex
      let tempString = String(str[range])
      if tempString == variation1 ||  tempString == variation2 {
        tuplesArray.append((startIndex.encodedOffset, endIndex.encodedOffset))
      }
    }
  }

  print(tuplesArray)

  var output = [Int]()
  tuplesArray.forEach {
    output.append($0.0)
  }

  return output
}
                            
var str = "barfoothefoobarman"
var words = ["foo", "bar"]
let result = findSubstring(str,words)
print(result)  

/*Input:
  s = "barfoothefoobarman",
  words = ["foo","bar"]
Output: [0,9]
Explanation: Substrings starting at index 0 and 9 are "barfoor" and "foobar" respectively.
The output order does not matter, returning [9,0] is fine too. */


