
/*  
 1. Find the center or highest number closet to it.
 2. Set the carrot count to zero initially and increment it.
 3. Find the square next to it with highest number ( made use of dictionary to dump [key, (row,column)] extract the key with highest value.
 4. Repeat step 2 until it there are no adjacent squares other than 0's
 5. Break loop, return carrot count */
 
 class CarrotSearch {
    
    var squareMatrix:[[Int]]
    var currentRow = 0
    var currentColumn = 0
    var rabbitSleep = false
    var carrotCount = 0
    
    init(matrix: [[Int]]) {
        self.squareMatrix = matrix
    }
    
    //returns the closet ones if size is even, middle indices if the size is odd.
    func findPossibleCenters(size: Int) -> [Int] {
       return size%2 == 0 ?  [size/2 - 1 ,size/2 ] : [size/2 ]
    }
    
    //Determines possible start positions, dump them in to dictionary to highest key's row and column.
    func determineCenterPosition(rows: [Int], columns: [Int]) {
        var dict:[Int:[Int]] = [:]
        
        //dump the row colums for the rows and columns of possible centers
        rows.forEach { row in
            columns.forEach { column in
                let element = squareMatrix[row][column]
                dict[element] = [row,column]
            }
        }
        
        //Fetch the highest key's row and column values
        highestValues(dict)
    }
    
    func highestValues(_ dict : [Int: [Int]]) {
        //sort based on the higehest key
        let sortedDict = dict.sorted { $0.0 < $1.0 }
        
        guard let values = sortedDict.last?.value else {
           print("Unable to get last value")
           return
        }
        
        currentRow = values.first!
        currentColumn = values.last!
    }
    
    // 1.Increments the carrot count,
    // 2.set value of the square to zero,
    // 3.If rabbit can move to other 0-squares , fall asleep.
    func eatCarrot() {
        let square = squareMatrix[currentRow][currentColumn]
        if square == 0 {
            rabbitSleep = true
            return
        }
        carrotCount += square
        squareMatrix[currentRow][currentColumn] = 0
    }
    
    //1. Calculate the all possible movies of rabbit up/down/left/right,
    //2. Dump in dictionary for each move and then fid the highest of it.
    func possibleMovements() {
        let row = currentRow
        let column = currentColumn
        var dict:[Int: [Int]] = [:]
        
        //move to next row
        if row + 1 <= squareMatrix.count {
            let element = squareMatrix[row + 1][column]
            dict[element] = [row+1, column]
        }
        
        //move to row behind ( previous )
        if row - 1 >= 0  {
            let element = squareMatrix[row - 1][column]
            dict[element] = [row - 1, column]
        }
        
        //move to next column
        if column + 1 <= squareMatrix[0].count {
            let element = squareMatrix[row][column + 1]
            dict[element] = [row, column + 1]
        }
        
        //move to previous column
        if column - 1 >= 0  {
            let element = squareMatrix[row][column - 1]
            dict[element] = [row , column - 1]
        }
        
        // Fetch the highest key's row and column values
        highestValues(dict)
    }
    
    func fetchCarrotCount() -> Int {
        //Identify the possible centers based on the size of the matrix
        let startRows = findPossibleCenters(size: squareMatrix.count)
        let startColumns = findPossibleCenters(size: squareMatrix[0].count)
        
        determineCenterPosition(rows: startRows, columns: startColumns)
        
        //continue as long as the rabbit is asleep.
        while !rabbitSleep{
            eatCarrot()
            possibleMovements()
        }
        
        print("Carrot Count is \(carrotCount)")
        
        return carrotCount
    }
}

let matrix = [
            [5, 7, 8, 6, 3],
            [0, 0, 7, 0, 4],
            [4, 6, 3, 4, 9],
            [3, 1, 0, 5, 8]
        ]
        
        let carrot = CarrotSearch(matrix: matrix)
        let carrotCount = carrot.fetchCarrotCount()
        print(carrotCount)
 
 
