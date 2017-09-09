//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let students = ["Vasi"]
let courses = [ "maths"]
let institute = ["ins1"]
var ns = NSMutableSet()
var customData:[String] = []





for student in students{
    for course in courses{
        for inst in institute{
            //print("\(student) --> \(course)-->\(institute)")
            if (!course.isEmpty && !inst.isEmpty) {
                var str = "\(student)-->\(course)-->\(inst)"
                ns.add(str)
            }
        }
    }
}

//print(ns)

for n in ns{
    //print(ns)
    customData.append(n as! String)
}

print(customData)

var data = customData[0].components(separatedBy: "-->")
var dict:[String:String] = ["a":"1"]

dict["a"]

extension Date {
    func add(minutes: Int) -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .minute, value: minutes, to: self)!
    }
}

let date1 = NSDate()
let date2 = NSDate().addingTimeInterval(5.0 * 60.0) //  "Jun 14, 2016, 5:31 PM"


//print(date1.timeIntervalSinceNow)

let diff = NSDate().timeIntervalSince(date1 as Date)
print(diff/1000)
let val = ceil(diff/1000)

if(val > 1){
    print("clear state")
}else{
    print("retain state")
}




//let interval = date1.timeIntervalSinceNow()


extension Date {
    
    func offsetFrom(date: Date) -> String {
        
        let dayHourMinuteSecond: Set<Calendar.Component> = [.day, .hour, .minute, .second]
        let difference = NSCalendar.current.dateComponents(dayHourMinuteSecond, from: date, to: self);
        
        let seconds = "\(difference.second ?? 0)s"
        let minutes = "\(difference.minute ?? 0)m" + " " + seconds
        let hours = "\(difference.hour ?? 0)h" + " " + minutes
        let days = "\(difference.day ?? 0)d" + " " + hours
        
        if let day = difference.day, day          > 0 { return days }
        if let hour = difference.hour, hour       > 0 { return hours }
        if let minute = difference.minute, minute > 0 { return minutes }
        if let second = difference.second, second > 0 { return seconds }
        return ""
    }
    
}

let minDiff = (date2 as Date).offsetFrom(date: NSDate() as Date)

let extract = minDiff.components(separatedBy: "m")

if ( Int(extract[0])! >= 10 ){
    print("Clear State")
} else {
    print("Retain State")
}


var touchIdUser = "badri2489+1@gmail.com"

let start = touchIdUser.index((touchIdUser.startIndex)!, offsetBy: 0)

let end = touchIdUser.index((touchIdUser.endIndex)!, offsetBy: -4)

print(touchIdUser.substring(with: start!..<end!))

print("AAA")









