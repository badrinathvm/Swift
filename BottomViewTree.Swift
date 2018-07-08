// This is a sandbox to experiment with CoderPad's execution capabilities.
// It's a temporary, throw-away session only visible to you.

import Foundation


class BinaryTree {
  
   var root:Node? = nil
  
  
  func verticalView(root: Node?) {
    
    if root == nil {
      return
    }
    
    var hd:Int = 0
    var map:[Int:[Int]] = [:]
    
    //this is used for storing nodes in tree order traversal
    var queue:[Node] = []
    
    root?.hd = hd
    queue.append(root!)
    
    //Loop until the queue is empty
     while !queue.isEmpty {
       
       let temp = queue.removeFirst()
       
      //Extract the horizontal distance value from the dequeued tree node.
       hd = temp.hd
       
       map[hd, default:[]] += [ temp.value ] as! [Int]
       
       if temp.left != nil {
         temp.left?.hd = hd - 1
         queue.append(temp.left!)
       }
       
       if temp.right != nil {
         temp.right?.hd = hd + 1
         queue.append(temp.right!)
       } 
     }
    
    map.forEach {
      print($0.1,terminator: "\n")
    }
    
  }
  
  
  
  
  
  
   func bottomView(root: Node?) {
     
     if root == nil {
       return
     }
     
     var hd:Int = 0
     
     var map:[Int:Int] = [:]
     
     //this is used for storing nodes in tree order traversal
     var queue:[Node] = []
     
     root?.hd = hd
     queue.append(root!)
     
     //Loop until the queue is empty
     while !queue.isEmpty {
       
       let temp = queue.removeFirst()
       
       //Extract the horizontal distance value from the dequeued tree node.
       hd = temp.hd
       
        // Put the dequeued tree node to TreeMap having key
        // as horizontal distance. Every time we find a node
        // having same horizontal distance we need to replace
        // the data in the map.
       map[hd] = temp.value
       
       if temp.left != nil {
         temp.left?.hd = hd - 1
         queue.append(temp.left!)
       }
       
       if temp.right != nil {
         temp.right?.hd = hd + 1
         queue.append(temp.right!)
       }
     }
     
     print(Array(map.values))
     
     
   }
  
}

class Node {
  
  var left:Node?
  var right:Node?
  var hd:Int = Int.max
  var value:Int?
  
  init(left:Node? = nil, right:Node? = nil, value:Int) {
    self.left = left
    self.right = right
    self.value = value
  }
  
}

var tree = BinaryTree()
// tree.root = Node(value:4)
// tree.root?.left = Node(value:5)
// tree.root?.right = Node(value:2)
// tree.root?.right?.left = Node(value:3)
// tree.root?.right?.right = Node(value:1)
// tree.root?.right?.left?.left = Node(value:6)
// tree.root?.right?.left?.right = Node(value:7)
// tree.root?.right?.right?.right = Node(value:8)
// tree.root?.right?.right?.right?.left = Node(value:9)


// tree.root = Node(value:20)
// tree.root?.left = Node(value:8)
// tree.root?.right = Node(value:22)
// tree.root?.left?.left = Node(value:5)
// tree.root?.left?.right = Node(value:3)
// tree.root?.right?.left = Node(value:4)
// tree.root?.right?.right = Node(value:25)
// tree.root?.left?.right?.left = Node(value:10)
// tree.root?.left?.right?.right = Node(value:14)


tree.root = Node(value:1)
tree.root?.left = Node(value:2)
tree.root?.right = Node(value:3)
tree.root?.left?.left = Node(value:4)
tree.root?.left?.right = Node(value:5)
tree.root?.right?.left = Node(value:6)
tree.root?.right?.right = Node(value:7)
tree.root?.right?.left?.right = Node(value:8)
tree.root?.right?.right?.right = Node(value:9)

tree.bottomView(root: tree.root)
tree.verticalView(root: tree.root)


//o/p:
//5 10 4 14 25
//[4]
//[2]
//[7]
//[1, 5, 6]
//[3, 8]
//[9]
