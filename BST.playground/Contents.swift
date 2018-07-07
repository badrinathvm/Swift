//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class BinarySearchTree {
    
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
    
    var root:Node?
    
    init(){
        root = nil
    }
    
    static func inOrder(node:Node?){
        
        if ( node == nil ){
            return
        }
        
        BinarySearchTree.inOrder(node: node?.left)
        
        print((node?.value)! , terminator: " ")
        
        BinarySearchTree.inOrder(node: node?.right)
        
    }
    
    func insertBST(node: Node?, key:Int) -> Node?{
        
        var root = node
        
        //print(root)
        
        
        if(root == nil){
            root = BinarySearchTree.Node(value: key)
            return root
        }
        
        if (key < (root?.value)! ){
            root?.left = insertBST(node: root?.left,key:key)
        }else if(key > (root?.value)! ){
            root?.right = insertBST(node:root?.right,key:key)
        }
        
        return root
    }
    
    func insert(key:Int) {
        root = insertBST(node:root, key:key)
    }
    
    func inord(){
        BinarySearchTree.inOrder(node: root)
    }
    
    
    //Search related functions
    
    func search(key:Int){
        
        let node = BinarySearchTree.searchBST(node: root, key: key)
        
        if (node != nil){
            print("Present \((node?.value)!)")
        }else{
            print("Not present")
        }
    }

    
    //Search 
    static func searchBST(node: Node?,key:Int) -> Node?{
        let root = node
        
        if (root == nil || (root?.value)! ==  key){
            return root
        }
        
        if ( key < (root?.value)!){
            return searchBST(node:root?.left, key:key)
        } else {
            return searchBST(node:root?.right,key:key)
        }
    }
    
    //End of search Relared functions 
    
    
    func delete(key:Int){
        BinarySearchTree.deleteBST(node: root, key: key)
    }
    
    //Refernce youtube link ( https://www.youtube.com/watch?v=gcULXE7ViZw )
    static func deleteBST(node: Node?, key:Int) -> Node?{
        
        let root = node
        
        if ( root == nil){
            return root
        }
        
        if (key < (root?.value)!){
            root?.left = deleteBST(node: root?.left, key: key)
        }else if (key > (root?.value)!){
            root?.right = deleteBST(node: root?.right, key: key)
        }else {
            
            //node with one or  no child
            if (root?.left == nil){
                return root?.right
            } else if (root?.right == nil){
                return root?.left
            }
            
            //nod with two childern :Get the  inorder successor (smallest in the right sub tree)
            root?.value = BinarySearchTree.minVal(node:root?.right)
            
            root?.right = deleteBST(node: root?.right, key: (root?.value)!)
        }
        
        return root
        
    }

    static func minVal(node:Node?)-> Int{
        var root = node
        var minV = root?.value
        
        while (root?.left != nil){
            minV = (root?.left?.value)!
            root = root?.left
        }
        
        return minV!
    }
    

}

print("Insertion in BST")

var bst = BinarySearchTree()
bst.insert(key:50)
bst.insert(key:30)
bst.insert(key:20)
bst.insert(key:70)
bst.insert(key:60)
bst.insert(key:80)

//Do an inorder traversal

bst.inord()
print()

print()
print("Search a key  in BST")
bst.search(key: 20)
print()

print("Delete a key in BST")
bst.delete(key: 50)
bst.inord()


















