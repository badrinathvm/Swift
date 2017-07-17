//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



class LinkedList {
    
    class Node {
        var data:Int
        var link: Node?
        
        init(data: Int = 0 ){
            self.data = data
            self.link = nil
        }
    }
    
    func disp(n: Node?) -> String{
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
    
    
    func reverse(list: Node) -> Node?{
        var cur = list
        var prev:Node?
        var temp:Node? = cur.link
        
        while temp != nil {
            cur.link = prev
            prev = cur
            cur = temp!
            temp = cur.link
        }
        
        //for last node
        cur.link = prev
        
        return cur
    }
    
    func deleteMid(list: Node?) -> Node?{
        
        var prev:Node?
        var (fast,slow) = (list, list)
        
        while ( fast != nil &&  fast?.link != nil ){

            if( fast?.link?.link != nil){
                  fast = (fast?.link?.link)!
            }else{
                   fast = nil
            }
            
            prev = slow
            slow = slow?.link!
        }
        
        prev?.link! = (slow?.link)!
        
        return list
        
    }
    
    // Function to remove duplicates 
    
    func removeDuplicatesNode( head : Node?) -> Node?{
        var cur = head
        var prev:Node? = nil
        
        let s = NSMutableSet()
        
        while ( cur != nil ) {
            
            let val:Int = cur!.data
            
            if( s.contains(val)){
                if cur?.link != nil {
                    prev?.link = cur?.link!
                }else{
                    prev?.link = nil
                }
            }else{
                s.add(val)
                prev = cur
            }
            
            cur = cur?.link
        }
        
        return head!
    }
    
    
    func addOneList(list addOne: Node?) -> Node? {
        
        var ( carry , sum ) = (1,0)
        var temp:Node? = nil
        
        var head = addOne
        let res = addOne
        
        while ( head != nil ){
           sum  = carry + (head?.data)!
           carry = (sum >= 10 ) ? 1: 0
            sum = sum % 10
          head?.data = sum
          temp = head
          head = head?.link
        }
        
        return res
    
    }
}

//var node = Node()

var list = LinkedList()


var reverseList = LinkedList.Node(data: 10)
reverseList.link = LinkedList.Node(data: 20)
reverseList.link?.link = LinkedList.Node(data: 30)
reverseList.link?.link?.link = LinkedList.Node(data: 40)

print("List is : " + list.disp(n: reverseList))

print("Reverse list is " +  list.disp(n: list.reverse(list: reverseList)))


var head = LinkedList.Node(data: 10)
head.link = LinkedList.Node(data: 20)
head.link?.link = LinkedList.Node(data: 30)
head.link?.link?.link = LinkedList.Node(data: 40)
head.link?.link?.link?.link = LinkedList.Node(data: 50)
head.link?.link?.link?.link?.link = LinkedList.Node(data: 60)

print("Delete Middle is " +  list.disp(n: list.deleteMid(list: head)))


var removeDuplicates = LinkedList.Node(data: 1)
removeDuplicates.link = LinkedList.Node(data: 2)
removeDuplicates.link?.link = LinkedList.Node(data: 3)
removeDuplicates.link?.link?.link = LinkedList.Node(data: 3)
removeDuplicates.link?.link?.link?.link = LinkedList.Node(data: 4)
removeDuplicates.link?.link?.link?.link?.link = LinkedList.Node(data: 4)


print("Remove Duplicates " + list.disp(n: (list.removeDuplicatesNode(head: removeDuplicates))))


// Add 1 to a number represented as linked list

//Reverse given linked list. For example, 1-> 9-> 9 -> 9 is converted to 9-> 9 -> 9 ->1.
//Start traversing linked list from leftmost node and add 1 to it. If there is a carry, move to the next node. Keep moving to the next node while there is a carry.
//Reverse modified linked list and return head

var addOneLinkedList = LinkedList.Node(data:1)
addOneLinkedList.link = LinkedList.Node(data: 9)
addOneLinkedList.link?.link = LinkedList.Node(data: 9)
addOneLinkedList.link?.link?.link = LinkedList.Node(data: 9)

//reverse the list
var revList = list.reverse(list: addOneLinkedList)
print(list.disp(n: revList))

//add one 
var res = list.addOneList(list: revList)
print(list.disp(n: res))













