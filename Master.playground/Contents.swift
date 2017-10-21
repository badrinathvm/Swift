//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var names = ["Mazda","Toyota","Kia","Mercedez","Chrysler1"]

//Elaborated way
names.sorted(by: { (s1:String, s2:String) -> Bool in
        return s1>s2
})

//simplest way
let sortReverseOrder =  names.sorted(by: { s1,s2 in return s1>s2 })

print(sortReverseOrder)

//closures short hand argumnents

// $0 - referes to s1  , $1 - refers to s2
let namesSorted = names.sorted(by: { $0 > $1 })
print( namesSorted )

//Operator methods
let reversedNames = names.sorted(by: >)
print(reversedNames)

//Usage of maps 

let numbers = [16,58,510]

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]


let strings = numbers.map( { (number) -> String in

  var number = number
  var output = ""
  
    repeat{
        output = digitNames[number%10]! + output
        number = number / 10
        
    }while (number > 0)
    
  return output
})

print(strings)

//escaping closures  - A closure is said to be escape a function when closure is passed as an argument to function, but it calls after the function returns.

var completionHandlers: [() -> Void] = []

func functionWithCompletionHandler(block: @escaping(Int) -> Void) {
      block(1)
    
    DispatchQueue.main.async {
           // block(1)
    }
}

functionWithCompletionHandler(block: { s1  in
        print(s1)
})


//Passing closure as a parameter
func findCars(customer cars: () -> String) {
    print("Now Presenting \(cars())!")
}

//expanded way
findCars (customer: { () -> String in
        names.remove(at: 0)
})

//some what shortcut
findCars { () -> String in
    names.remove(at: 0)
}

//awesome way
findCars {
    names.remove(at: 0)
}

//Auto closure takes care of handling closure argument to string 
//( Now you can call the function as if it took a String argument instead of a closure. )

func findAutoCars(customer cars: @autoclosure () -> String) {
    print("Now Auto Presenting \(cars())!")
}

findAutoCars(customer: names.remove(at: 0))

//map returns array of [T]
let carNames = names.map { (car) -> String in
        return car
}
print(carNames)

//filter always returns boolean
let filterCars = names.filter { (car) -> Bool in
    return car.characters.count > 1
}
print("Filter")
print( filterCars )

let digits = [1,2,3,4]
print(digits)

let resultMap = digits.map { "\($0)" }.filter { "\($0)" == "1" }
print(resultMap)


//Difference between Map ( includes nil & optionals ) & FlatMap(Eliminates options and nil )
let data = [1,2,3,4,5,6]

let mapResult = data.map { (value) -> String? in
    if( value < 2 ){
        return nil
    }
    
    return String(value)+"x"
}

print(mapResult)

let flatMapResult = data.flatMap { (value) -> String? in
    
    if( value < 2){
        return nil
    }
    
    return String(value)+"x"
}

print(flatMapResult)



print (" Protocols ")

protocol CarNames {
    
    init(model: String, make:String)
    //init(model: String, make:String )
    
    var carnames : String { get set }
}

protocol ModelName {
    init( year: String )
    
    var car : String { get set }
}


class Cars : ModelName {
    var car: String
    
    required init(year: String){
        self.car = year
    }
}

let carDetails = Cars(year: "1999")
print(carDetails.car)


class CarPent: Cars,CarNames {
    
    var model : String?
    var make:String
    
    required init(model: String, make:String) {
        //super.init(year: "2000")
        self.model = model
        self.make = make
    }
    
    var carnames : String  {
        get{
            return  ( model != nil && make != nil ) ? "\(model!) --> \(make)" : ""
        }
        set ( value ){
            print("Setting Value is \(value)")
        }

    }
}

let carPent = CarPent(model: "Cooper", make: "Toyota")

//get property
print("Getting Value \(carPent.carnames)")

//set property
carPent.carnames.append("A")











































