//Tic tac Toe game


//We need a way to represent each of the board to make , so we will use Piece struct.
//It can be either X, O , E
enum Piece: String {
  case X = "X"
  case O = "O"
  case E = ""
  
  //This required for flipping from one player's tuen to other player turn after their move.
  var opposite: Piece {
    switch self {
      case .X : 
          return .X
      case .O:
          return .O
      case .E:
          return .E
    }
  }
}

//state of the board in one dimension array 

struct Board {
  typealias Move = Int
  let position: [Piece]  // state of the board in one dimensional array
  let turn:Piece   // playet turn 
  let lastMove: Move //
  
  init(position: [Piece] = [.E,.E,.E,.E,.E,.E,.E,.E,.E], turn: Piece = .X, lastMove : Int = -1) {
    self.position = position
    self.turn = turn 
    self.lastMove = lastMove
  }
  
  func move(_ location : Move ) -> Board {
    var tempPosition = position 
    tempPosition[location] = turn
    return Board(position: tempPosition, turn: turn.opposite, lastMove: location)
  }
  
  //Check for legal Move if it is an empty square and return the indxes of it.
  var legalMove: [Move]  {
    return position.indices.filter { position[$0] == .E }
  }
  
  //check for isWin 
  var isWin:Bool {
    return 
        position[0] == position[1] && position[0] == position[2] && position[0] != .E
    ||  position[3] == position[4] && position[3] == position[5] && position[3] != .E
    ||  position[6] == position[7] && position[6] == position[8] && position[6] != .E
    ||  position[0] == position[3] && position[0] == position[6] && position[0] != .E
    ||  position[1] == position[4] && position[1] == position[7] && position[1] != .E
    ||  position[2] == position[5] && position[2] == position[8] && position[2] != .E
    ||  position[2] == position[4] && position[2] == position[6] && position[2] != .E
  }
  
}

var winBoard:[Piece] = [.X, .X, .E, .E, .E, .E, .E, .E , .E]
var board = Board(position: winBoard)
print( board.isWin)

let newBoard = board.move(2)
print(newBoard)
print(newBoard.isWin)

//Reference: https://freecontent.manning.com/classic-computer-science-problems-in-swift-tic-tac-toe/
