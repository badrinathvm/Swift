//: Playground - noun: a place where people can play

import UIKit

print("Programme for Happy Number")

struct HappyNumber{
    
    static func happyNumber(n:Int)->Bool?{
        
        var (slow,fast) = (n,n)
        
        repeat{
            
            slow = square(n)
            
            fast = square(square(n))
            
        }while(slow != fast)
        
        return (slow == 1)
        
    }
    
    static func square(_ num:Int) ->Int{
        var k = num
        var squareNum = 0
        
        
        //while should be while(k)
        while (k == 1){
            squareNum += (k%10) * (k%10)
            k = k/10
        }
        
        return squareNum
    }
    
}

print(HappyNumber.happyNumber(n: 19)!)





