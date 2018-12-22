//Logic : 

// If minimum element is not at middle (neither mid nor mid + 1), then minimum element lies in either left half or right half.

func findMin(_ arr: inout [Int], _ low: Int, _ high: Int) -> Int {
  
  //calculate mid
  let mid  = low +  ( high - low ) / 2
  
  //check if mid +1 is minimum element
  if mid < high && arr[mid+1] < arr[mid] {
    return arr[mid+1]
  }
  
  //check mid element
  if (mid > low && arr[mid] < arr[mid-1]) {
    return arr[mid]
  }
  
  
  if arr[high] > arr[mid] {
    return findMin(&arr, low, mid - 1)
  }else{
    return findMin(&arr, mid + 1, high)
  }
  
}

var arr = [5, 6, 1, 2, 3, 4]

let element = findMin(&arr, 0 , arr.count - 1)
print(element)
