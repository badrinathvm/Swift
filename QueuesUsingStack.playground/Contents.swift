//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


struct Stack<T>{
    
    fileprivate var array = [T]()
    
    public var isEmpty : Bool{
        return array.isEmpty
    }
    
    public var count :Int {
        return array.count
    }
    
    mutating func push(_ item: T ){
        array.append(item)
    }
    
    mutating func pop() -> T?{
        return array.popLast()
    }
    
    func disp(){
        print(array)
    }
    
    func top() -> T?{
        return array.last
    }
    
}


class QueueUsingStack{
    
    var stack1 = Stack<Int>()
    var stack2 = Stack<Int>()
    
    func add(_ item: Int){
        stack1.push(item)
    }
    
    func remove() -> Int?{
        if(stack2.isEmpty){
            while(!stack1.isEmpty){
                stack2.push(stack2.pop()!)
            }
        }
        return stack2.pop()
    }
    
    func disp(){
        print(stack2.disp())
    }
    
}

//var queueUsingStack = QueueUsingStack()
//queueUsingStack.add(10)
//queueUsingStack.add(20)
//queueUsingStack.disp()


class NestedInteger{
    
    static func constructNestedList(){
        
        var parent:[NSObject] = []
        
        var child:[NSObject] = []
        child.append((1 as NSObject))
        child.append((1 as NSObject))
        
        parent.append(child as NSObject)
        
        print(parent)
        
        
    }
}


NestedInteger.constructNestedList()






