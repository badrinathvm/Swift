import Foundation 

class Node{
  var value:Int
  var left:Node?
  var right:Node?
  
  init(value: Int, left: Node? = nil, right:Node? = nil){
    self.value = value
    self.left = left
    self.right = right
  }
  
}

class Tree {
  var root: Node?
  
  var arr = [String]()
  
  func leafNodes(node: Node?, value: Int) -> Bool {
    
    if node == nil {
      return false
    }
    
    if node?.left == nil && node?.right == nil {
      guard let val1 = node?.value  else { return  false }
      //print("\(value)\(val1)")
      if value == (root?.value)! {
        arr.append("\(value)\(val1)")
      }else{
         arr.append("\((root?.value)!)\(value)\(val1)")
      }
      
      return true
    }else {
      return leafNodes(node: node?.left, value: (node?.value)!) && leafNodes(node: node?.right, value: (node?.value)!)
    }
  }
  
  func sumToLeaf(node: Node?) -> Int {
    if node == nil {
      return 0
    }
    
    guard let value = node?.value else { return 0 }
    
    let _ = leafNodes(node: node?.left, value: value)
    
    let _ = leafNodes(node: node?.right, value: value)
  
    
    //convert string array to Int array 
    let intArray = self.arr.map { Int($0)! }
    
    let res = intArray.reduce(0, + )
 
    return res
  }
}

var tree = Tree()
tree.root = Node(value: 4)
tree.root?.left = Node(value: 9)
tree.root?.right = Node(value: 0)
tree.root?.left?.left = Node(value: 5)
tree.root?.left?.right = Node(value: 1)
                      

let res = tree.sumToLeaf(node: tree.root)
print(res)

//Output  [495, 491, 40 ]

