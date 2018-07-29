
//Explantaion : If prefix sum repeates then there is Sum 0

/*In the below example 

15,13,0,7,8,15,25,48

1. Either a prefix repeats 
2.prefix sum becomes zero

here there are two 15's, we have sub array of sum 0
$0.0ffset will give the count(max length) */


func subArrayWithZero() {
  
  var arr = [15, -2, 2, -8, 1, 7, 10, 23]
  var sum = 0 
  var maxLength = 0
  var dict:[Int:Int] = [:]
  arr.enumerated().forEach {

    sum += $0.element

    if sum == 0 {
      maxLength = $0.offset + 1
    }

    if $0.element == 0 && maxLength == 0 {
      maxLength = 1
    }

    //check if sum exists in dictionary
    if let result = dict.index(where: { $0.0 == sum } ) {
        maxLength = max(maxLength, $0.offset )
    }else{
       print("sum \(sum) index \($0.offset)")
       dict[sum] = $0.offset
    }
  }

    print(dict)
    print(maxLength)

}
