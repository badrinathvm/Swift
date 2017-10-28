import Foundation

class ArrayProblems{
    
    func groupPositiveNegatives(){
        
        let arr = [1, -1, 3, 2, -7, -5, 11, 6 ]
        let positiveArray = arr.filter{   $0 > 0 }
        let negativeArray = arr.filter{   $0 < 0 }
        
        // negativeArray.map{
        //   positiveArray.append($0)
        // }
        
        let result = positiveArray + negativeArray
        
        print(result)
        
    }
    
    func groupOneZeroArray(){
        let arr =  [0, 1, 0, 1, 0, 0, 1, 1, 1, 0]
        let oneArray = arr.filter { $0 == 1 }
        let zeroArray = arr.filter { $0 == 0 }
        print( oneArray + zeroArray )
    }
    
    //http://www.geeksforgeeks.org/sort-an-array-according-to-absolute-difference-with-given-value/
    
    func sortArrayAccordingToAbsoluteDifference(){
        
        let arr = [10, 5, 3, 9, 2]
        let x = 7
        var sortDict = [Int:Int]()
        
        arr.forEach{
            sortDict[$0, default:0] = abs($0 - x)
        }
        
        let result = sortDict.sorted { $0.1 < $1.1 }.flatMap { $0.0 }
        
        print(result)
        
    }
    
    func segregateOddEven(){
        let arr = [1,2,3,4,5,6,7]
        let evenArray = arr.filter { $0 % 2 == 0 }
        let oddArray = arr.filter { $0 % 2 == 1}
        
        print (evenArray + oddArray )
    }
    
    func largestPairInUnsortedArray(){
        let arr = [12, 34, 10, 6, 40]
        
        //Get the first Maximum
        let first = arr.reduce(Int.min, { max( $0,$1 )} )
        
        //removing the first maximum from array and getting the next max
        let second = arr.filter { $0 != first }.reduce(Int.min,{ max( $0,$1) } )
        
        print ( first + second )
    }
    
    //    func wip(){
    //      var arr1 = [1, 4, 5, 7]
    //     var arr2 = [10, 20, 30, 40]
    //     var diff = Int.max
    //   lwt x = 38
    //   var (res1,res2) = (0,0)
    
    
    
    // arr1.enumerated().map { (l,p) in
    //           arr2.reversed().enumerated().map { (r,q) in
    
    //                                                  if( p+q - x < diff){
    //                                                             res1 = l
    //                                                             res2 = r
    //                                                            diff = p+q - diff
    //                                                          }
    
    // //                                                          if( p + q > x){
    // //                                                           //l += 1
    // //                                                          }else{
    // //                                                            //r -= 1
    // //                                                          }
    
    //                                                         }
    //                       }
    
    // print(arr1[res1])
    // print(arr2[res2])
    
    //    }
    
    
    func pairSortedArray(){
        let arr = [11,15,6,8,8,19]
        let x = 14
        var isFound = false
        
        arr.enumerated().forEach{ (i,element)  in
            for j in 1..<arr.count-i{
                if( arr[i] + arr[j] == x){
                    isFound = true
                    break
                }
            }
        }
        print( isFound ? true: false )
    }
    
    func productArray(){
        
        let arr = [10,3,5,6,2] //[180,600,360,300,900]
        
        
        // for i in 0..<arr.count{
        //   print(arr.filter { $0 != arr[i] }.reduce(1, {x,y in x*y}))
        // }
        
        let result = arr.map{ val in
            arr.filter { $0 != val }.reduce(1, {x,y in x*y})
        }
        
        print(result)
        
    }
    
    func rotateRight(k: Int){
        let arr = [1,2,3,4,5,6,7]
        var reversedArray = Array(arr.reversed())
        let rotations = (arr.count + k % arr.count) % arr.count
        print(rotations)
        
        let leftPart = Array (reversedArray[0..<rotations].reversed())
        let rightPart = Array(reversedArray[rotations..<arr.count].reversed())
        
        print( leftPart + rightPart )
        
    }
    
    func rotateByLeft(k: Int){
        var leftRotate = [1,2,3,4,5,6,7]
        for _ in 0..<k {
            let first = leftRotate.removeFirst()
            leftRotate.insert(first,at:leftRotate.count)
        }
        print(leftRotate)
    }
    
    func searchInRotatedArray(){
        let arr = [3,5,1,2,4]
        let key = 4
        
        var resultArray = [Int]()
        let result = arr.enumerated().map { (index,element) -> [Int] in
            if(element == key){
                resultArray.append(index)
            }
            
            return  resultArray
        }
        
        print("Found at Index \((result.last?.first)!) ")
        
    }
    
    func findMaximumValueOnRotations(){
        var arr = [10, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        
        arr.forEach{ element in
            
            let last = (arr.suffix(1).first)!
            
            // rotate left until largest element is present at the end.
            if(!(last > element)) {
                let first = arr.removeFirst()
                arr.insert(first,at:arr.count)
            }
        }
        
        let result =  arr.enumerated().map{ (index,value) in
            return index * value
        }
        
        print(result.reduce (0, { $0 + $1 }) )
        
    }
    
}

let arrayProblems = ArrayProblems()
arrayProblems.groupPositiveNegatives()
arrayProblems.groupOneZeroArray()
arrayProblems.sortArrayAccordingToAbsoluteDifference()
arrayProblems.segregateOddEven()
arrayProblems.largestPairInUnsortedArray()
arrayProblems.pairSortedArray()
arrayProblems.productArray()
arrayProblems.rotateRight(k:3)
arrayProblems.rotateByLeft(k:2)
arrayProblems.searchInRotatedArray()
arrayProblems.findMaximumValueOnRotations()





























