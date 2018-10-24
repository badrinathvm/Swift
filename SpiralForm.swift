import Foundation

func printArrayInSpiral() {
//   let arr = [
//   [1, 2, 3, 4],
//   [5, 6, 7, 8],
//   [9,10,11,12]
// ]  // [1,2,3,4,8,12,11,10,9,5,6,7]
  
  let arr = [
 [ 1, 2, 3],
 [ 4, 5, 6],
 [ 7, 8, 9]
]  //[1,2,3,6,9,8,7,4,5]

print(arr.count)

var resultArray : [Int] = [Int]()

  arr.enumerated().forEach {
    
      let elements = $0.element
    
       switch $0.offset {
         
         //for first row add all the elements.
         case 0 :  resultArray += elements
         
         //for last row add all thh elements in reverse order.
         case arr.count - 1 :
                  let revElements  = Array(elements.reversed())
                  resultArray += revElements

                  //get the previous row elements by dropping the last element and add it to the final array
                  let elements = arr[$0.offset - 1].dropLast()
                  resultArray += elements
        
         //for intermediate rows add only the last element of the row.
         default: 
               resultArray.append(elements.last!)
       }
    
  }

  print(resultArray)
}
