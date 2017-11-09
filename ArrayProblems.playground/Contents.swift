import Foundation

class ArrayProblems{
    
    var rotationCount = 0
    
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

        //alternate solution
       print(arr.sorted(by: >).prefix(2).reduce(0, {$0 + $1}))

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
        
        //print( leftPart + rightPart )

 //using reduce
         print([leftPart,rightPart].reduce([], +))
        
    }
    
    func rotateByLeft(k: Int){
        var leftRotate = [1, 3, 5, 7, 9]
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
    
    func rotationCountInRotatedSortedArray(){
        var arr = [7, 9, 11, 12, 5]
        let firstMainElement = (arr.sorted { $0 < $1 }.first)!
        arrayProblems.rotateAgain(array: &arr, firstMain: firstMainElement)
    }
    
    
    func rotateAgain(array: inout [Int], firstMain: Int) {
        
        let resultArray = array.enumerated().map{ (index,value) -> [Int] in
            
            let firstElement = (array.prefix(1).first)!
            
            if(!(firstElement <= value)){
                //rotate left
                let first = array.removeFirst()
                array.insert(first, at:array.count)
                rotationCount += 1
            }
            
            return array
        }
        
        //rotate left until the element becomes minimum.
        if ( !(firstMain == (resultArray.last?.first)! )){
            var newArray = resultArray.last!
            rotateAgain(array: &newArray, firstMain: firstMain)
        }
    }
    
    //http://www.geeksforgeeks.org/replace-every-element-with-the-greatest-on-right-side/
    func replaceEveryElementWithGreatestElementOnRightSide(){
        
        let arr = [16, 17, 4, 3, 5, 2]
        var resultArray = [Int]()
        var tempArray = [Int]()
        
        arr.enumerated().forEach { (index,value)  in
            
            //to skip already visited elements
            tempArray.insert(value, at:index)
            let maxElement = arr.filter { !tempArray.contains ( $0) }
                .sorted { $0 > $1 }.first ?? -1
            //dump results
            resultArray.insert(maxElement,at:index)
        }
        
        print(resultArray)


        //secons solution with range

        var temp = [Int]()

      arr.enumerated().forEach { (index, val ) in
             if(!(index == arr.count-1)){
                    temp.append(arr[(index+1)...].max()!)
              } else{
                  temp.append(-1)
              }
        }

      print(temp)
    }
    
    func reorderArrayAccordingToGivenIndex(){
        let arr = [10, 11, 12]
        let indexarray = [1,0,2]
        var resultArray = [Int]()
        var resultIndexArray = [Int]()
        
        indexarray.enumerated().forEach{ (index,value) in
            resultArray.insert(arr[value],at:index)
            resultIndexArray.insert(index,at:index)
        }
        
        print(resultArray)
        print(resultIndexArray)
    }
    
    func repeatedTwoElements(){
        
        let arr = [4, 2, 4, 5, 2, 3, 1]
        var countDict = [Int:Int]()
        arr.forEach {
            countDict[$0,default:0] += 1
        }
        
        print(countDict.filter { $0.1 == 2}.flatMap { $0.0 }.sorted())
    }
    
    func minDistanceBetweenTwoValues(){
        let arr = [2, 5, 3, 5, 4, 4, 2, 3]
        let (x,y) = (2,4)
        var minDistance = Int.max
        
        let result = arr.enumerated().map { (i, element) -> Int in
            for j in stride(from : 1,to: arr.count, by:1){
                if( arr[i] == x && arr[j] == y){
                    minDistance = min(minDistance, abs(i-j))
                }
                
                if( arr[j] == x && arr[i] == y){
                    minDistance = min(minDistance, abs(i-j))
                }
            }
            return minDistance
        }
        print("Minimum Distance is \(result.last!)")
    }
    
    func maxSubArray(){
        var arr = [-2,-1,-3,4,-1,2,1,-5,4]
        
        //     var resultArray  = arr.map { _ in
        
        //          arr.reduce(0, { $0 + $1 } )
        //     }
        
        //     print(resultArray.last)
        
        
        var (sum,maxResult) = (arr[0],arr[0])
        
        for i in 1..<arr.count{
            sum = max(sum+arr[i],arr[i])
            maxResult = max(sum,maxResult)
        }
        
        print("Max Result \(maxResult)")
        
    }
    
    func secondMaximum(){
        let arr = [12, 35, 1, 10, 34, 1]
        print( Array(arr.sorted { $0 > $1}.reversed()).suffix(2).first!)
        
        let firstMaximum = arr.reduce(Int.min, { max($0,$1) } )
        let secondMaximum = arr.filter { $0 != firstMaximum }.reduce(Int.min, {max($0,$1)})
        print(secondMaximum)
        
    }
    
    func partitionFirstExamples(){
        
        var fruits = ["Banana", "Coconut", "papaya", "Rambutan", "Kiwi", "Pineapple"]
        let iFruits = fruits.partition(by: { $0.contains("i") })
        print(fruits[(iFruits)...])
        
        let filterOnFirst = fruits.first { $0.contains("i") }
        print(filterOnFirst!)
    }
    
    
    func largestNumber(){
        let array = [54, 546, 548, 60]  //6054854654
        //var array = [1,34, 3, 98, 9, 76, 45, 4] //998764543431
        
        let largestDict = Dictionary(grouping: array) { String($0).count }
        
        
        //print(largestDict )
        
        let newDict = largestDict.mapValues { $0.map { String($0) } }
        //print(newDict)
        
        let groupDict = Dictionary(grouping: newDict.flatMap { $0.1 } ){ $0.characters.first!}.sorted { $0.0 > $1.0 }
        
        var largestNumber = ""
        
        groupDict.forEach{
            
            print($0.1)
            
            largestNumber +=  $0.1.reduce("" , { String($1) + String ($0) })
            print(largestNumber)
        }
        
    }
    
    func maxProductSubArray(){
        var arr = [6, -3, -10, 0, 2]
        
        var (currentMax,currentMin,maxResult) = (arr[0],arr[0],arr[0])
        
        for i in stride(from: 1,to:arr.count, by :1){
            let temp = currentMax
            //will work for positive
            currentMax = max(arr[i], max(currentMax*arr[i],currentMin*arr[i]))
            
            //will work for negative
            currentMin = min(arr[i], min(temp*arr[i],currentMin*arr[i]))
            
            maxResult = max(currentMax,maxResult)
        }
        
        print("Maximum Product Sub Array \(maxResult)")
        
    }
    
    func arrangeMinMax(){
        let arr = [1, 2, 3, 4, 5]
        var tempArray = [Int]()
        var (left,right) = (0,arr.count - 1)
        
        repeat{
            tempArray.append(arr[left])
            left += 1
            tempArray.append(arr[right])
            right -= 1
        }while(left<right)
        
        print(tempArray)
    }
    
    func oddCount(){
        let arr = [1, 2, 3, 2, 3, 1, 3]
        var oddDict = [Int:Int]()
        
        arr.forEach {
            oddDict[$0,default:0] += 1
        }
        
        let result = oddDict.index( where: { $0.1 % 2 == 1} )
        print(oddDict[result!].key)
        
        print((oddDict.filter { $0.1%2 == 1}.first?.key)!)
    }
    
    func findKPairtsWithSmallesSum(){
        let arr1 = [1, 7, 11]
        let arr2 = [2, 4, 6]
        var kPairDict = [String:Int]()
        
        
        arr1.enumerated().forEach { (i, val1) in
            arr2.enumerated().forEach { (j, val2) in
                kPairDict["[ \(val1),\(val2) ]", default:0] = (val1+val2)
            }
        }
        
        let result = kPairDict.sorted { $0.1 < $1.1 }.prefix(3)
        result.forEach {
            print($0.0) 
        }
    }
    
    func findNextGreatesElement(){
        var arr = [4, 5, 2, 25]
        arr.enumerated().forEach { (i,element) in
            for j in i+1..<arr.count{
                if( arr[i] < arr[j]){
                    print(arr[j])
                    break
                }
            }  
        }
    }
    
    
    func detectRectangleMaxArea(){
        var test = [ [0,1,1,0,0,0] ,
                     [0,0,1,1,1,1] ,
                     [1,1,1,1,1,1],
                     [1,0,0,1,0,1]
        ]
        
        var n = test[0].count
        var left = [Int](repeating:0,count:n)
        var right = [Int](repeating:n,count:n)
        var height = [Int](repeating:0, count:n)
        var maxArea = 0
        
        test.enumerated().forEach { (i,val1) in
            var (curr_left,curr_right) = (0,n)
            
            test.enumerated().forEach { (j,val2) in
                height[j] = ( test[i][j] == 1 ) ? height[j] + 1 : 0
            }
            
            test.enumerated().forEach { (j,val2) in
                if test[i][j] == 1 {
                    left[j] = max(left[j], curr_left)
                } else {
                    left[j] = 0
                    curr_left = j + 1
                }
            }
            
            test.enumerated().reversed().forEach{ (j , val2) in
                if test[i][j] == 1 {
                    right[j] = min(right[j], curr_right)
                } else {
                    right[j] = n
                    curr_right = j
                }
            }
            
            test.enumerated().forEach { (j,val2) in
                maxArea = max(maxArea, (right[j] - left[j]) * height[j])
            }
            
        }
        
        print(maxArea)
    }
    
    
    
    func plusOne() -> [Int] {
        
        var digits = [9,9]
        var index = digits.count - 1
        
        while index >= 0 {
            if digits[index] < 9 {
                digits[index] += 1
                return digits
            }
            
            digits[index] = 0
            index -= 1
        }
        
        digits.insert(1, at: 0)
        return digits
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
arrayProblems.rotateByLeft(k:14)
arrayProblems.searchInRotatedArray()
arrayProblems.findMaximumValueOnRotations()
arrayProblems.rotationCountInRotatedSortedArray()
print("Rotation Count \(arrayProblems.rotationCount)")
arrayProblems.replaceEveryElementWithGreatestElementOnRightSide()
arrayProblems.reorderArrayAccordingToGivenIndex()
arrayProblems.repeatedTwoElements()
arrayProblems.minDistanceBetweenTwoValues()
arrayProblems.maxSubArray()
arrayProblems.secondMaximum()
arrayProblems.partitionFirstExamples()
arrayProblems.maxProductSubArray()
arrayProblems.arrangeMinMax()
arrayProblems.oddCount()
arrayProblems.findKPairtsWithSmallesSum()
arrayProblems.findNextGreatesElement()
arrayProblems.detectRectangleMaxArea()
arrayProblems.plusOne()



let list = [2,3,4,5,6]

let consecutives = list.map { $0 - 1 }.dropFirst() == list.dropLast()

print(consecutives)






