//: Playground - noun: a place where people can play

import UIKit


print("Programme to check inf strign has number")

extension String{
    
    var isNumber :Bool {
        get{
            return !self.isEmpty && self.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
        }
    }
}

var str = "12345"
str.isNumber


let testString = "asdfsdsds12345gdssdsasdf"
let phone = testString.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: "")
print(phone)


print("Programme for Regex")
infix operator =~ {}


let phoneNumber = "(800) 555-1111"
if phoneNumber =~ "(?\\d{3})?\\s\\d{3}-\\d{4}" {
    print("That looks like a valid US phone number")
}

