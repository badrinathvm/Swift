import Foundation 

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
