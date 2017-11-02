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





