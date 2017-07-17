//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



import Foundation


class Easy_021_Merge_Two_Sorted_Lists {
    
    class Node {
        var value: Int
        var next: Node?
        init (value: Int = 0, next: Node? = nil) {
            self.value = value
            self.next = next
        }
    }
    
    class func mergeTwoLists(l1 list1: Node?, l2 list2: Node?) -> Node? {
        var l1 = list1
        var l2 = list2
        let dummy: Node = Node()
        var tail: Node? = dummy
        while l1 != nil && l2 != nil {
            print(l1)
            if l1!.value < l2!.value {
                tail?.next = l1
                l1 = l1?.next
            } else {
                tail?.next = l2
                l2 = l2?.next
            }
            tail = tail?.next
        }
        tail?.next = l1 != nil ? l1 : l2
        return dummy.next
    }
    
    class func disp(n: Node?) -> String{
        var text = String()
        var node = n
        
        while node != nil{
            text += "\(node!.value)"
            node = node?.next
            
            if node != nil {
                text += "--->"
            }
        }
        return text
    }
}

var n = Easy_021_Merge_Two_Sorted_Lists.Node(value: 10, next: nil)
n.next = Easy_021_Merge_Two_Sorted_Lists.Node(value: 20)
n.next?.next = Easy_021_Merge_Two_Sorted_Lists.Node(value: 30)
n.next?.next?.next = Easy_021_Merge_Two_Sorted_Lists.Node(value: 30)

var n1 = Easy_021_Merge_Two_Sorted_Lists.Node(value: 40, next: nil)
n1.next = Easy_021_Merge_Two_Sorted_Lists.Node(value: 50)
n1.next?.next = Easy_021_Merge_Two_Sorted_Lists.Node(value: 60)

var result = Easy_021_Merge_Two_Sorted_Lists.mergeTwoLists(l1: n, l2: n1)

print(Easy_021_Merge_Two_Sorted_Lists.disp(n: result))





