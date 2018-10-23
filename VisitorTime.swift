func secondsToHoursMinutes (_ seconds : Int) -> (Int, Int) {
    return (seconds / 3600, (seconds % 3600) / 60)
}

func sortVisitors() {

    let openTime = 25200
    let closeTime = 91800
    
    var timeRecords = [(String, Int, Int)]()
    //First Example
    timeRecords.append(("Amy",32400,43200 ))
    timeRecords.append(("Jeff",28800,46800 ))
    timeRecords.append(("Zack", 54000,57600))
    timeRecords.append(("Nathan",61200,62100))
    timeRecords.append(("Laura", 50400,57600))
    timeRecords.append(("Emma", 46800,52200))
    timeRecords.append(("Todd", 28800,30600))
    timeRecords.append(("Neil", 50400,59400))
    
    
     //Second example
//     timeRecords.append(("Todd", 28800, 30600))
//     timeRecords.append(("Amy",32400,43200))
//     timeRecords.append(("Jeff",39600,46800))
//     timeRecords.append(("Emma",46800,52200))
//     timeRecords.append(("Laura", 50400, 57600))
//     timeRecords.append(("Neil", 50400, 59400))
//     timeRecords.append(("Zack",54000,57600))
//     timeRecords.append(("Nathan",61200,63000))
    
    
    //print(timeRecords)
    
    //sort by arrival time
    print("After Sorting by Arrival Time ")
    let sortArrivalTime = timeRecords.sorted {  $0.1 < $1.1 }
    print(sortArrivalTime)
    
    print("Open Time \(secondsToHoursMinutes(openTime))")
    print("Close Time \(secondsToHoursMinutes(closeTime))")
    
    sortArrivalTime.forEach { (tuple) in
        print("\(tuple.0) = \(secondsToHoursMinutes(tuple.1)) : \(secondsToHoursMinutes(tuple.2))")
    }
    
    //construct the final Array
    var visitorTimeRecords = [(String, Int, Int)]()
    
    //Get the first visitor
    guard let firstVisitor = sortArrivalTime.first else { return }
    
    if firstVisitor.1 == openTime {
        visitorTimeRecords.append((firstVisitor.0, firstVisitor.1, firstVisitor.2))
    }else {
        visitorTimeRecords.append(("No visitor", openTime, firstVisitor.1))
    }
    
    //1. compare the previous tuple leave time with current tuple arrival time.
    //2. if previous leave time is less than the current leave time.
    //3. Add No visitor to that slot with previous tuple leave time and current tuple arrival time.
    //4. Then add the current tuple.
    
    sortArrivalTime.forEach { (tuple) in
        print("Current Tuple \(tuple)")
        
        guard let previousTuple = visitorTimeRecords.last else { return }
        
        print("Previous Tuple \(String(describing: previousTuple))")
        
        if previousTuple.2 < tuple.1 {
            visitorTimeRecords.append(("No visitor", previousTuple.2, tuple.1))
        }
        visitorTimeRecords.append((tuple.0, tuple.1, tuple.2))
    }
    
    //for last time till close time
    let lastTuple = visitorTimeRecords.last!
    
    if lastTuple.2 < closeTime {
        visitorTimeRecords.append(("No visitor", lastTuple.2, closeTime))
    }
    
    print(visitorTimeRecords)
}
