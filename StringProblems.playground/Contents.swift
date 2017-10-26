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
    
}


var strProblems = StringProblems()
strProblems.eliminateAdjacentDuplicates()
strProblems.fetchSubStringFirstAndLastSame()
strProblems.groupWordsWithSameCharacterSet()
strProblems.permutations()
strProblems.noOfEvenSubString()
strProblems.anagrams()

