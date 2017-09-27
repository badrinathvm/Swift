//: Playground - noun: a place where people can play

import UIKit



private extension String{
    subscript(index : Int) -> Character{
        return self[self.characters.index(self.startIndex, offsetBy: index)]
    }
}

//var x:String = "ABCDGH"
//var y:String = "AEDFHR"

//var x:String = "AGGTAB"
//var y:String = "GXTXAY"



//creating a two dimension array

func lcs(m:Int, n:Int, x:String ,y:String) -> Int{
    
var dp = Array(repeating: Array(repeatElement(0, count: n + 1)), count: m + 1)
    for i in 1...m {
        for j in 1...(n){
            if i == 0 || j == 0 {
                return 0
            }else if( x[i - 1]  == y[j - 1] ){
                    dp[i][j] = dp[i-1][j-1] + 1
            }else{
                dp[i][j] = max(dp[i-1][j], dp[i][j-1])
            }
        }
     }
    return dp[m][n]
}

print("Longest Common Substring or Subsequence")
var x = "abcdxyz"
var y = "xyzabcd"

print(lcs(m: x.characters.count, n:y.characters.count, x:x, y:y))
print()



print("Deletion of Strings ")

func deleteOperationTwoStrings(m:Int, n:Int, a:String ,b:String) -> Int{
    
    var dp = Array(repeating: Array(repeatElement(0, count: n + 1)), count: m + 1)
    for i in 1...m {
        for j in 1...(n){
            if i == 0 || j == 0 {
                return 0
            }else if( a[i - 1]  == b[j - 1] ){
                dp[i][j] = dp[i-1][j-1] + 1
            }else{
                dp[i][j] = max(dp[i-1][j], dp[i][j-1])
            }
        }
    }
    return m+n - 2 * dp[m][n]
}

var a = "sea"
var b = "eat"

print(deleteOperationTwoStrings(m: a.characters.count, n:b.characters.count, a:a, b:b))
print()



print("Minimum no of characters to make a palindrome")

var str1 = "abcde"
var str2 = String(str1.characters.reversed())
print((str1.characters.count - lcs(m: str1.characters.count, n:str2.characters.count, x:str1, y:str2)))
print()



print("Length of the longest sub string is the forming the string wihtout repeatation")

struct LengthOfLongestSubString{
    
    static func uniqueAll(str:String,start:Int,end:Int) -> Bool{
        let ns = NSMutableSet()
        
        for i in start..<end{
         if(ns.contains(String(str[i]))){
                return false
            }else{
                ns.add(String(str[i]))
            }
         }
         return true
    }
    
    static func lengthofLongestSubString(str:String) -> Int{
        var ans:Int = 0
        for i in 0..<str.characters.count{
            for j in i+1...str.characters.count{
                if(LengthOfLongestSubString.uniqueAll(str: str, start: i, end: j)){
                    ans = max(ans,j-i)
                }
            }
        }
        
        return ans
    }
    
}

var s = "ABDEFGABEF"
//var s = "GEEKSFORGEEKS"

print(LengthOfLongestSubString.lengthofLongestSubString(str:s))


print("Programme to eliminate adjacent duplicates")

struct EliminateAdjacentDuplicates{
    
    static func eliminateDuplicates(str: inout String, n:Int) ->String{
        
        var result:String = ""
        var (k,len,i) = (0,str.characters.count,0)
        
        var chars = Array(str.characters)
        while(i<len){
            
            //if no match copy previous characarter
            if( chars[i-1] != chars[i]){
               chars[k] = chars[i-1]
                k += 1
            }else{
                //if match happens skip character
                while( chars[i-1] == chars[i]){
                    i += 1
                }
            }
            i += 1
        }
        
        chars[k] = chars[i-1]
        
        if(k != n){
            eliminateDuplicates(str: &str, n: k)
        }else{
            result =  String(chars)
        }
        
        return result
    }
    
}

var s1 = "geeksforgeek"

print(EliminateAdjacentDuplicates.eliminateDuplicates( str:&s, n:s.characters.count ))


print("Programme for Pangram")

var dict:[Character:Int] = [:]
var isPanagram:Bool = false

var str = "We promptly judged antique ivory buckles for the prize"

str = str.replacingOccurrences(of: " ", with: "").lowercased()
print(str)

for i in 0..<str.characters.count{
    if !dict.keys.contains(str[i]){
       dict[str[i]] = 1
    }
}

print(dict)
print(dict.count)


if (dict.count == 26){
    for ( key , value ) in dict{
        if (value == 1) {
            isPanagram = true
        }else{
            isPanagram = false
        }
    }
}

print(isPanagram)

print("Programme to find the shortest distance between two words")

struct ShortestDistanceBetweenWords{
    
    static func shortestDistance(str:String, s1:String, s2:String)->Int{
        
        var (p1,p2,minDistance,i) = (-1,-1,Int.max,0)
        
        let splitString = str.components(separatedBy: " ")
        
        for s in splitString{
            
            if s == s1{
                p1 = i
            }
            
            if(s == s2){
                p2 = i
            }
            
            if (p1 != -1 && p2 != -1){
                minDistance = min(minDistance,(p2-p1))
            }
            
            i+=1
        }
        
        return minDistance
        
    }
}

print(ShortestDistanceBetweenWords.shortestDistance(str: "hello how are you", s1: "hello", s2: "you"))



extension Int {
    var array: [Int] {
        return description.characters.flatMap{Int(String($0))}
    }
}


print("Programme for Additive Sequence")

struct AdditiveSequence{
    
    static func additiveNumber(number:Int){
        var result:Int = 0
        var a = number.array
        var addtiveFlag:Bool?
        var tempData:String = ""
        
        for i in 3..<a.count-1{
            print(a[i-1])
            print(a[i-2])
            print(a[0])
            if( a[i-2] >= 9){
                print("R is \(a[i-1] + a[i-2] + a[0] )")
                result = a[i-1] + a[i-2] + a[i]
                            print("Result is \(result)")
            }else{
                 result = a[i-1] + a[i-2]
            }
            

            
            let b = result.array
            
            if(b.count == 1){
                 addtiveFlag = (result == a[i]) ? true : false
            }else{
                print("Control came here \(b.count)")
                for j in 0..<b.count{
                    tempData += "\(a[i+j])"
                }
                print("Data is \(tempData)")
                
                print(result == Int(tempData))
                    
                addtiveFlag = (result == Int(tempData)) ? true: false
                
            }
           
        }
        
        if (addtiveFlag!){
            print("Additve number")
        }else{
            print("Not AdditiveNumber")
        }
        
    }
}

AdditiveSequence.additiveNumber(number: 199100199)


print("Program for string to Integer")

struct atoi{
    
    static func atoi(str: inout String) -> Int?{
        
        if (str.characters.count < 1){
            return 0
        }
        
        //trim white spaces
        str = str.trimmingCharacters(in: CharacterSet.whitespaces)

        var flag:String = "+"
        
        var i:Int = 0
        
        if( str[0] == "-"){
            flag = "-"
            i += 1
        } else if (str[0] == "+"){
            i += 1
        }
        
        let result:Double = 0
        
        while ( str[i] >= "0" && str[i] <= "9"){
            //result = result * 10 + ( str[i] - '0')
            
        }
        
        return 0
    }
}

print()

struct ReverseWords{
    
    
    static func reverseWords(s:String){
        
        var result = String()
        
        let str = s.components(separatedBy: " ")
        
        for t in str{
            
            //print( String(t.characters.reversed() ) )
            
            result.append(String(t.characters.reversed()))
            result.append(" ")
            
        }
        
        print(result)
            
    }
}

ReverseWords.reverseWords(s: "Let's take Leetcode contest")
print()


print("Programme to detect Capital")

struct DetectCapital{
    
    static func detectCapital(s:String) -> Bool?{
        
        var isFlag:Bool?
        
        for currenCharacter in s.unicodeScalars{
            
            /*if CharacterSet.lowercaseLetters.contains(currenCharacter){
                isFlag = false
            }else{
                print(currenCharacter)
                isFlag = true
            }*/
            
            isFlag = (CharacterSet.uppercaseLetters.contains(currenCharacter) ) ? true : false
        }
        
        return isFlag!
    }
    
}

print("Positive Case \(DetectCapital.detectCapital(s: "INDIA")!)")
print("Negative Case \(DetectCapital.detectCapital(s: "INDIAaaa")!)")



print()
print("Programme for Repeated Sub String")

struct RepeatedSubString{
    
    static func repeatedSubString(s:String) -> Bool?{
        
     let n = s.characters.count
        
        for i in stride(from: n/2, to: 1, by: -1){
            if ( n%i  == 0){
                
                let c:Int = n/i
                var t:String = ""
                
                for _ in 0..<c{
                    
                    let start = s.index(s.startIndex, offsetBy: 0)
                    let end = s.index(s.endIndex, offsetBy: -i)
                    let range = start..<end
                    t.append( s.substring(with: range) )

                    
                    if( t == s) {
                        print ("YEs")
                        return true
                    }
                }
            }
        }
        return false
    }
}

print(RepeatedSubString.repeatedSubString(s:"abababab")!)
print()

print("Programme for finding the shortest Palindrome")

struct Palindromes{
    
    static func shortestPalindrome(str:String) ->String?{
        
        if(str.characters.count == 0){
            return nil
        }
        
        if(str.characters.count == 1){
           return str
        }
        
        
        var i:Int = 0
        var j:Int = str.characters.count - 1
        
        while (j>=0){
            if (str[i] == str[j]){
                i += 1
            }
           j -= 1
        }
        
        if (i == str.characters.count){
            return str
        }
        
        
        let start = str.index(str.startIndex, offsetBy: i)
        let suffix = str.substring(from: start)
        
        let prefix = String(suffix.characters.reversed())
        
        let st = str.index(str.startIndex, offsetBy: 0)
        //let ed = str.index(str.endIndex, offsetBy: -i)
        let range = st..<start
        
        let mid = shortestPalindrome(str: str.substring(with:range))
        
        var result = String()
        result += prefix
        result += mid!
        result += suffix
        
        return result
        
    }
    
    
    static func longestPalindrome(str:String) -> String?{
        
        if(str.characters.count == 0){
            return nil
        }
        
        if(str.characters.count == 1){
            return str
        }
        
        var max:Int = 0
        var longestPalindrome = String()
        
        for i in 0..<str.characters.count{
            for j in i+2...str.characters.count{
                
                let start = str.index(str.startIndex, offsetBy: i)
                let end = str.index(str.endIndex, offsetBy: -j)
                let range = start..<end
                
                var sub = str.substring(with: range)
                let rev = String(sub.characters.reversed())
                
                if(sub == rev ){
                    longestPalindrome += sub
                    //max = sub.characters.count
                }
            }
        }
        
        //print(max)
        return longestPalindrome
        
    }
}

print(Palindromes.shortestPalindrome(str: "abcd")!)
//print(Palindromes.longestPalindrome(str: "aba"))








