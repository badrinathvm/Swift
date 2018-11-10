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

