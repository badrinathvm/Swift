// This is a sandbox to experiment with CoderPad's execution capabilities.
// It's a temporary, throw-away session only visible to you.


////// BINARY SEARCH TREE 

import Foundation

//Logic : 
// 1.  indirect - Tells the compiler to insert the necessary layer of redirection especially for recursive calls.


enum BinaryTree<Element: Comparable> {
  case empty
  indirect case node(Element, left:BinaryTree<Element>, right:BinaryTree<Element>)
}

extension BinaryTree {
  func inserting(_ newElement: Element) -> BinaryTree<Element> {
    switch self {
      case .empty:
            return .node(newElement, left: .empty, right: .empty)
      case let .node(element, left, right):
           if newElement > element {
              return .node(element, left: left, right: right.inserting(newElement))
           }else {
             return .node(element, left: left.inserting(newElement), right: right)
           }
     }
  }
  
  func contains(_ element : Element)  -> Bool{
    switch self {
      case .empty: return false
      case let .node(root, left, right):
        if root == element {
          return true
        }else if element > root {
          return right.contains(element)
        }else{
          return left.contains(element)
        }
    }
  }
}

extension BinaryTree: CustomStringConvertible {
  var description: String {
    switch self {
      case .empty:
         return "()"
      case let .node(element, .empty, .empty):
         return "(\(element))"
      case let .node(element, left , right):
         return "(\(left) \(element) \(right))"
    }
  }
}

var tree = BinaryTree<Int>.empty
var t = tree.inserting(3).inserting(5).inserting(2)
print(t)

print(t.contains(3))
print(t.contains(10))


