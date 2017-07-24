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
    
    
    //function to rotate list
    
    static func rotateList(head: inout Node , k: Int) {
        
      
        var cur:Node? = head
        var count:Int = 1
        var res:Node?  = head
        
         //print("Result Node  :" + LinkedList.disp(n: res))
        
        while ( count < k && cur != nil ){
            cur = cur?.link
            count += 1
        }
        
        let kthNode: Node? =  cur
        
        while ( cur != nil ){
            
            cur = cur?.link
        }
            cur?.link = res
          
            head = (kthNode?.link)!
          
            kthNode?.link = nil
        
        print("Resulty Node  :" + LinkedList.disp(n: head))

    }
    
    
    // 
    
    static func skipMNodes(head: Node?, m:Int, n:Int) -> Node?{
        var cur:Node? = head!
        var t:Node?
        
        while( cur != nil ){
         
            for i in 1..<m {
                cur = cur?.link
            }
    
            t = cur?.link
            
            for i in 1..<n{
                t = t?.link
            }
        
            cur?.link = t?.link
            
            cur = t?.link
        }
          return head
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


print("Program to Rotate a linked List ")

var rotateList = LinkedList.Node(data: 10)
rotateList.link = LinkedList.Node(data: 20)
rotateList.link?.link = LinkedList.Node(data: 30)
rotateList.link?.link?.link = LinkedList.Node(data: 40)
rotateList.link?.link?.link?.link = LinkedList.Node(data: 50)
rotateList.link?.link?.link?.link?.link = LinkedList.Node(data: 60)

print("Input : " + LinkedList.disp(n: rotateList))

LinkedList.rotateList(head: &rotateList, k: 4)

//print("Output : " + LinkedList.disp(n: rotateResult))

print("Programm to skip n nodes after m nodes")

var skipList = LinkedList.Node(data: 1)
skipList.link = LinkedList.Node(data: 2)
skipList.link?.link = LinkedList.Node(data: 3)
skipList.link?.link?.link = LinkedList.Node(data: 4)
skipList.link?.link?.link?.link = LinkedList.Node(data: 5)
skipList.link?.link?.link?.link?.link = LinkedList.Node(data: 6)
skipList.link?.link?.link?.link?.link?.link = LinkedList.Node(data: 7)
skipList.link?.link?.link?.link?.link?.link?.link = LinkedList.Node(data: 8)
skipList.link?.link?.link?.link?.link?.link?.link?.link = LinkedList.Node(data: 9)

skipList.link?.link?.link?.link?.link?.link?.link?.link?.link = LinkedList.Node(data: 10)

print("Input : " + LinkedList.disp(n: skipList))

var skipResuktList = LinkedList.skipMNodes(head: skipList, m: 3, n: 2)

print("Output :" + LinkedList.disp(n: skipResuktList))













