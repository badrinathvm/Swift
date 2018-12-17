//Logic: Need to find the index for each character, in order to do that , we need to get the ascii value for each of the character and subtract from 97.
//append the morse code for each of the character to tempStr and add it to Set
//Later get the count of Set.


func uniqueMorseRepresentations(_ words: [String]) -> Int {
  var morseArray = Set<String>()
  
  var morseCode = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]

  words.forEach {
    let element = $0

    //construct ascii code 
    var tempStr = ""
    element.forEach {
      guard let asciiValue = $0.unicodeScalars.first?.value else  { return  }
      let extractIndex = asciiValue - 97
      tempStr += morseCode[Int(extractIndex)]
    }

    morseArray.insert(tempStr)
  }
  
  return morseArray.count
}

  
let words = ["gin", "zen", "gig", "msg"]
  
let result = uniqueMorseRepresentations(words)
print(result)  // 2 

/*
Explanation: 
The transformation of each word is:
"gin" -> "--...-."
"zen" -> "--...-."
"gig" -> "--...--."
"msg" -> "--...--."

There are 2 different transformations, "--...-." and "--...--.".

*/
  
