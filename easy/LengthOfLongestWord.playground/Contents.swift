//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

extension String{
    subscript(index:Int)->Character{
        return self[self.characters.index(self.startIndex,offsetBy:index)]
    }
}

struct LenghtofLongestWord {
    
    static func lengthoflastword(s:String) ->Int{
        var (i,len) = (0,0)
        while(i<s.characters.count){
            if(s[i] != " "){
                len += 1
            }else if(i+1 < s.characters.count && s[i+1] != " "){
                len = 0
            }
            i+=1
        }
        
        return len
    }
    
}

print(LenghtofLongestWord.lengthoflastword(s:"abc defghig"))
