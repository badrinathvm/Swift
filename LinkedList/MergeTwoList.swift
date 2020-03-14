
//Complexity : O(m+n)
// Space : O(1) - as no new nodes are created - just manipulating the links etc..


import Foundation

class LinkedList {
  
  class Node {
    var data: Int
    var link: Node?
    
    init(data: Int = 0) {
      self.data = data
      self.link = nil
    }
  }
  
  func display(node: Node?) -> String {
    var text = String()
    var _node = node
    
    while _node != nil {
        text += "\(String(describing: _node!.data))"
      _node = _node?.link
      
      if node != nil {
        text += "\t"
      }
    }
    return String(text)
  }
  
  
  func rev(node: Node?) -> Node? {
    var prev:Node?
    var cur = node
    var temp = cur?.link
    
    while temp != nil {
      cur?.link = prev
      prev = cur
      cur = temp!
      temp = cur?.link
    }
    
    cur?.link = prev
    
    return cur
  }
  
  
  func mergeTwoListsandSorted(_ node1: Node? , _ node2: Node?) -> Node? {
    var l1 = node1
    var l2 = node2
    //create a dummy node and point the cur to it.
    let dummy:Node = Node()
    var cur = dummy
    
    while l1 != nil && l2 != nil  {
     // if list1 data is less than list2 data , point cur to list1 and increment the list1 to it's next link
     if l1!.data < l2!.data {
        cur.link = l1
        cur = l1!
        l1 = l1?.link
      } else {
        cur.link = l2
        cur = l2!
        l2 = l2?.link
      }
    }
    
    // if list2 becomes empty then all the list 1 is sorted make sure to point the curr to l1
    if l2 == nil {
        cur.link = l1
    } else {
        cur.link = l2
    }
    
    return dummy.link
  }
}

var linkedList = LinkedList()

// Merge two lists sorted

var l1 = LinkedList.Node(data: 1)
l1.link = LinkedList.Node(data: 3)
l1.link?.link = LinkedList.Node(data: 5)
l1.link?.link?.link = LinkedList.Node(data: 10)
l1.link?.link?.link?.link = LinkedList.Node(data:15)

print("L1 =>  \(linkedList.display(node: l1))")

var l2 = LinkedList.Node(data:-1)
l2.link = LinkedList.Node(data: 2)
l2.link?.link = LinkedList.Node(data: 3)
l2.link?.link?.link = LinkedList.Node(data: 4)

print("L2 => \(linkedList.display(node: l2))")

let result = linkedList.mergeTwoListsandSorted(l2,l1)
print(linkedList.display(node: result!))
