//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var touchIdUser = "badri2489+1@gmail.com"

let start = touchIdUser.index((touchIdUser.startIndex)!, offsetBy: 0)

let end = touchIdUser.index((touchIdUser.endIndex)!, offsetBy: -4)

print(touchIdUser.substring(with: start!..<end!))

print("AAA")


func formatCurrency(value: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.maximumFractionDigits = 2
    formatter.locale = Locale(identifier: Locale.current.identifier)
    let result = formatter.string(from: value as NSNumber)
    return result!
}

//print(formatCurrency(value: 12.34))


