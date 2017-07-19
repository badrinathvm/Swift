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
    
    static var max_level:Int = 0
    
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
    
    static func printLeft(node: Node?,level:Int, max_level: inout Int){
        
        if (node == nil){
            return
        }
        
        if( max_level < level){
            print((node?.value)! , terminator: " ")
            max_level = level
        }
        
        Tree.printLeft(node: node?.left, level: level + 1, max_level: &max_level)
        Tree.printLeft(node: node?.right, level: level + 1, max_level: &max_level)
        
    }
    
    static func printRight(node: Node?,level:Int, max_level: inout Int){
        
        if (node == nil){
            return
        }
        
        if( max_level < level){
            print((node?.value)! , terminator: " ")
            max_level = level
        }
        
        Tree.printRight(node: node?.right, level: level + 1, max_level: &max_level )
        Tree.printRight(node: node?.left, level: level + 1, max_level: &max_level )
        
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
Tree.inOrder(node: root)
print()

print("Left Nodes are ", terminator:"\n")
Tree.printLeft(node: root, level: 1, max_level: &Tree.max_level)
print()

Tree.max_level = 0

print("Right Nodes are ", terminator: "\n")
Tree.printRight(node: root, level: 1, max_level: &Tree.max_level)







