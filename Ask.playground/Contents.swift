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
            
            print(cur)
            
            cur = cur?.link
        }
        
        return head!
    }
    
}


var list = LinkedList()

var removeDuplicates = LinkedList.Node(data: 1)
removeDuplicates.link = LinkedList.Node(data: 2)
removeDuplicates.link?.link = LinkedList.Node(data: 3)
removeDuplicates.link?.link?.link = LinkedList.Node(data: 3)
removeDuplicates.link?.link?.link?.link = LinkedList.Node(data: 4)
removeDuplicates.link?.link?.link?.link?.link = LinkedList.Node(data: 4)

print("Remove Duplicates " + list.disp(n: (list.removeDuplicatesNode(head: removeDuplicates))))




