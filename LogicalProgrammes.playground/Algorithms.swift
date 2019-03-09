/* Algorithms is 

  1. Make use of two stacks 
  2. During enqueue push all the elements on to the stack1.
  3. during Dequeue operation,
        1.make sure to check stack 2 
        2.if stack1 becomes empty return 
        3.As long as stack1 count becomes zero, keep elements of the stack1 and put in stack 2
  4. and return the stack2.pop()
*/


class Stack<T> {
  
  var arr:[T] = []
  
  func push(_ element: T) {
    arr.append(element)
  }
  
  func disp() {
    print(arr)
  }
  
  func pop() -> T {
    return arr.removeLast()
  }
  
}



class Queue<T> {
  var stack1 = Stack<T>()
  var stack2 = Stack<T>()
  
  func enque(_ element: T) {
    stack1.push(element)
  }
  
  func dequeue() -> Int{
    if stack2.arr.count == 0 {
      if stack1.arr.count == 0  { return 0}
      while stack1.arr.count > 0 {
         let p = stack1.pop()
         stack2.push(p)
      }
    }
    
    return stack2.pop() as! Int
  }
  
}

var queue = Queue<Int>()
queue.enque(1)
queue.enque(2)
queue.enque(3)
print(queue.dequeue())
print(queue.dequeue())
print(queue.dequeue())



func flatArray(array: [Any]) -> [Int] {
  var result = [Int]()
  array.enumerated().forEach {
    
    // if it's single element
    if let element = $0.element as? Int {
      result.append(element)
    }
    
    // if it's any array or arary of arrays , call flat again recursively, iterate elements and add to result array
    if let elements = $0.element as? [Any] {
      let temp = flatArray(array: elements)
      temp.forEach { 
        result.append($0)
      }
    }
  }
  
  return result
}


var arr = [3, 4, [4, [[55]]]] as [Any]
let result = flatArray(array: arr)
print(result)


//-----------------------------------------------------------//

/* 
Logic: 
 1. Take the help of set, i = 0, j =0 , maxLength = 0
 2. if the elements doesnt exists in the set , add and then increment j, calculate maxLength ,(j-i)
 3. if present in the set , remove the 'i' th character, increment i
*/


func longestSubstringWithoutRepeatingCharacters()  -> Int {
  var str = "bbbbb".compactMap { $0 }
  var i = 0
  var j = 0
  var maxLength = 0
  var setType = Set<Character>()
  str.enumerated().forEach {
    if !setType.contains($0.element) {
      setType.insert($0.element)
      j += 1
      maxLength = max(maxLength, j - i)
    }else{
      let chracterToRemove = str[i]
      setType.remove(chracterToRemove)
      i += 1
    }

  }

  return maxLength
}


print(longestSubstringWithoutRepeatingCharacters())


//---------------------------------------------------------------------//

func longestPalindrome() {
  let str = "cbbd"
  var palTupple = [(String,Int)]()
  
  str.enumerated().forEach { i, value in
      for j in i+1..<str.count {
        
        let start = str.index(str.startIndex , offsetBy: i)
        let end = str.index(str.startIndex, offsetBy: j)
        
        let range = (start...end)
        
        //print(str[range])
        
        if str[range] == String(str[range].reversed()) {
          let res = String(str[range])
          palTupple.append((res,res.count))
        }
      }
  }
  
  let res = palTupple.sorted(by: { $0.1 > $1.1 })
  print((res.first?.0)!)
  
}

longestPalindrome()   

//-------------------------------------------------------
//Kadane's Algorithm 

//Logic: 

// Initialize:
//     max_so_far = 0
//     max_ending_here = 0

// Loop for each element of the array
//   (a) max_ending_here = max_ending_here + a[i]
//   (b) if(max_ending_here < 0)
//             max_ending_here = 0
//   (c) if(max_so_far < max_ending_here)
//             max_so_far = max_ending_here
// return max_so_far

func maxSubArraySum() -> Int {
  
  var arr = [-2, -3, 4, -1, -2, 1, 5, -3]
  
  var max_so_far = 0
  var max_ending = 0
  
 for (index, value) in arr.enumerated() {
    
    max_ending += value
                            
    if max_ending < 0 {
      max_ending = 0
    }
                            
    if max_so_far < max_ending {
      max_so_far = max_ending
    }
  }
  
  return max_so_far
}

print("MAx Sub Array ")
print(maxSubArraySum())

//--------------------------------------------

//Logic 
// 1. Travserse the array till u find either x or y and store index and then break
// 2. traveser the remaining, if u encounter either x or y 
        //check if it's not same as x or y  // assume you found X in Step1 and shouldn't find same here
        //then calcuate the minDistance between current index and prev index.


func distanceBetweenTwoNumbers() -> Int {
  let dist = [3, 5, 4, 2, 6, 3, 0, 0, 5, 4, 8, 3] // o/p: 1 
  let (x,y ) = (3,6) 
  var prev = 0
  var minDist = Int.max
  var temp = 0
  
  for i in 0..<dist.count {
    if dist[i] == x || dist[i] == y {
      prev = i
      temp = i
      break
    }
  }
  
  
  while  temp < dist.count   {
    if dist[temp] == x || dist[temp] == y {
      if dist[prev] != dist[temp] {
        minDist = min(minDist , temp - prev)
        prev = temp
      }else{
        prev = temp
      }
    }
    
    temp += 1    
  }
  
  return minDist
}


let minDistance = distanceBetweenTwoNumbers()
print(minDistance)

//------------------------ Palindrome Pairs ----------------

func palindromePairs(_ words: [String]) -> [[Int]] {
  var multi:[[Int]] = []

  for i in 1..<arr.count {
    for j in 0..<i   {    
      let element = "\(arr[j])\(arr[i])"
      if element == String(element.reversed()) {
        let temp = [j, i]
        multi.append(temp)
      }

      let altElement = "\(arr[i])\(arr[j])"
      if altElement == String(altElement.reversed()) {
        let temp = [i , j]
        multi.append(temp)
      }
    }
  }

  return multi
}

var arr = ["abcd","dcba","lls","s","sssll"]
let result = palindromePairs(arr)
print(result)

// ----------------- Making Change problem

func count(_ arr: [Int] , _ m: Int, _ n: Int) -> Int {
   if n == 0 {
     return 1
   }
  
  if n < 0 {
    return 0
  }
  
  if m <= 0 && n >= 1 {
    return 0
  }
  
  return count(arr,m - 1, n) + count(arr, m, n-arr[m - 1])
}


func makeChange() {
  var arr = [2,5,3,6]
  let result = count(arr, arr.count, 10)
  print(result) // 5 ways
}


print("make Chnage")
makeChange()

//------------------  Stair Case probelem

func countWays(_ n: Int, _ m: Int) -> Int {
  if n <= 1 {
    return n
  }
  var res = 0 
  
  //this condition is either 1 step , 2 step or 3 step ( bsacially till m times )
  for i in 1...m {
    if i <= n {
      res += countWays(n-i, m)
    }
  }
  
  return res
}

func stairCase() {
  let n = 4
  let m = 3
  let result = countWays(n + 1, m )
  print(result)
}

stairCase()



