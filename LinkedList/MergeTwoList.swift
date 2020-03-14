func mergeTwoListsandSorted(_ node1: Node? , _ node2: Node?) -> Node? {
    var l1 = node1
    var l2 = node2
    //create a dummy node and point the cur to it.
    let dummy:Node = Node()
    var cur = dummy
    
    while l1 != nil && l2 != nil  {
     // if list1 data is less than list2 data , point cur to list1 and increment the list1 to it's next link
     if l1!.data < l2!.data {
        cur.link = l1
        cur = l1!
        l1 = l1?.link
      } else {
        cur.link = l2
        cur = l2!
        l2 = l2?.link
      }
    }
    
    // if list2 becomes empty then all the list 1 is sorted make sure to point the curr to l1
    if l2 == nil {
        cur.link = l1
    } else {
        cur.link = l2
    }
    
    return dummy.link
  }
