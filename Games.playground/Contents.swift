//: Playground - noun: a place where people can play

import UIKit
import Foundation

class Games {
    
    func snakeLadder(diceRol: Int) {
        
        var diceRol = diceRol
        let finalSquare = 25
        var board = [Int](repeating: 0 , count:finalSquare + 1)
        
        //set up the board
        board[03] = +08
        board[06] = +11
        board[09] = +09
        board[10] = +02
        board[14] = -10
        board[19] = -11
        board[22] = -02
        board[24] = -08
        
        var square = 0
        
        repeat{
            //move up or down
            square += board[square]
            
            //roll the dice
            diceRol += 1
            
            if( diceRol == 7 ){
                diceRol = 1
            }
            
            //move or scroll down the ladder
            square += diceRol
            print("square is at position \(square)")
            
        }while(square < finalSquare)
        
        print("Game Over")
    }
}

var game = Games()
game.snakeLadder(diceRol: 7)


class Bingo{
    
    let boardSize = 20
    
    var bingoBoard = [Int](repeating:-1,count: 20)
    
    func setUpBoard(){
        //setup board
        bingoBoard[4] = 2
        bingoBoard[2] = 21
        bingoBoard[7] = 32
        bingoBoard[9] = 13
        bingoBoard[15] = 33
        bingoBoard[16] = 5
        bingoBoard[18] = 25
    }
    
    func announceNumber(_ n: Int){
        
        if(bingoBoard.contains(n)){
            let index = bingoBoard.index(of: n)
            bingoBoard[index!] = -1
        }
    }
    
    func bingoOrNot() -> String{
        
        return bingoBoard.filter { $0 == -1}.count == boardSize ? "Bingo !!!!!" : "No Bingo Better Luck Next Time!!"
        
    }
    
}


var bingo = Bingo()

bingo.setUpBoard()

//Success Set
bingo.announceNumber(21)
bingo.announceNumber(2)
bingo.announceNumber(32)
bingo.announceNumber(33)
bingo.announceNumber(13)
bingo.announceNumber(5)
bingo.announceNumber(25)

print(bingo.bingoOrNot())

bingo.setUpBoard()

bingo.announceNumber(21)
bingo.announceNumber(2)
bingo.announceNumber(32)
bingo.announceNumber(33)
bingo.announceNumber(13)
bingo.announceNumber(5)
bingo.announceNumber(26)

print(bingo.bingoOrNot())

for i in 1...7{
    let n = Int(arc4random_uniform(35))
    bingo.announceNumber(n)
}

print(bingo.bingoOrNot())


func searchIn2D(){
    
    var arr = [
        [1,   3,  5,  7],
        [10, 11, 16, 20],
        [23, 30, 34, 50]
    ]
    
    var n = 3
    
    arr.enumerated().forEach { (i, val) in
        for j in 0..<arr[i].count{
            if( arr[i][j] == n){
                print("Element Found")
                break
            }
        }
    }
    
}

searchIn2D()


let x = "CAT"
let y = ["CAT", "BAT", "COT", "COG", "COW", "RAT", "BUT", "CUT", "DOG", "WEB" ]
let z = "DOG"

var list = [String]()

y.forEach{ val in
    //difference between two words
    let difference = zip(x.characters, val.characters).filter { $0 != $1 }.count==1
    if( difference){
        list.append(val)
    }
}

print(list)

var list1 = [String]()

//combine start word with each of the combination
list.forEach { listElem in
    y.forEach { ele in
        
        let diff = zip(listElem.characters,ele.characters).filter { $0 != $1  }.count==1
        
        if(ele.first == listElem.first){
            list1.append(ele)
        }
        
    }
}

print(Set(list1.sorted()))

let diffArray = Set(list).symmetricDifference(Set(list1.sorted()))

//print(Set(list).subtracting(Set(list1.sorted())))

let groupDict = Dictionary(grouping: diffArray) { $0.characters.first!}

print(groupDict)

let filtDict = Dictionary(grouping: y) { $0.characters.first!}

let newDict = filtDict.mapValues { $0.map { $0 }.sorted { $0 < $1 } }

print(newDict)


func wipLadder(){
    
    let x = "CAT"
    let y = ["CAT", "BAT", "COT", "COG", "COW", "RAT", "BUT", "CUT", "DOG", "WEB" ]
    let z = "DOG"
    
    var list = [String]()
    
    
    //let difference = zip(x.characters, val.characters).filter { $0 != $1 }
    
    y.forEach{ val in
        //difference between two words
        let difference = zip(x.characters, val.characters).filter { $0 != $1 }.count==1
        
        if( difference){
            list.append(val)
        }
    }
    
    print(list)
    
    var list1 = [String]()
    
    //combine start word with each of the combination
    list.forEach { listElem in
        y.forEach { ele in
            
            let diff = zip(listElem.characters,ele.characters).filter { $0 != $1  }.count==1
            
            if(ele.first == listElem.first){
                list1.append(ele)
            }
            
        }
    }
    
    print(Set(list1.sorted()))
    
    let diffArray = Set(list).symmetricDifference(Set(list1.sorted()))
    
    //print(Set(list).subtracting(Set(list1.sorted())))
    
    let groupDict = Dictionary(grouping: diffArray) { $0.characters.first!}
    
    print(groupDict)
    
    
    
    let filtDict = Dictionary(grouping: y) { $0.characters.first!}
    
    let newDict = filtDict.mapValues { $0.map { $0 }.sorted { $0 < $1 } }
    
    print(newDict)
    
    
    var s = "aaabbcc"
    
    print(s.flatMap{ $0 })
}



//with protocols and Extensions 

protocol Game {
  static func setupBoard() -> [Int]
}


extension SnakeLadder: Game {
  
  static func setupBoard() -> [Int] {
    
    let finalSquare = 25
    
    var board:[Int] = Array(repeating: 0, count: finalSquare + 1)
    
      board[03] = +08
      board[06] = +11
      board[09] = +09
      board[10] = +02
      board[14] = -10
      board[19] = -11
      board[22] = -02
      board[24] = -08
    
    return board
  }
  
}


class SnakeLadder {
    
  func dice(_ n : Int){
    
     var diceRol = n
     let finalSquare = 25
     var square = 0
    
     var board = SnakeLadder.setupBoard()
    
     repeat{
       
       //move up or down 
       square += board[square]
       
       //roll the dice 
        diceRol += 1
       
       if diceRol == 7{
          diceRol = 1
       }
       
       square += diceRol
       
       print("square is at position \(square)")
       
     }while(square < finalSquare)
      
    print("Game Over")
  }
  
}


var game = SnakeLadder()
game.dice(7)

