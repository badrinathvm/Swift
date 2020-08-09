import UIKit

// PrefixIterator to get the string one after the other
struct PrefixIterator: IteratorProtocol {
    var string:String
    var offset: String.Index
    
    init(string: String) {
        self.string = string
        offset = string.startIndex
    }
    
    mutating func next() -> Substring? {
        guard offset < string.endIndex else { return nil }
        string.formIndex(after: &offset)
        return string[..<offset]
    }
}

struct PrefixSequence: Sequence {
    var string:String
    
    func makeIterator() -> PrefixIterator {
        return PrefixIterator(string: string)
    }
}

for prefix in PrefixSequence(string: "Hello") {
    print(prefix)
}

/*
 o/p: "h", 
        "he", 
        "hel", 
        "hell", 
        "hello"
*/


let result = PrefixSequence(string: "Hello").map { $0.uppercased() }
print(result)  

// o/p: ["H", "HE", "HEL", "HELL", "HELLO"]



// Fibonacci series using Iterator protocol

struct FibsIterator: IteratorProtocol {
    var target:Int
    var state:(Int,Int)
    
    init(target: Int) {
        self.target = target
        state = (0,1)
    }
    
    mutating func next() -> Int? {
        let upcomingNumber = state.0
        state = (state.1 , state.0 + state.1)
        return upcomingNumber
    }
}

var target = 30
var iterator = FibsIterator(target: target)
while let x = iterator.next() {
    guard x < target else { break }
    print(x)
}
