// This is a sandbox to experiment with CoderPad's execution capabilities.
// It's a temporary, throw-away session only visible to you.

import Foundation


class Queue<T> {
  
  var arr = [T]()
  
  func add(_ item : T) {
    arr.append(item)
  }
  
}

enum Direction {
  case up , down 
}

enum State {
  case moving , stopped
}

enum Door {
  case opened , closed
}


class Request {
  var time:Int
  var floor:Int
  var direction:Direction
  
  init(time: Int, floor:Int , direction: Direction) {
    self.time = time
    self.floor = floor
    self.direction = direction
  }
}

class Elevator {
  var location:Int = 0
  var state: State = .stopped
  var direction: Direction = .up
  var door:Door = .closed
  
  //have queue for up , down and current queue
  var upQueue = Queue<Request>()
  var downQueue = Queue<Request>()
  var currentQueue = Queue<Request>()
  
  //Have call method
  func go(to floor:Int , direction: Direction ) {
    let request = Request(time: 10, floor: floor, direction: direction)
    
    switch direction {
       case .up: 
           if floor >= location {
              currentQueue.add(request)
            }else {
              upQueue.add(request)
          }
      
      case .down:
         if floor <= location {
           currentQueue.add(request)
         }else{
           downQueue.add(request)
         }
    }
  }
  
}
