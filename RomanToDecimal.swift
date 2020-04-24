enum Roman: Int,CaseIterable {
  case I = 1
  case V = 5
  case X = 10
  case L = 50
  case C = 100
  case D = 500
  case M = 1000
  case none = -1
}

  func getRomanType(element: Character) -> Roman {
    if element == "M" {
      return Roman.M
    }else  if element == "V"{
      return Roman.V
    } else if element == "X"{
      return Roman.X
    } else if element == "L" {
      return Roman.L
    } else if element == "C" {
      return Roman.C
    } else if element == "D" {
      return Roman.D
    } else if element == "I" {
      return Roman.I
    } else {
      return Roman.none
    }
  }

func value(of char: Character) -> Int {
   let romanType = getRomanType(element: char)
   return romanType.rawValue
}


let str = "MCMIV".compactMap { $0 }
var result = 0
for char in str.enumerated() {
  for var i in 0..<str.count {
    let s1 = value(of: char.element)
    
      if (i+1 < str.count) {
        let s2 = value(of: str[i+1])
        
          //compare the result
          if s1 >= s2 {
            result = result + s1
          } else {
            result = result + s2 - s1
            i = i + 1
          }
      } else {
        result = result + s1
        i = i + 1
      }
  }
}

print(result)
