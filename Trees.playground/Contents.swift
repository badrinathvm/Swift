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
    
    static func height(node:Node?) -> Int{
        
        if node == nil {
            return 0
        }else{
            //Compute height of each sub tree
            
            let lheight: Int = height(node: node?.left)
            let rheight:Int = height(node: node?.right)
            
            if ( lheight > rheight){
                return lheight + 1
            }else{
                return rheight + 1
            }
        }
    }
    
    static func levelOrder(node: Node?) {
        let h:Int = Tree.height(node: node!)
        for i in 1...h{
            printLevel(node: node, level: i )
        }
    }
    
    static func printLevel(node: Node?, level:Int){
        if (node == nil){
            return
        }
        
        if (level == 1){
            print((node?.value)!, terminator: " ")
        }else if( level > 1){
            printLevel(node: node?.left, level: level - 1)
            printLevel(node: node?.right, level: level - 1)
        }
    }
    
    static func isBST(_ root: Node?, _ l:Node? = nil, _ r:Node? = nil) -> Bool{
        
        if root == nil{
            return true
        }
        
        // if left node exist that check it has
        // correct data or not
        if (l != nil && (root?.value)! < (l?.value)!){
            return false
        }

        // if right node exist that check it has
        // correct data or not
        if (r != nil && (root?.value)! > (r?.value)!){
            return false
        }

        // check recursively for every node.
        return isBST(root?.left, l, root) && isBST(root?.right, root, r)
        
    }
    
    static func isSymmetric(node1: Node? , node2:Node?) -> Bool?{
        
        if ( node1 == nil && node2 == nil){
            return true
        }
        
        // For two trees to be mirror images, the following three
        // conditions must be true
        // 1 - Their root node's key must be same
        // 2 - left subtree of left tree and right subtree
        //      of right tree have to be mirror images
        // 3 - right subtree of left tree and left subtree
        //      of right tree have to be mirror images
        
        if( node1 != nil && node2 != nil && node1?.value == node2?.value){
            return isSymmetric(node1: node1?.left, node2: node2?.right)! &&
            isSymmetric(node1: node1?.right, node2: node2?.left)!
        }
        
        return false
    }
    
    
    static func isIDentical(node1: Node?, node2:Node?) -> Bool?{
        
        if ( node1 == nil && node2 == nil){
            return true
        }
        
        if( node1 != nil && node2 != nil){
            return ( node1?.value == node2?.value)
                 && (isIDentical(node1: node1?.left, node2: node2?.left))!
                 && (isIDentical(node1: node1?.right, node2: node2?.right))!
        }
        
        return false
    }
    
    static func leafNodes(node: Node?) -> Int?{
        
        if node == nil {
            return 0
        }
        
        if(node?.left == nil && node?.right == nil){
            return 1
        }else{
            return leafNodes(node: node?.left)! + leafNodes(node: node?.right)!
        }
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
print()

print("Level Order Traversal " , terminator:"\n")
Tree.levelOrder(node: root)
print()

var bstRoot = Tree.Node(value: 4)
bstRoot.left = Tree.Node(value: 2)
bstRoot.right = Tree.Node(value: 5)
bstRoot.left?.left = Tree.Node(value: 1)
bstRoot.left?.right = Tree.Node(value: 3)

print("Binary search tree",terminator:"\n")
print(Tree.isBST(bstRoot))
print()


print("Symmetric Tree", terminator:"\n")
var symTree = Tree.Node(value: 1)
symTree.left = Tree.Node(value: 2)
symTree.right = Tree.Node(value: 2)
symTree.left?.left = Tree.Node(value: 3)
symTree.left?.right = Tree.Node(value: 4)
symTree.right?.left = Tree.Node(value: 4)
symTree.right?.right = Tree.Node(value: 3)
print(Tree.isSymmetric(node1: symTree, node2: symTree)!)
print()


print("Identical Trees", terminator:"\n")
var root1 = Tree.Node(value: 1)
root1.left = Tree.Node(value: 2)
root1.right = Tree.Node(value: 3)
root1.left?.left = Tree.Node(value: 4)
root1.left?.right = Tree.Node(value: 5)

var root2 = Tree.Node(value: 1)
root2.left = Tree.Node(value: 2)
root2.right = Tree.Node(value: 3)
root2.left?.left = Tree.Node(value: 4)
root2.left?.right = Tree.Node(value: 7)

print(Tree.isIDentical(node1: root1,node2: root2)!)
print()

print("Leaf Nodes")
print(Tree.leafNodes(node: root)!)













