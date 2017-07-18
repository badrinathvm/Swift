//: Playground - noun: a place where people can play

import UIKit

class LinkedList {
    
    class Node {
        var data:Int
        var link: Node?
        
        init(data: Int = 0 ){
            self.data = data
            self.link = nil
        }
    }
    
    static func disp(n: Node?) -> String{
        var text = String()
        var node = n
        
        while node != nil{
            text += "\(node!.data)"
            node = node?.link
            
            if node != nil {
                text += "--->"
            }
        }
        
        return text
    }
    
    
    static func reverseKNodes(head: Node?, n:Int) -> Node?{
        
        var prev:Node? = nil
        var next:Node? = nil
        var cur: Node? = head!
        var count: Int = 0

        // Reverse K Nodes  1->2 -> 3  will become 3->2->1
        while ( cur != nil && count < n){
            next = cur?.link
            cur?.link = prev
            prev = cur
            cur = next
            count += 1
        }
        
        //since prev would have got reversed head will be at the sam eposition i.e., 1
        //print(LinkedList.disp(n: head))
        
        //point head to current
        if( head != nil){
            head?.link = cur
        }
        
        //print(LinkedList.disp(n: head))
        
        //We do not want to reverse next k nodes. So move the current pointer to skip next k nodes
        count = 0
        while ( count < n - 1 && cur != nil ){
            cur = cur?.link
            count += 1
        }
        
        // Recursively call 
        
        if ( cur != nil){
            cur?.link = LinkedList.reverseKNodes(head: cur?.link ,n:n)
        }
        
        //print(prev!)
        
        return prev
        
    }
    
}

print("Program to reverse k Nodes ")

var reverseKNodes = LinkedList.Node(data: 1)
reverseKNodes.link = LinkedList.Node(data: 2)
reverseKNodes.link?.link = LinkedList.Node(data: 3)
reverseKNodes.link?.link?.link = LinkedList.Node(data: 4)
reverseKNodes.link?.link?.link?.link = LinkedList.Node(data: 5)
reverseKNodes.link?.link?.link?.link?.link = LinkedList.Node(data: 6)
reverseKNodes.link?.link?.link?.link?.link?.link = LinkedList.Node(data: 7)


print("Input : "  +  LinkedList.disp(n: reverseKNodes))
var result = LinkedList.reverseKNodes(head: reverseKNodes, n: 3)
print("Output: " + LinkedList.disp(n: result))


