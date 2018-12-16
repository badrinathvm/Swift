//Logic : Construct the combinations of all the strings which are greater than minelement of the word Dictionary
//Compare each of the word with element in the dictionary 
//if it macthes - replace those elements with empty string
// if the string count == 0 then return true else false.


func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
  
  var backUpString = s
  let str = s.compactMap { $0 }
  var arr = [String]()

  //Get the count of each element of the word Dictionary
  let countElements = Dictionary(grouping : wordDict , by :{ $0.count } )
  let keyElements = Array(countElements.keys)
  let minElement = keyElements.min()!


  for i in 0..<str.count {
    for j in i+1..<str.count {
      let start = str.index(str.startIndex, offsetBy: i)
      let end = str.index(str.startIndex, offsetBy: j)
      let tempStr = String(str[start...end])
      if tempStr.count >= minElement {
        arr.append(tempStr)
      }
    }
  }

  //check if each of the element in array matches with Dictionary
  arr.forEach {
    let element = $0
     wordDict.forEach {
       if element == $0 {
         //remove those elements from the main string 
         backUpString = backUpString.replacingOccurrences(of: element , with: "" )           
       }
     }
  }
  
    
    return backUpString.count == 0 ? true: false
}




let str = "leetcode"
let wordDict = ["leet", "code"]

let result = wordBreak(str, wordDict)
print(result)  //true 

let str1  = "catsanddog"
let wordDict1 = ["cats", "dog", "sand", "and", "cat"]
let result1 = wordBreak(str1, wordDict1)  // false 
