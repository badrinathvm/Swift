import Foundation 


// A number is said to be prime if it is divisble by 1 and itself
func isPrime(_ n: Int) -> Bool {
  return (1...n).filter { n % $0 == 0}.count <= 2
}

print(isPrime(29))
print(isPrime(4))

//It first makes sure the number is greater than one and then creates a range from 2 until the number (not including the number) and checks the number is not divisible by each number in the range
func prime(_ n: Int) -> Bool {
  return n > 1 && !(2..<n).contains { n%$0 == 0 }
}

  ///-----------------------------------------------------------------

func findLengthOfLongestContinuousIncreasingSequence(_ arr: [Int]) -> Int {
  var count = 1
  var result = [Int]()
  //Logic : 
  //1. comparing first ansecond element  if it is less , increment the count
  //2. Else add teh count to an array and reset to 1
  //3. Finally get the maximum from the array.
  
  if arr.count == 0 {
    return 0
  }
  
  if arr.count == 1{
    return 1
  }
  
  for index in 0..<arr.count-1 {
      if arr[index] < arr[index + 1] {  
         count += 1
      }else {
        result.append(count)  //[3]
        count = 1
        print(result)
      }             
  }

  result.append(count)
  
  return result.max()!
}


func divideWithoutUsing() {
  var a = 10
   var b = 3
   var res = 0 
   while a >= b {
     a = a - b
     res += 1
   }
   
  print("Quoitent is \(res)")
  print("Reminder is \(a)")
}

///------------------------------------------------------------- //
func convertStringToInt() -> Int? {
  let string = "13372"  
  
// 1 *1000 + 3 * 100 + 3 * 10 + 7 * 1
// 1 * pow (10,3) + 3 * pow(10,2) + 3 * pow(10,1) + 7 * pow(10, 1)
  var total = 0
  var map = [ "0" as Character: 0,
             "1": 1,
             "2" : 2,
             "3" : 3,
             "4": 4, 
             "5": 5, "6": 6,"7": 7,"8":8,"9":9]
  
  
  for (index, val) in string.enumerated() {
      let exponential = string.count - index - 1 //Gets the exponential Value
      if let value = map[val] {
        let temp = Decimal(value) * Decimal(pow(10.0,Double(exponential)))
        total += NSDecimalNumber(decimal: temp).intValue
      }else {
        return -1
      }
  }
  return total
}

let result = convertStringToInt()
print(result!)

//-------------------- Find Pairs

func findPairs() {
  var arr = [1,2,3,4,5,6,7]
  var target = 8   // (1,7) , (2,6) , (3,5)

  var pairTuple = [(Int,Int)]()

  arr.forEach {
    let element = target - $0
    if arr.contains(element) && element != $0 {
       //check if tuple exists 
       let exists = pairTuple.filter { $0.0 == element }.count == 1
       if !exists {
          pairTuple.append(($0, element))
       }   
    }
  }
  print(pairTuple)
}


// --------------------------  Enum style 

enum Reverse<Element: Comparable> {
  case empty
  case rev(Element)
}

extension Reverse {
   func reverse() -> Int {
     switch self {
       case .empty:
            return 0
       case let .rev(element):
            guard var number = element as? Int else { return 0}
            var rev = 0
            while number != 0 {
              rev = rev*10 + number%10
              number = number/10
            }
          return rev
     }
   }
}

var enumReverse = Reverse<Int>.rev(123)
let result = enumReverse.reverse()
print(result)


//----------------------- Find number of sub sets 

//Reference : https://www.techiedelight.com/subset-sum-problem/
var arr = [2,4,6,10]  //o/p : 2  i.e. { 6,10} {2,4,10}

func countSets(arr:  inout [Int] , total:Int ) -> Int {
   return rec(&arr, total,arr.count - 1)
}

func rec(_ arr: inout [Int] , _ total: Int ,_ i: Int) -> Int {
  
  //return {} subset
  if total == 0 {
     return  1
  }
  
  // if i goes out of bounds return 0
  if total < 0 {
    return 0
  }else if i < 0 {
    return 0
  }

  //this case is if total is less than current element, just navigate back to previous element
  if total < arr[i] {
    return rec(&arr, total , i-1)
  }else {
    //Include the current number along with it's previous numbers
     //for eg : i = 2 , one recursive case is for  6 , 
     // and the other one is for { 2, 4 } not including 6 i.e., total - arr[i]
    return rec(&arr, total - arr[i] , i-1) + 
           rec(&arr, total, i-1)
  }
}

let res = countSets(arr: &arr, total :16)
print(res)

//--------------------------- Find Closets Points ----->

//Find K smallest elements 

//Logic: 
  //1. Put k elements on to the heap (create operation O(k))
  //2. Compare each element after kth element if it is smaller than the ones present in the heap , replace it.

//Find Kth Closet points
 //1. Calculate the difference between the points using pythagoras theoremand add them in dictionary 
// 2. Thene extract the first two points.


func findClosetPoints() {
  let points = [(-2,4), (0,-2),(-1,0),(3,5),(-2,-3),(3,2)]
  
  var tupleArray  = [((Int,Int) , Int)]()

  points.forEach {
    //Applying pythagoras Theorom 
    let result = Double(($0.0 * $0.0) + ($0.1 * $0.1))
    let value = Int(result.squareRoot())
    tupleArray.append(($0, value))
  }

  //sorting and then filtering the top two ones.
  let filteredOnes = tupleArray.sorted { $0.1 < $1.1 } 
  print(filteredOnes.prefix(2))
}


findClosetPoints()


//Logic: 
  //1. construct the sample string at the places where we want to replace the string
 //2. In the below string see for "first", "second" & "third" string.
 //3. Iterate over each element in the array and replace the string.

func findCombinations() {
  
  //{Valery","Jason","Peter} was in {good,bad} mood and he went to the {beach,party,library}.
  
  let arr1 = ["Valery","Jason","Peter"]
  let arr2 = ["good","bad"]
  let arr3 = ["beach", "party", "library"]
  var sampleString = "first was in second mood and he went to the third"

  arr1.forEach {
    let res1 = sampleString.replacingOccurrences(of: "first", with: $0)
     arr2.forEach {
       let res2 = res1.replacingOccurrences(of: "second", with: $0)
         arr3.forEach {
           let res3 = res2.replacingOccurrences(of:"third", with: $0)
           print(res3)
         }
     }
  }
} 

func findPairs() {
  let arr = [2, 3, 4, 6, 9]
  let k = 20
  var finalResult = [(Int,Int)]()
  arr.enumerated().forEach { index, first in 
      let elements = arr.filter { $0 != first }
      elements.forEach {
         let second = $0
         if second * first < k {
           //this eliminates symmetery
           let exists = finalResult.filter { $0.0 == second && $0.1 == first }.count > 0
           if !exists {
             finalResult.append((first,second))
           }
         }
      }
  }
  
  print(finalResult.count)
}

findPairs()  //6 .  Pairs having product less than 20: (2, 3), (2, 4), (2, 6), (2, 9), (3, 4), (3, 6)


//Repeated Sub String 


func repeatedString(s: String ) {
  var s1 = s + s
  let s2 = s1.dropFirst().dropLast()
  print(s2)
  if s2.contains(s) {
    print("true")
  }else {
    print("false")
  }
}


repeatedString(s: "abab")  //ab apperead two times 
