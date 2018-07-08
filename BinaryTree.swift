// This is a sandbox to experiment with CoderPad's execution capabilities.
// It's a temporary, throw-away session only visible to you.

import Foundation


  class Node {
      
     var left:Node?
     var right:Node?
     var value:Int
     
     init(_ left:Node? = nil, _ right:Node? = nil,value:Int) {
       self.left = left
       self.right = right
       self.value = value
     }
    
   }

class BinaryTree {
  
    var root:Node? = nil
    static var max_level:Int = 0
  
  func printLeftTree(node:Node?,level:Int) {
    
    let root = node 
    
    if root == nil {
      return
    }
    
    if BinaryTree.max_level < level {
      print((node?.value)!, terminator:" ")
      BinaryTree.max_level = level
    }
    
    printLeftTree(node:root?.left,level:level + 1)
    printLeftTree(node:root?.right,level:level + 1)
    
  }
  
 func leafNodes(_ node:Node?) -> Int {
    if node == nil {
      return 0
    }
    
    if node?.left == nil && node?.right == nil {
      return 1
    }else{
      return leafNodes(node?.left) + leafNodes(node?.right) 
    }
    
  }
  
}

var tree = BinaryTree()
tree.root = Node(value:12)
tree.root?.left = Node(value:10)
tree.root?.right = Node(value:30)
tree.root?.right?.left = Node(value:25)
tree.root?.right?.right = Node(value:40)

tree.printLeftTree(node:tree.root, level:1)
print()

print(tree.leafNodes(tree.root))



