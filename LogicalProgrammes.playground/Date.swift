
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


enum Type {
  case Thermometer, Bacteria, Flu
}

class Item {
    var product: Type
    var useIn: Int
    var qualityValue:Int
  
   init(product:Type, useIn:Int, qualityValue: Int) {
     self.product = product
     self.useIn = useIn
     self.qualityValue = qualityValue
   }
}

var item1 = Item(product: .Bacteria, useIn: 10 , qualityValue: 20)
//print(item1)

func updateQuality(item: Item) -> Int {
   switch item.product {
     case .Thermometer: 
            //No chnage in the quality
            return  item.qualityValue
     case .Bacteria:
            let expirationDate = addDate(days: item.useIn)
            let diff = diffBetweenTwoDates(current: Date() , expiration: expirationDate!)
            if diff > 0 {
              return item.qualityValue + 1
            }else {
              return item.qualityValue
            }
     case .Flu: 
            print("Flu")
           return 0
   }
}

let quality = updateQuality(item : item1)
print("Qualit is \(quality)")
