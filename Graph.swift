import Foundation

    class Node {

      var key:String?
      var neighbors: Array<Edge>

      init() {
        self.neighbors = Array<Edge>()
      }

  }

  class Edge {
      var neighbor: Node
      var weight: Int

      init() {
        weight = 0
        self.neighbor = Node()
      }
  }

public class Graph {
  
  var canvas:Array<Node>
  var isDirected:Bool
  
  init() {
    canvas = Array<Node>()
    isDirected = true
  }
  
   //create a new vertex
    func addNode(key: String) -> Node {
                
        //set the key
        let childNode = Node()
        childNode.key = key

        //add the vertex to the graph canvas
        canvas.append(childNode)
               
        return childNode
    }
  
   func addEdge(source:Node, neighbor:Node, weight: Int){
     let newEdge = Edge()
     newEdge.neighbor = neighbor
     newEdge.weight = weight
     source.neighbors.append(newEdge)
     
    //check for undirected graph
      if (isDirected == false) {
            
        //create a new reversed edge
        let reverseEdge = Edge()
            
        //establish the reversed properties
        reverseEdge.neighbor = source
        reverseEdge.weight = weight
        neighbor.neighbors.append(reverseEdge)               
      }
   }
  
  
   func bfs(node: Node, size: Int) {
     
    var visited: Array<Bool> = Array(repeating: false, count: size)
     
    //this is used for storing nodes in tree order traversal
    var queue:[Node] = []
     
     let index = Int(node.key!)!
     visited[index] = true
     queue.append(node)
     
     while !queue.isEmpty {
       
        let tempNode = queue.removeFirst()
        print(tempNode.key!)
       
        //Get the adjacent nodes
        let adjacents = tempNode.neighbors
       
        adjacents.forEach {
          let index = Int($0.neighbor.key!)!
          if !visited[index] {
             visited[index] = true
             queue.append($0.neighbor)
          }
        }
        
     }
   }
  
  
  func dfsUtil(node:Node, visited: inout [Bool]) {
    
        // Mark the current node as visited and print it
        let key = Int(node.key!)!
        visited[key] = true
        print(key)
    
        //Get the adjacent nodes
        let adjacents = node.neighbors
       
       adjacents.forEach {
          let index = Int($0.neighbor.key!)!
         if !visited[index] {
           dfsUtil(node: $0.neighbor, visited: &visited)
         }
       }
  }
  
  func dfs(node: Node, size: Int) {
    
     var visited: Array<Bool> = Array(repeating: false, count: size)
     
    dfsUtil(node: node, visited: &visited)
  }
    
  func isCyclicUtil(_ node: Node, _ visited: inout [Bool] , _ recStack : inout [Bool])
  -> Bool {
    
    let nodeValue = Int((node.key)!)!
    
    //print(nodeValue)
    
    if visited[nodeValue] == false {
      
      visited[nodeValue] = true
      recStack[nodeValue] = true
      
      //Get the adjacent nodes
      let adjacents = node.neighbors
       
      for node in adjacents {
         let index = Int(node.neighbor.key!)!
         
         if !visited[index] && isCyclicUtil(node.neighbor,&visited,&recStack) {
            return true
         }else if recStack[index] {
            return true
         }
      }
    }
    recStack[index] = false //Remove vertex from recursion array
    return false
  }
    
   func isCyclic(canvas: Array<Node>) -> Bool {
    
    var status  = false
    var visited: [Bool] = Array(repeating: false , count: canvas.count)
    var recStack: [Bool] = Array(repeating: false, count: canvas.count)
    
     canvas.forEach {
       if isCyclicUtil($0,&visited,&recStack) {
          status = true
       }
     }
    
    return status
   }
    
    
     func bfs() {

      //Logic: 

      // enqueue starting vertex & print, add it to the queue & make it visited.
      // while ( queue is not empty ) {
      //   let p = dequeue ( take the first element from the queue)
      //   Get all their neignbhors  let adjacents = p.neighbors
      //   iterate over the neighbors if unvisited , make it visisted and add it to the queue
      // }

    }


    func dfs() {
      //Logic:

      //Mark the current node as visited and print it 
      // Get the neigbhors i.e., let adjacents = p.neighbors
      // iterate over the neighbhors 
      // if unvisited, perform dfs again on their neighbors

    }
}

var graph = Graph()
var zero = graph.addNode(key: "0")
var first = graph.addNode(key: "1")
var second = graph.addNode(key: "2")
var third = graph.addNode(key: "3")

graph.addEdge(source:zero, neighbor: first, weight:0)
graph.addEdge(source:zero, neighbor: second, weight:0)

graph.addEdge(source:first, neighbor: second, weight:0)
graph.addEdge(source:second, neighbor: zero, weight:0)

graph.addEdge(source:second, neighbor: third, weight:0)
graph.addEdge(source:third, neighbor: third, weight:0)

print("BFS")
graph.bfs(node: second, size: graph.canvas.count)  //2,0,3,1

print("DFS")
graph.dfs(node: second, size: graph.canvas.count) //2,0,1,3

let cycleStatus = graph.isCyclic(canvas: graph.canvas)
print("Cyclic Detection : \(cycleStatus)")
