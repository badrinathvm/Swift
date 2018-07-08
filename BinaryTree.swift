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
  
  func height(node:Node?) -> Int {
    
    if node == nil {
      return 0
    }
    
    let lheight = height(node: node?.left)
    let rheight = height(node: node?.right)
 
    if lheight > rheight {
      return lheight + 1
    }else {
      return rheight + 1
    }
  }
  
  
  func diameter(node:Node?) -> Int {
    if node == nil {
      return 0
    }
    
    let lheight = height(node:node?.left)
    let rheight = height(node:node?.right)
    
    let ldiameter = diameter(node: node?.left)
    let rdiameter = diameter(node: node?.right)
    
    let fd = max( (lheight + rheight + 1) , max(ldiameter,rdiameter) )
    
    return fd
  }
  
  
  func identicalTrees(a:Node?, b:Node?) -> Bool {
    if a == nil && b == nil {
      return true
    }
    
    if a != nil && b != nil {
      let status = ( a?.value == b?.value
      && identicalTrees(a: a?.left , b: b?.left)
      && identicalTrees(a: a?.right , b: b?.right) )
      return status 
    }
    
    return false
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
  
  
  //Tree structure 
  
  //  4
  // /  \
  // 5   2
  //     / \
  //     3  1
  //    / \  \
  //    6 7  8
  //        /
  //       9
  
}

var tree = BinaryTree()
tree.root = Node(value:4)
tree.root?.left = Node(value:5)
tree.root?.right = Node(value:2)
tree.root?.right?.left = Node(value:3)
tree.root?.right?.right = Node(value:1)
tree.root?.right?.left?.left = Node(value:6)
tree.root?.right?.left?.right = Node(value:7)
tree.root?.right?.right?.right = Node(value:8)
tree.root?.right?.right?.right?.left = Node(value:9)
tree.printLeftTree(node:tree.root, level:1)
print()

print(tree.height(node:tree.root))
print()

print(tree.leafNodes(tree.root))
print("Diameter of the tree is")

print(tree.diameter(node:tree.root))


var tree1 = BinaryTree()
tree1.root = Node(value:4)
tree1.root?.left = Node(value:5)
tree1.root?.right = Node(value:2)
tree1.root?.right?.left = Node(value:3)
tree1.root?.right?.right = Node(value:1)
tree1.root?.right?.left?.left = Node(value:6)
tree1.root?.right?.left?.right = Node(value:7)
tree1.root?.right?.right?.right = Node(value:8)
tree1.root?.right?.right?.right?.left = Node(value:9)
tree1.printLeftTree(node:tree.root, level:1)

print(tree.identicalTrees(a:tree.root, b:tree1.root))
