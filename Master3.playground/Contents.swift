//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// Eliminate Dupliactes 

var arr = [1.0, 4, 2.0, 2.0, 6, 24, 15, 2, 60, 15, 6]

var arr1 = [1, 4 ,6, 24, 15 ]

extension Array where Element : Hashable{
    
    var orderedSet : Array {
        var set = Set<Element>()
        
        return filter{ set.insert($0).inserted}
        
        //return flatMap { set.insert($0).inserted ? $0 : nil  }
        
    }
}

print(arr.orderedSet)



// Print Duplicates 

var x = [5,5,1,1,2,3,4]
x.sort { (one, two) -> Bool in
    return one < two
}
print(x)

x.sort{ return $0 < $1}
print(x)

var resultSum = 0

resultSum = x.reduce(0) { (x, y) -> Int in
    return x+y
}
print( resultSum )

resultSum = x.reduce(0, { (x,y) in x+y })
print( resultSum )

resultSum = x.reduce(0, { $0 + $1 })
print( resultSum )



let data =
        x.filter { i in
            x.filter { $0 == i }
                .count > 1
        }
    
print(Set(data))


extension Array where Element: Hashable{
    var printDuplicates: Array{
        return filter { i in
             filter { $0 == i }
                .count > 1
        }
    }
}

print(Set(data.printDuplicates))


print("String Compression")

var s = "aabcccccdd"
var output = ""
var sum:Int = 1

var dataMap = s.characters.flatMap { $0 }

for i in 0..<dataMap.count-1{
    if ( dataMap[i] == dataMap[i+1]) {
        sum += 1
    }else{
        output += "\(dataMap[i])\(sum)"
        sum = 1
    }
}

output =  output + "\(dataMap[dataMap.count-1])\(sum)"

print(output)


//var opt1:String? = nil
//print(opt1)

//var opt2:String? = .none
//print(opt2)



var thing = "cars"

let closure = { [thing] in
    print("I love \(thing)")
}

thing = "airplanes"

closure()  // i love cars

let closure1 = { [thing]  in
    print("I love \(thing)")
}

closure1()  // i love airplanes

func testGuard(val : inout Int){
    
    guard val == 0 else {
        print ("Un Success")
        return
        //fatalError()
    }
    
    print ( val )
}

var guardData = 1
testGuard(val: &guardData)



struct Pizza {
    let ingredients: [String]
}

protocol Pizzeria {
    func makePizza(_ ingredients: [String]) -> Pizza
    //func makeMargherita() -> Pizza
}

extension Pizzeria {
    func makeMargherita() -> Pizza {
        return makePizza(["tomato", "mozzarella"])
    }
}

struct Lombardis: Pizzeria {
    func makePizza(_ ingredients: [String]) -> Pizza {
        return Pizza(ingredients: ingredients)
    }
    func makeMargherita() -> Pizza {
        return makePizza(["tomato", "basil", "mozzarella"])
    }
}

let lombardis1: Pizzeria = Lombardis()
let lombardis2: Lombardis = Lombardis()

print(lombardis1.makeMargherita())
print(lombardis2.makeMargherita())

class Star {
    class func spin() { }
    static func illuminate() {}
}

class Sun : Star{
    override class func spin(){
        
    }
    
    // error: class method overrides a 'final' class method
//    override static func illuminate(){
//        
//    }
}



//optional Pattern 

let z:Int? = 10
if case let g? = z {
    print (g)
}


let arraofOptionals : [Int?] = [ nil,2,3,nil,4]

for case let number? in arraofOptionals{
    print("Founder a \(number)")
}












