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
    
    func wip(){
        var arr1 = [1, 4, 5, 7]
        var arr2 = [10, 20, 30, 40]
        var diff = Int.max
        var x = 38
        var (res1,res2) = (0,0)
        
        
        
        arr1.enumerated().map { (l,p) in
            arr2.reversed().enumerated().map { (r,q) in
                
                if( p+q - x < diff){
                    res1 = l
                    res2 = r
                    diff = p+q - diff
                }
                
                //                                                          if( p + q > x){
                //                                                           //l += 1
                //                                                          }else{
                //                                                            //r -= 1
                //                                                          }
                
            }
        }
        
        print(arr1[res1])
        print(arr2[res2])
        
    }
    
}

let arrayProblems = ArrayProblems()
arrayProblems.groupPositiveNegatives()
arrayProblems.groupOneZeroArray()
arrayProblems.sortArrayAccordingToAbsoluteDifference()
arrayProblems.segregateOddEven()
arrayProblems.largestPairInUnsortedArray()






































