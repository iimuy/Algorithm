import Foundation

public func textlinked01<Linked : LinearList>(list: Linked) {
    
    list.add(element: 11 as? Linked.ItemType)
    list.add(element: 22 as? Linked.ItemType)
    list.add(element: 33 as? Linked.ItemType)
    list.add(element: 44 as? Linked.ItemType)
    
    list.add(element: 55 as? Linked.ItemType, atIndex: 0) // [55, 11, 22, 33, 44]
    list.add(element: 66 as? Linked.ItemType, atIndex: 2) // [55, 11, 66, 22, 33, 44]
    list.add(element: 77 as? Linked.ItemType, atIndex: list.size) // [55, 11, 66, 22, 33, 44, 77]
    
    let _ = list.remove(index: 0) // [11, 66, 22, 33, 44, 77]
    let _ = list.remove(index: 2) // [11, 66, 33, 44, 77]
    let _ = list.remove(index: list.size - 1) // [11, 66, 33, 44]
    
    assert(list.indexOf(element: 44 as? Linked.ItemType) == 3)
    assert(list.indexOf(element: 22 as? Linked.ItemType) == list.default_not_found)
    assert(list.contains(element: 33 as? Linked.ItemType))
    assert(list.get(atIndex: 0) as! Int == 11)
    assert(list.get(atIndex: 1) as! Int == 66)
    assert(list.get(atIndex: list.size - 1) as! Int == 44)
    print("\(list)")
}

