// This is a sandbox to experiment with CoderPad's execution capabilities.
// It's a temporary, throw-away session only visible to you.

import Foundation

//  # 1. Find center, or the highest number closest to it 
//   # 2. Set carrot_count to 0, increment count accordingly 
//   # 3. Find the square next to it with the highest number 
//   # 4. Repeat step 2 until it there are no adjacent squares other than 0's
//   # 5. Break loop, return carrot_count 

class CarrotSearch {
  
  var arr:[[Int]] 
  var currentRow = 0
  var currentColumn = 0
  var rabbitSleep = false
  var carrotCount = 0 
  
   init(arr: [[Int]]) {
     self.arr = arr
   }
  
  //Find the possible center or the highest number closer to it
  func findPossibleCenters(size: Int) -> [Int] {
    if size%2 == 0 {
      return [size/2 - 1 ,size/2 ]
    }else {
      return [size/2 ]
    }
  }
  
  func determineCenterPosition(rows: [Int], columns: [Int]) {
    var dict:[Int:[Int]] = [:]
    rows.forEach { row in
      columns.forEach { column in 
        let element = arr[row][column]
        dict[element] = [row,column]
      }
    }

    highestValues(dict)    
    print("current Row is \(currentRow)")
    print("current Column is \(currentColumn)")

  }
  
  func eatCarrot() {
    let square = arr[currentRow][currentColumn]
    if square == 0 {
      rabbitSleep = true
      return
    }
      carrotCount += square
      arr[currentRow][currentColumn] = 0
  }
  
  func possibleMoves() {
    let row = currentRow
    let column = currentColumn
    var dict:[Int: [Int]] = [:]

    //move up, down,left,right
    if row + 1 <= arr.count {
      let element = arr[row + 1][column]
      dict[element] = [row+1, column]
    }

    if row - 1 >= 0  {
      let element = arr[row - 1][column]
      dict[element] = [row - 1, column]
    }

    if column + 1 <= arr[0].count {
      let element = arr[row][column + 1]
      dict[element] = [row, column + 1]
    }

    if column - 1 >= 0  {
       let element = arr[row][column - 1]
      dict[element] = [row , column - 1]
    }

    highestValues(dict)    
  }
  
  func highestValues(_ dict : [Int: [Int]]) {
    let sortedDict = dict.sorted { $0.0 < $1.0 }
    let values = sortedDict.last!.value
    print(values)
    currentRow = values.first!
    currentColumn = values.last!
  }

  func getCount() {
    let startRows = findPossibleCenters(size: arr.count)
    let startColumns = findPossibleCenters(size: arr[0].count)
    determineCenterPosition(rows: startRows, columns: startColumns)
    while !rabbitSleep{
      eatCarrot()
      possibleMoves()
    }
    print("Carrot Count is \(carrotCount)")
  }
}

 var arr = [
    [5, 7, 8, 6, 3],
    [0, 0, 7, 0, 4],
    [4, 6, 3, 4, 9],
    [3, 1, 0, 5, 8]
 ]
  
  
var carrot = CarrotSearch(arr: arr)
carrot.getCount()



