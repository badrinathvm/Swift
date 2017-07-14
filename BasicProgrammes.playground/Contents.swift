//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// * Programme for checking Palindrome of a number.

struct Palindrome {
    
    func rev(n:Int) -> Bool {
        
        //Tuple declaration of variables
        var (rem, rev ,tmp) = (0,0,n)
        
        while( tmp > 0){
            
            //Race condition to check if it's more than the size of the int
            if tmp > Int.max/10 {
                return false
            }
            
            rem = tmp % 10
            rev = rev * 10 + rem
            tmp = tmp/10
        }
        
        return (rev == n)
    }
    
}

var pal = Palindrome()
pal.rev(n:525)

//* Progarmme for Merging two lists 

class Node{
    var value:Int
    var next: Node?
    
    //assign default along with initilization itself
    init(value:Int = 0 , next: Node? = nil) {
        self.value = value
        self.next = next
    }
    
 
}

class LinkedList<T> {
    
    var head:Node?
  
    func push(data:Int){
        //allocate node ad put data
        let node = Node(value:data)
        //point next of it's to head
        node.next = head
        head = node
    }
    
    func mergeLists(list1: Node?,list2: Node?) -> Node?{
        /*var l1:Node? = list1
        let l2:Node? = list2
        let l3:Node? = list1*/
        
        //Tuple 
        
        var (l1,l2,l3) = (list1,list2,list1)
    
        while( l1?.next != nil){
            l1 = l1?.next
        }
        
        l1?.next = l2
        return l3
    }
    
    func reversList(l: Node?) -> Node?{
 
        var prev:Node? = nil
        var cur:Node = l!
        var front:Node? = cur.next
        
        while(front != nil){
            cur.next = prev
            prev = cur
            cur = front!
            front = cur.next
        }
        
        cur.next = prev
        return cur
    }
}

extension Node: CustomStringConvertible {
    
    public var description: String{
        return ""
    }
    
    func disp(n: Node?) -> String{
        var text = ""
        var node = n
        
        while node != nil {
            text += "\(node!.value)"
            node = node?.next
            if node != nil {
                text += "--->"
            }
        }
        return text
    }
}


var list1 = LinkedList<String>()
list1.push(data: 10)
list1.push(data: 20)
list1.push(data: 30)

var node:Node = Node()

print("First List: " + node.disp(n: list1.head),terminator:"\n")

var list2 = LinkedList<String>()
list2.push(data: 40)
list2.push(data: 50)
list2.push(data: 60)

print("Second List: " + node.disp(n: list2.head),terminator:"\n")

var result = LinkedList<Int>().mergeLists(list1: list1.head, list2: list2.head)

print("Result is : " + node.disp(n: result))


// Reversal of list 

var list3 = LinkedList<String>()
list3.push(data: 1)
list3.push(data: 2)
list3.push(data: 3)
list3.push(data: 4)

print("Before Reversal :" + node.disp(n:list3.head))

var revList = LinkedList<Int>().reversList(l: (list3.head))
print("Reversed List is : " + node.disp(n: revList))


/*  >>>>>>> Programm to remove duplicates in an array and find the count of it >>>>>>> */

struct Remove_Duplicates{
    
    func remove(ar: [Int]) -> Int{
        var arr = ar
        arr = sort(array: &arr)
        var index:Int = 1
        
        if arr.count < 2 {
            return arr.count
        }
        
        for i in 1..<arr.count{
            if ( arr[i] != arr[i-1]){
                //arr[index] = arr[i]
                index += 1
            }
        }
    
        return index
    }
    
    func sort(array: inout [Int]) -> [Int]{
        
        var temp:Int = 0
        
        for _ in stride(from: array.count, to: 0, by: -1) {
            for i in 0..<array.count-1{
                if array[i] > array[i+1]{
                    temp = array[i]
                    array[i] = array[i+1]
                    array[i+1] = temp
                }
            }
        }
        return array
    }
    
    
    
   }

var remove = Remove_Duplicates()
print("Length is \( remove.remove(ar: [2,3,2,3,4,4]))")


/* >>>>>  Program to add Zeros in front of the array >>>>>>>>>> */


struct AddZeros{
    
    func addZerosEnd(zeroArray: inout [Int]) -> [Int]{
        
        var counter:Int = 0
        for i in 0..<zeroArray.count{
            if( zeroArray[i] != 0){
                zeroArray[counter] = zeroArray[i]
                counter += 1
            }
        }
        
        while (counter < zeroArray.count){
            zeroArray[counter] = 0
            counter += 1
        }

        return zeroArray
    }
    
    func addZerosBeginning(zeroArray: inout [Int]) -> [Int]{
        
        var counter:Int = zeroArray.count - 1
        
        for i in stride(from: zeroArray.count - 1, to: -1, by: -1){
            if( zeroArray[i] != 0 ){
                zeroArray[counter] = zeroArray[i]
                counter -= 1
            }
        }
        
        while(counter >= 0){
            zeroArray[counter] = 0
            counter -= 1
        }
        
        return zeroArray
    }
    
}

var addZero = AddZeros()
var zeroArray:[Int] =  [14,0,5,3,0]
print(">>>> Ending with Zeros >>>>>")
print(addZero.addZerosEnd(zeroArray: &zeroArray))
print(">>>> Begginging with Zeros >>>>>>")
print(addZero.addZerosBeginning(zeroArray: &zeroArray))


/**  >>> Program for reversing the string >>> */

struct ReverseString{
    
    func reverString(str: String){
        var s = str.characters.map {$0}
        
        print(">>>> Reversal of String >>>>>")
        for i in stride(from: s.count - 1, to: -1, by: -1){
            print(s[i], terminator:"")
        }
    }
}

ReverseString().reverString(str:"swift")
print()

/** Find Duplicates in a String  ***/

struct FindDuplicates{
    
    func findDuplicates(str: String) -> [Character:Int]{
        
        var resultDict:[Character:Int] = [:]
        var filteredDict:[Character:Int] = [:]
        
        var s = str.characters.map {$0}
        
        for i in 0..<str.characters.count{
            let val = s[i]
            if (resultDict.keys.contains(val)){
                resultDict[val] = resultDict[val]! + 1
            }else{
                resultDict[val] = 1
            }
        }
        
        print(resultDict)
        
        for (key,value ) in resultDict{
            if value > 1 {
                filteredDict[key] = value
            }
        }
        
        return filteredDict
    }
}

print(">>>>>> Count of each character >>>>>>", terminator: "\n")
print(FindDuplicates().findDuplicates(str: "Swifttt"))


/* >>>> Program for grouping Anagrams */


extension String {
    var asciiArray: [UInt32] {
        return unicodeScalars.filter{$0.isASCII}.map{$0.value}
    }
}
extension Character {
    var asciiValue: UInt32? {
        return String(self).unicodeScalars.filter{$0.isASCII}.first?.value
    }
}


   class GroupAnagrams{
   

    
    func groupAnagrams(strList: [String]){
        
        
        var map:[String:[String]] = [:]
        for str in strList{
            //print(str)
            
            /*var charArray = [Character?](repeating: nil, count: 26)
            
            for i in 0..<s.count{
                charArray[(s[i].asciiValue)! - (Character("a").asciiValue)!]++
            }*/
 
            var s = str.characters.map { $0 }
            
            var frequencies = [Int](repeating: 0, count: 26)
            for c in str.unicodeScalars {
                switch c {
                case "a"..."z":
                    frequencies[Int(c.value - UnicodeScalar("a").value)] += 1
                    //print(frequencies[Int(c.value - UnicodeScalar("a").value)] += 1)
                default:
                    break // ignore all other characters
                }
            }
        
            
            var st = frequencies
            
            
            
        
        }
        
    }
}

GroupAnagrams().groupAnagrams(strList : ["str","rts","dad","ads"] )







