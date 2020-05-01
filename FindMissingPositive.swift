//var arr = [1,2,3] // o/p: 4
var arr = [7,-2,3,1,4,2,20,-5]

func firstMissingPositive(arr: [Int]) -> Int {
  //record all elememts in the array
  let set: Set = Set(arr.map { $0 })

  //check each of the elements from 1 till arr.count + 1
  for i in 1..<(arr.count + 1) {
    if !set.contains(i) {
      return i
    }
  }
  
  return arr.count + 1
}


let result = firstMissingPositive(arr:arr)
print(result)
