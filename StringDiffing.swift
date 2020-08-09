
func stringDiffing() {
  let foo = ["A","B","C","X"]
  let bar = ["A","B","C"]

  let diff = bar.difference(from: foo)

  var result = ""

  for update in diff {
      switch update {
      case .remove(let offset, let letter, let move):
          print("Removed \(letter) at idx \(offset) and moved to \(String(describing: move))")
          result += "\(letter)"
      case .insert(let offset, let letter, let move):
          print("Inserted \(letter) at idx \(offset) from \(String(describing: move))")
        result += "\(letter)"
      }
  }

  print(result)
}

stringDiffing()

/*
o/p: 

let foo = ["A","B","C","X"]
let bar = ["A","B","C"]

Removed X at idx 3 and moved to nil
X


let foo = ["A","B","C"]
let bar = ["A","B","C","X]

Insert X at idx 3 and moved to nil
X

*/
