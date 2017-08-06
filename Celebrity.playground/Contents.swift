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

var  MATRIX:[[Int]]  = [
    [ 0, 0, 1, 0 ,0],
    [ 0, 0, 1, 0 ,0],
    [ 0, 0, 0, 0 ,0],
    [ 0, 0, 1, 0 ,0],
    [ 0, 0, 1, 0 ,0],
]

var stack = Stack<Int>()

func knows(a:Int, b:Int) ->Bool {
    
    let res:Bool = (MATRIX[a][b] == 1) ? true : false
    return res
}

func celebrity(n: Int) -> Int{
    
    //push all celebrities in to stack
    
    for i in 0..<n{
        stack.push(i)
    }
    
    while(stack.count > 1){
        
        //pop first two
        
        var a:Int = stack.pop()!
        var b = stack.pop()!
        
        if(knows(a: a, b: b)){
            stack.push(b)
        }else{
            stack.push(a)
        }
    }
    
        var c:Int = stack.pop()!
        
        // Check if the last person is
        // celebrity or not
        for i in 0..<c{
            
            if (i != c && (knows(a:c,b:i) && !knows(a:i,b:c))){
                return -1
            }
        }

        return c
    }


var result = celebrity(n: 4)

result == -1 ? print("No Celebity") : print("celebrity is \(result)")

