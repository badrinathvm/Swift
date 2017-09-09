//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//Argument Labels 

func greet(origin personName: String , from homeTown:String) -> String{
    
    return "HEllo \(personName) visited from \(homeTown)"
}

print(greet(origin: "Badri", from: "Bangalore"))


//No argument Labels

func test(_ firstPatameter:Int , secondParameter:Int){
    print(firstPatameter + secondParameter)
}

test(1, secondParameter: 2)


//Default Parameters 

func defaultValues(withDefaultValue: Int , withoutDefaultValue:Int = 12){
    print("Values are \(withDefaultValue) \(withoutDefaultValue)")
}

defaultValues(withDefaultValue: 10)

//Variadic Parmeters

func sum(_  numbers: Int...) -> Int{
    
    var s: Int = 0
    for n in numbers{
        s += n
    }
    
    return s
}

print(sum(1,2,2,23))



//Inout 

func swap(_ :inout Int, _: inout Int){
    let temp:Int = a
    a = a
    a = temp
}

var a = 10
var b = 20

swap(&a,&b)


class daysofaweek {
    private var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "saturday"]
    subscript(index: Int) -> String {
        get {
            //print("Control inside get")
            return days[index]
        }
        
        set(newValue) {
            print("Control inside set")
            self.days[index] = newValue
        }
    }
}
var p = daysofaweek()

print(p[0])
print(p[1])
print(p[2])
print(p[3])

p[0] = "Monday"
print(p[0])

/* >>>>> Program to find the first and second smallest in array */

struct FirstSecondSmallest{
    
    func findFirstSecondSmallest(array:[Int]){
    
        //var first:Int = Int.max
        //var second:Int = Int.max
        
        var (first, second) = (Int.max ,Int.max)
        
        if array.count < 2 {
            print("Invalid ")
            return
        }
        
        for i in 0..<array.count{
            if( array[i] < first){
                second = first
                first = array[i]
            }else{
                if(array[i] < second && array[i] != first ){
                    second = array[i]
                }
            }
        }
        
        print("First Smallest is \(first)")
        print("Second Smallest is \(second)")
        
    }
}

FirstSecondSmallest().findFirstSecondSmallest(array: [5,3,1,15])


/*   Implementation of Stack  */

struct Stack<T>{
    
    //restricts the use of entity in its own defining source file.
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

var stack = Stack<Int>()
stack.push(10)
stack.push(20)
stack.push(30)
//print(">>>> Popped Element is \(stack.pop())")

//print(">>>> Top Element is \(stack.top()) ")
stack.disp()



/* Program for count of occurences */

struct CountOccurences{
    
    func countOccureneces(_ key:Int , inArray array: [Int]) -> Int?{
        func leftBoundary() -> Int?{
            var (low , high ) = (0, array.count)
            
            while low < high{
                let mid = low + (high - low)/2
                if ( array[mid] < key){
                    low = mid + 1
                }else{
                    high = mid
                }
            }
            
            return low
        }
        
        func righBoundary() -> Int?{
            var (low,high) = (0, array.count)
            while low < high {
                let mid = low + (high - low )/2
                if (array[mid] > key){
                    high = mid
                }else{
                    low = mid + 1
                }
            }
            
            return low
        }
        
        return righBoundary()! - leftBoundary()!
        
    }
    
}

print(CountOccurences().countOccureneces(3, inArray: [1,3,3,3,3,6,8,11])!)


/* >>> Program for maximum and minimum */

struct MaxMin{
    
    func maximum<T: Comparable>(_ array: [T]) -> T?{
        
        guard var maximum = array.first else{
            return nil
        }
        
        for element in array.dropFirst(){
            maximum = element > maximum ? element : maximum
        }
        
        return maximum
    }
    
    func minimum<T: Comparable>(_ array: [T]) -> T? {
        guard var minimum = array.first else {
            return nil
        }
        
        for element in array.dropFirst(){
            minimum = element < minimum ? element : minimum
        }
        
        return minimum
    }
    
}

print(MaxMin().maximum([1,6,3,9,100])!)
print(MaxMin().minimum([1,6,3,9,100])!)


/*  Program for String search using Brute Force */

extension String {
    
    func indexOf(_ pattern: String) -> String.Index?{
        
        for i in self.characters.indices{
            var j = i
            var found = true
            for p in pattern.characters.indices{
                if j == self.characters.endIndex || self[j] != pattern[p]{
                    found = false
                    break
                }else{
                    j = self.characters.index(after: j)
                }
            }
            
            if found {
                return i
            }
        }
        return nil
    }
}


let str1 = "Hello, World"
print(str1.indexOf("Wor")!)


/* Search for a Range */

struct SearchForRange{
    
    static func searchForRange(nums: [Int] , target: Int) -> [Int]{
        var result:[Int] = Array<Int>(repeating: -1, count: 2)
        var (i,j) = (0,nums.count - 1)

        while i < j{
            let mid: Int = (i+j) / 2
            if nums[mid] < target {
                i = mid + 1
            }else{
                i = mid
            }
        }
        
        if nums[i] != target{
            return result
        }else{
            result[0] = i
        }
        
        j = nums.count - 1
        while i < j{
            let mid:Int = (i+j) / 2
            if nums[mid] > target {
                j = mid - 1
            }else{
                i = mid
            }
        }
        result[1] = j
        
        print(result)
        
        return result
    }
}

print(SearchForRange.searchForRange(nums: [5,7,7,8,8,3], target: 8))












