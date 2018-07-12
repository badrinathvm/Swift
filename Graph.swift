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

graph.canvas.forEach {
  print($0.key!)
}
