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
