
import Foundation

func diffBetweenTwoDates(current: Date, expiration: Date) -> Int {
  let diffInDays = Calendar.current.dateComponents([.day], from: current, to: expiration).day
  return diffInDays!
}


let currentDate = Date()


//construct future Date
let stringDate = "2018-11-25"
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"
let futureDate = dateFormatter.date(from: stringDate)


let noOfDays = diffBetweenTwoDates(current: dateA , expiration: futureDate!)
print(noOfDays)
