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
    
    
    static func nthNodeList( head: Node? , n: Int){
        
        var temp:Node? = head!
        var len : Int = 0
        
        while ( temp != nil ){
            temp = temp?.link
            len += 1
        }
        
        if (len < n) {
            return
        }
        
        temp = head
        
        print(LinkedList.disp(n: temp))
        
        for _ in 1..<(len-n+1){
            temp = temp?.link
        }
        
        print ("Data is \((temp?.data)!)")
    }
    
    static func occurenceLast(head: Node? , key: Int) -> Node?{
        
        var temp: Node? = head!
        var x:Node? = nil
        
        
        while( temp != nil){
            
            if( temp?.data ==  key){
                x = temp
            }

            temp = temp?.link
        }
        
        print(LinkedList.disp(n: x))
        
        if ( x != nil ){
            //copy data o fnext node to x
            x?.data = (x?.link?.data)!
            
            //unlink next
            x?.link = nil
            
        }

        return head!
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


//Program to find the nth node from the end of the linked list

print("\nProgram to find the nth node from the end of the linked list",terminator: "\n")

var nthNode = LinkedList.Node(data: 10)
nthNode.link = LinkedList.Node(data: 35)
nthNode.link?.link = LinkedList.Node(data: 20)
nthNode.link?.link?.link = LinkedList.Node(data: 40)
nthNode.link?.link?.link?.link = LinkedList.Node(data: 50)
print("Input : " + LinkedList.disp(n: nthNode ))
LinkedList.nthNodeList(head: nthNode , n: 4)

print("Program to delete last occurence of key")

var occurenceList = LinkedList.Node(data: 10)
occurenceList.link = LinkedList.Node(data: 20)
occurenceList.link?.link = LinkedList.Node(data: 50)
occurenceList.link?.link?.link = LinkedList.Node(data: 20)
occurenceList.link?.link?.link?.link = LinkedList.Node(data: 40)


print("Input : " + LinkedList.disp(n: occurenceList))

var occuList = LinkedList.occurenceLast(head: occurenceList, key: 20)

print( "Output : " + LinkedList.disp(n: occuList))




