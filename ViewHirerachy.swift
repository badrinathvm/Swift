class UIView {
  var name: String
  
  init(_ name: String) {
    self.name = name
  }
  
  var description: String {
    return name
  }
  
  var subViews = [UIView]()
  
  func addSubView(_ view: UIView) {
    self.subViews.append(view)
  }
}

var myView = UIView("UIView")
var collectionView = UIView("UICollectionView")

let cell1 = UIView("UICollectionViewCell")
collectionView.addSubView(cell1)

let cell2 = UIView("UICollectionViewCell")
collectionView.addSubView(cell2)

var label = UIView("UILabel")
cell2.addSubView(label)

myView.addSubView(collectionView)


enum BadError: Error {
  case badError
}

func printHeight(view: UIView? , height: Int) throws {
  
  guard let view = view else { throw BadError.badError }
  
  //base case
  var output = view.description
  for _ in 0..<height {
    output = "|" + output
  }
  
  print(output)
  
  //recursive case
  try view.subViews.forEach { view in 
   try printHeight(view: view, height: height + 1) 
  }
}

do {
  try printHeight(view: myView, height: 0)
  try printHeight(view: UIView("emptyView"), height: 0)
  try printHeight(view: nil, height: 0)
} catch {
  print("Bad Error")
}
