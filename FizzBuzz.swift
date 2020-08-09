struct FizzBuzz: BidirectionalCollection {
    subscript(position: Int) -> String {
        precondition(indices.contains(position), "out-of-100")
        print("position is \(position)")
        switch (position%3 == 0 , position%5 == 0) {
        case (false, false) : return ""
        case (true, false): return "Fizz"
        case (false, true): return "Buzz"
        case (true, true): return "FizzBuzz"
        }
    }
    
    var startIndex: Int {
        return 1
    }
    
    var endIndex: Int {
        return 101
    }
    
    func index(after i: Int) -> Int {
        return i + 1
    }
    
    func index(before i: Int) -> Int {
        return i - 1
    }
    
}

//var fb = FizzBuzz().enumerated().filter { $0.element == "Buzz"}.map { $0.offset + 1 }
//print(fb)
for value in FizzBuzz().reversed().prefix(4) {
    print(value)
}
