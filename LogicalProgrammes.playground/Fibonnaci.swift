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
