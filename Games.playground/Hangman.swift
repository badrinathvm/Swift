// This is a sandbox to experiment with CoderPad's execution capabilities.
// It's a temporary, throw-away session only visible to you.

import Foundation

func hangman() {
  
  var languages = ["JAVA", "SWIFT", "PYTHON"]
  let randomItem = Int.random(in: 0...languages.count-1)
  
  //let answer = languages[randomItem].compactMap { $0 }
  let answer = languages[0].compactMap { $0 }
  print(answer)
  
  var display = answer

  //Set _ for display array for the number of elements in the array.
  for i in 0..<display.count {
    display[i] = "_"
  }


  //initiliaze a counter to see if thw ord os being gueesed.
  var counter = 0 
  
  //guess Array for user input.
  var guessArray = ["J","A","V", "A"]

  // keep asking thew user until the count of answer
  while counter < answer.count {
    
    let char = Int.random(in : 0..<guessArray.count-1)
    //get the guess element.
    let guess = Character(guessArray[char].uppercased())

    //iterate over the array , adn check if guess macthes with answer array , if yes replace the same index of display
     for i in 0..<answer.count {
       if answer[i] == guess {
         display[i] = guess
         counter += 1
         print("Control here \(display)")
       }
     }
  }

}
