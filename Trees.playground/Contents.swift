//: Playground - noun: a place where people can play

import UIKit


/*
 
 #101 Symmetric Tree
 
 Level: easy
 
 Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
 
 For example, this binary tree is symmetric:
 
     1
    / \
   2   2
  / \ / \
 3  4 4  3
 
 But the following is not:
 
     1
    / \
    2   2
    \   \
    3    3

 */


import Foundation

class Tree {
    
    class Node{
        var left:Node?
        var right: Node?
        var value:Int
        
        init(value:Int, left:Node? = nil, right:Node? = nil){
            self.value = value
            self.left = left
            self.right = right
        }
    }
    
    static func disp(n: Node?) -> String{
        var text = String()
        var node = n
        
        while node != nil{
            text += "\(node!.value)"
            node = node?.left
            node = node?.right
            
            if node != nil {
                text += "--->"
            }
        }
        
        return text
    }
    
    static func preOrder(node:Node?){
        
        if ( node == nil ){
            return
        }
    
        print((node?.value)! , terminator: " ")
        
        Tree.preOrder(node: node?.left)
        
        Tree.preOrder(node: node?.right)
        
    }
    
    static func postOrder(node:Node?){
        
        if ( node == nil ){
            return
        }
        
        Tree.postOrder(node: node?.left)
        
        Tree.postOrder(node: node?.right)
        
        print((node?.value)! , terminator: " ")
        
    }
    
    static func inOrder(node:Node?){
        
        if ( node == nil ){
            return
        }
        
        Tree.inOrder(node: node?.left)
        
        print((node?.value)! , terminator: " ")
        
        Tree.inOrder(node: node?.right)
        
    }
}

var root = Tree.Node(value: 1)
root.left = Tree.Node(value: 2)
root.right = Tree.Node(value: 3)
root.left?.left = Tree.Node(value: 4)
root.left?.right = Tree.Node(value: 5)

print("Pre Order Traversalof node is ")
Tree.preOrder(node: root)
print()

print("Post Order Traversalof node is ")
Tree.postOrder(node: root)
print()

print("In Order Traversalof node is ")
Tree.postOrder(node: root)





/* var n1 = Tree.Node(value: 1)
var n2 = Tree.Node(value: 2)
var n3 = Tree.Node(value: 3)
var n4 = Tree.Node(value: 4)
var n5 = Tree.Node(value: 5)
var n6 = Tree.Node(value: 6)
var n7 = Tree.Node(value: 7)

n1.left = n2
n1.right = n3

n2.left = n4
n2.right = n5

n3.left = n6
n3.right = n7 */





