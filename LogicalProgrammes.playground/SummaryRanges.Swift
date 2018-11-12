
func summaryRanges() {
  var resArray = [String]()
  var arr = [0,1,2,4,5,7]
  print(arr)   //["0->2","4->5","7"]


  /* Logic here is */

  // 1. Compare (previous number + 1 ) with current one
  // 2. if it's not contugous a new range is formed.
  //      eg:  0 + 1 != 1 , start = 0 / end = 0, 1, 
  //           1 + 1 != 2 , start = 0 / end = 0,1, 2
  //           2 + 1 != 4 , resArray ( 0 ---> 2)  start = 4 , end = 0,1,2,4
  //           4 + 1 != 5 , start = 4 / end = 0,1,2,4,5 
  //           5 + 1 != 7 , resArray ( 4 ---> 5) start = 5 , end = 0,1,2,4,5
  // 3.

  var start = arr[0]
  var end = arr[0]
  for i in 1..<arr.count {
    if end + 1 != arr[i] {    
       resArray += (start == end ) ?  ["\(start)"] : ["\(start) --> \(end)"]
       start = arr[i]
       end = arr[i]
    }else{
      end = arr[i]
    }
  }

  //for the last element
  resArray += (start == end ) ?  ["\(start)"] : ["\(start) --> \(end)"]

  print(resArray)
}
