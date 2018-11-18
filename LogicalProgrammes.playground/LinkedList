// Common use case of having a Linked List 

//tinder style swipe image to see the next one..until it reaches the end or nil


class Node {
  var value: Int 
  var next: Node?
  
  init(value: Int , next: Node?) {
    self.value = value
    self.next = next
  }
}


class LinkedList {
  var head: Node?
  
  func insert(value: Int) {
     if head == nil {
       head = Node(value: value, next: nil)
       return
     }
    
     var current = head 
     while current?.next != nil {
       current = current?.next
     }
    
     current?.next = Node(value: value, next: nil)
  }
  
  func delete(value: Int) {
    if head?.value == value {
      head = head?.next
    }
    
    var prev: Node?
    var current = head
    
    while current != nil && current?.value != value {
            prev = current
      current  = current?.next 
    }
    
    prev?.next = current?.next
  }
  
  
  func insertAt(value: Int) {
    if head == nil  && head?.value ?? Int.min >= value{
      head = Node(value: value , next : nil)
      return
    }
    
    var current = head 
    while current?.next != nil && current?.next?.value ?? Int.min < value {
      current = current?.next 
    }
    
    current?.next = Node(value: value, next : current?.next)
  }
  
  func display() {
    var current = head
    
    while current != nil {
      print(current?.value ?? "nil")
      current = current?.next
    }
  }
  
  func setupDummyNodes() {
    let three = Node(value: 3, next : nil)
    let two = Node(value: 2 , next : three )
    head = Node(value: 1, next : two)
    
  }
}

var list = LinkedList()
list.insert(value: 1)
list.insert(value: 2)
list.insert(value: 4)
list.insert(value: 5)

//list.delete(value: 3)
list.insertAt(value: 3)
list.display()


