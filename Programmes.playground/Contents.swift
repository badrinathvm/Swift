//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct StringPermutations{
    
    
    static func permutations(n:Int, a: inout Array<Character>) {
        if n == 1 {
            print(String(a));
            return
        }
        
        for i in 0..<n-1 {
            permutations(n:n-1,a:&a)
            swap(&a[n-1], &a[(n%2 == 1) ? 0 : i])
        }
        permutations(n:n-1,a:&a)
    }
    
    
    static func permutationsAlt(l:Int,r:Int, a: inout Array<Character>) {
        if r == 1 {
            print(String(a));
            return
        }
        
        for _ in l...r {
            swap(&a[l],&a[r])
            permutationsAlt(l:l+1,r:r,a:&a)
            swap(&a[l],&a[r])
        }
    }
    
}


var arr = Array("ABC".characters)
StringPermutations.permutations(n:arr.count, a:&arr)
