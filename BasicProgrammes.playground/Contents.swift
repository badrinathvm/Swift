//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// * Programme for checking Palindrome of a number.

struct Palindrome {
    
    func rev(n:Int) -> Bool {
        
        //Tuple declaration of variables
        var (rem, rev ,tmp) = (0,0,n)
        
        while( tmp > 0){
            
            //Race condition to check if it's more than the size of the int
            if tmp > Int.max/10 {
                return false
            }
            
            rem = tmp % 10
            rev = rev * 10 + rem
            tmp = tmp/10
        }
        
        return (rev == n)
    }
    
}

var pal = Palindrome()
pal.rev(n:525)

//* Progarmme for Merging two lists 


/*extension LinkedList: CustomStringConvertible {
 public var description: String {
 var text = ""
 var node = head
 
 while node != nil {
 text += "\(node!.value)"
 node = node!.next
 if node != nil {
 text += "--->"
 }
 }
 return text + ""
 }
 }*/


class Node{
    var value:Int
    var next: Node?
    
    //assign default along with initilization itself
    init(value:Int = 0 , next: Node? = nil) {
        self.value = value
        self.next = next
    }
    
 
}

class LinkedList<T> {
    
    var head:Node?
  
    func push(data:Int){
        //allocate node ad put data
        let node = Node(value:data)
        //point next of it's to head
        node.next = head
        head = node
    }
    
    func mergeLists(list1: Node?,list2: Node?) -> Node?{
        /*var l1:Node? = list1
        let l2:Node? = list2
        let l3:Node? = list1*/
        
        //Tuple 
        
        var (l1,l2,l3) = (list1,list2,list1)
    
        while( l1?.next != nil){
            l1 = l1?.next
        }
        
        l1?.next = l2
        return l3
    }
    
    func reversList(l: Node?) -> Node?{
 
        var prev:Node? = nil
        var cur:Node = l!
        var front:Node? = cur.next
        
        while(front != nil){
            cur.next = prev
            prev = cur
            cur = front!
            front = cur.next
        }
        
        cur.next = prev
        return cur
    }
}

extension Node: CustomStringConvertible {
    
    public var description: String{
        return ""
    }
    
    func disp(n: Node?) -> String{
        var text = ""
        var node = n
        
        while node != nil {
            text += "\(node!.value)"
            node = node?.next
            if node != nil {
                text += "--->"
            }
        }
        return text
    }
}


var list1 = LinkedList<String>()
list1.push(data: 10)
list1.push(data: 20)
list1.push(data: 30)

var node:Node = Node()

print("First List: " + node.disp(n: list1.head),terminator:"\n")

var list2 = LinkedList<String>()
list2.push(data: 40)
list2.push(data: 50)
list2.push(data: 60)

print("Second List: " + node.disp(n: list2.head),terminator:"\n")

var result = LinkedList<Int>().mergeLists(list1: list1.head, list2: list2.head)

print("Result is : " + node.disp(n: result))


// Reversal of list 

var list3 = LinkedList<String>()
list3.push(data: 1)
list3.push(data: 2)
list3.push(data: 3)
list3.push(data: 4)

print("Before Reversal :" + node.disp(n:list3.head))

var revList = LinkedList<Int>().reversList(l: (list3.head))
print("Reversed List is : " + node.disp(n: revList))















