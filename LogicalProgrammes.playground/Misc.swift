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
