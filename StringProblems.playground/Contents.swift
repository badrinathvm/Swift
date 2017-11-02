import Foundation


class StringProblems {
    
    func eliminateAdjacentDuplicates(){
        var str = "geeksforgeeks"
        //var dupDict = [String:Int]()
        
        var strArray = str.characters.flatMap { String($0) }
        var result = ""
        
        print(strArray)
        
        //let result = strArray.filter { list.append(String($0)).inserted  }
        var k = 0
        for i in 0..<strArray.count-1{
            if(!(strArray[i] == strArray[i+1])){
                result += String(strArray[i])
            }
            k = i
        }
        
        if(!(strArray[k] == strArray[strArray.count-1])){
            result += String(strArray[strArray.count-1])
        }
        
        print(result)
    }
    
    func fetchSubStringFirstAndLastSame(){
        
        let str = "aba"
        
        let strArray = str.flatMap { $0 }
        
        var resultCounter = 0
        
        let output = strArray.enumerated().map{ (i,p) -> Int  in
            
            for j in 1...strArray.count-i{
                
                let start = str.index(str.startIndex, offsetBy: i)
                let end = str.index(str.endIndex, offsetBy: -(j-1))
                
                let result = str[start..<end]
                
                if ( result.count == 0 ){
                    resultCounter += 1
                }else{
                    if (result.first! == result.last!){
                        //print(result)
                        resultCounter += 1
                    }
                }
            }
            
            return resultCounter
        }
        
        print(output.last!)
    }
    
    
    func groupWordsWithSameCharacterSet(){
        let words = [ "may", "student", "students", "dog",
                      "studentssess", "god", "cat", "act",
                      "tab", "bat", "flow", "wolf", "lambs",
                      "amy", "yam", "balms", "looped",
                      "poodle"]
        var wordDict = [String:[String]]()
        let empty:[String] = []
        
        words.forEach{
            var list = [String]()
            let actualWord = $0
            let sortedWord = $0.sorted().reduce("" , {String($0) + String($1) } )
            
            //print( "\(actualWord) \(sortedWord)")
            
            list.append(actualWord)
            wordDict[sortedWord, default:empty] += list
        }
        
        //filtering the count greater than 1 and printing the values
        wordDict.filter { $0.1.count > 1 }.forEach {  print($0.1) }
    }
    
    
    func permutations(){
        let str = "ABC"
        let (l,r) = (0,str.count-1)
        var s = str.characters.flatMap { $0 }
        permutate(&s,l,r)
    }
    
    
    
    func permutate(_ s: inout [Character], _ l:Int, _ r:Int){
        if(l == r){
            print(String(s))
        }else{
            for i in l...r {
                s.swapAt(l,i)
                permutate(&s, l+1, r)
                s.swapAt(l,i)
            }
        }
    }
    
    //    //http://www.geeksforgeeks.org/number-of-even-substrings-in-a-string-of-digits/
    func noOfEvenSubString(){
        var str = "1234"
        let strArray = str.characters.flatMap{ String($0) }
        var list = [Int]()
        
        let countOfEvens = strArray.enumerated().map { (i,element) -> [Int] in
            for j in 1...strArray.count-i{
                
                let start = str.index(str.startIndex, offsetBy: i)
                let end = str.index(str.endIndex, offsetBy: -(j-1))
                
                //print(start)
                
                let result = Int(str[start..<end])!
                //print(result)
                
                list.append(result)
            }
            
            return list.filter { $0%2 == 0 };
        }
        
        print(countOfEvens.last!.count)
    }
    
    
    func anagrams(){
        let anagramWords = ["cat", "dog", "tac", "god", "act"]
        var anagramDict = [String:[String]]()
        let empty = [String]()
        
        anagramWords.forEach{
            var list = [String]()
            let actualWord = $0
            let sorted = $0.sorted().reduce("" , { String($0) + String($1) })
            print( actualWord )
            
            list.append(actualWord)
            anagramDict[sorted , default:empty] += list
        }
        
        print(anagramDict)
    }
    
    
    func printAndRemoveDuplicates(){
        let s = "geeksforgeeks"
        
        let sArray = s.flatMap { $0 }
        
        //print duplicates
        let printDuplicates = String(sArray.filter { val in
            sArray.filter { $0 == val }.count > 1})
        print(printDuplicates)
        
        //remove duplicates
        var set = Set<Character>()
        
        let removeDuplicates = String(sArray.filter { set.insert($0).inserted })
        
        print(removeDuplicates)
        
    }
    
    func countNumberOfWords(){
        //.replacingOccurrences(of:"\n|\t",with:" ",options: .regularExpression)
        let s = "One two         three\n    four\tfive  "
        let result = s.components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }.joined(separator: " ")
        
        let resultCount = s.components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }.count
        
        
        print(result)
        print(resultCount)
    }
    
    
    func subStringWithHighestFrequency(){
        
        let s = "abddab"
        let sArray = s.flatMap { String($0) }
        var freqDict = [String:Int]()
        
        sArray.enumerated().forEach{ (i,element) in
            for j in 1...sArray.count-i{
                let start = s.index(s.startIndex, offsetBy: i)
                let end = s.index(s.endIndex,offsetBy: -(j-1))
                
                let data = s[start..<end]
                
                //print(data.count)
                
                freqDict[String(data),default:0] += data.count *  ((data.count == 1) ? 2 : 1)
            }
        }
        
        let count = freqDict.max { $0.1 < $1.1 }?.key
        print(count!)
        
    }
    
    func countOfVowels(){
        
        var s = "abc de"
        s = s.replacingOccurrences(of:" ", with: "")
        
        var vowelDict = [Character:Int]()
        
        s.flatMap{$0}.filter{ ["a","e","i","o","u"].contains($0) }.forEach {
            
            vowelDict[$0,default:0] += 1
        }
        
        print(vowelDict.flatMap { $0.1 }.reduce(0, {$0+$1} ) )
    }
    
    func checkBothHalvesHasSameString(){
        
        let s = "abccab"
        
        let midIndex = s.index(s.endIndex,offsetBy: -(s.count/2))
        
        
        let first = s[s.startIndex..<midIndex]
        let second = s[midIndex...]
        
        let sortedLeftValue = first.flatMap { $0 }.sorted().reduce("" , {String($0) + String($1) } )
        
        
        let sortedRightValue = second.flatMap { $0 }.sorted().reduce("" , {String($0) + String($1) } )
        
        print( ( sortedLeftValue == sortedRightValue ) ? "YES" : "NO" )
        
        
    }
    
    func removeCharactersofSecondStringInFirst(){
        var main = "geeksforgeeks"
        var sub = "mask"
        
        var resultStr = ""
        let mainArray = main.flatMap { $0 }
        let subArray = sub.flatMap { $0 }
        
        mainArray.forEach {
            
            if(!subArray.contains($0)){
                resultStr += String($0)
            }
            
        }
        
        print(resultStr)
        
    }
    
    //   func wip(){
    //     var arr = "bcc"
    //     var strArray = [[String]]()
    //     var firstArray = arr.flatMap { $0 }
    
    //     strArray.append( String(firstArray) )
    
    //     print(strArray)
    //     var tempArray = [String]()
    
    //     for i in 0..<firstArray.count-1{
    
    //         if(firstArray[i] == firstArray[i+1]){
    //            tempArray.append("cc")
    //         }else{
    //           tempArray.append(String(firstArray[i]))
    //         }
    //     }
    //
    
    // print(tempArray)
    
    // strArray.append(tempArray)
    //   }
    
    
    func stringCompress() {
        //updated chunks array is passed to next iteration
        
        let chunks = str.characters.reduce([(Character, Int)]()) { (chunks, char) -> [(Character, Int)] in
            
            
            //get a mutable copy
            var _chunks = chunks
            
            //get a count if last char is same; 0 otherwise
            let count = _chunks.last?.0 == char ? _chunks.last!.1 : 0
            //remove tuple inorder order to update the latest count one.
            if count > 0 {_chunks.removeLast()}
            
            //append tuple with incremented count
            _chunks.append((char, count + 1))
            return _chunks
        }
        
        print(chunks.map { chunk in  chunk.1 == 1 ? "\(chunk.0)" : "\(chunk.0)\(chunk.1)" }.reduce("",{ String($0) + String($1) }))
        
    }
    
}


var strProblems = StringProblems()
strProblems.eliminateAdjacentDuplicates()
strProblems.fetchSubStringFirstAndLastSame()
strProblems.groupWordsWithSameCharacterSet()
strProblems.permutations()
strProblems.noOfEvenSubString()
strProblems.anagrams()
strProblems.printAndRemoveDuplicates()
strProblems.countNumberOfWords()
strProblems.subStringWithHighestFrequency()
strProblems.countOfVowels()
strProblems.checkBothHalvesHasSameString()
strProblems.stringCompress()


//var str = "gfg"
//var subSeq = str.flatMap { $0 }
//var list = Set<String>()
//
//subSeq.forEach{
//    list.insert(String($0))
//}
//
//
////subSeq.enumerated().map { val in 
////print(subSeq.filter { $0 != "g" }.reduce ("",{String($0) + String($1) } ))
////}
//
//for i in 0..<subSeq.count-1{
//    for j in i..<subSeq.count{
//        list.insert(String(subSeq[i]) + String(subSeq[j])) 
//    }
//}
//
//
//print(list)






//print(list)
//  subSeq.enumerated().map{ (i,p)  in 

//         for j in 1...subSeq.count-i{

//         let start = str.index(str.startIndex, offsetBy: i)  
//         let end = str.index(str.endIndex, offsetBy: -(j-1))

//         let result = str[start..<end]

//           //print(result)

//           //list.insert(String(result))
//           //list.insert(String(result.reversed()))

//         }
//   }

//print(list)


























