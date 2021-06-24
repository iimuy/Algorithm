//: [Previous](@previous)

import Foundation

func intArray(){
    
    let arrayList: ArrayList<Int> = ArrayList(capaticy: 10)

    //
    arrayList.add(element: 1)
    arrayList.add(element: 2)

    print("初始数组: \(arrayList)")

    let _ = arrayList.remove(index: arrayList.count()-1)
    print("移除最后一个 :\(arrayList)")

    arrayList.clear()
    print("清除数组: \(arrayList)")


    arrayList.add(element: 11)
    print("添加下标11: \(arrayList)")

    let _ = arrayList.remove(index: 0)
    print("移除下标0:\(arrayList)")
}

func personArray(){
    
    let arrayList: ArrayList<Person> = ArrayList(capaticy: 10)
    let person01 = Person.init(name: "大山", age: 10)
    let person02 = Person.init(name: "大山11", age: 12)
    
    //
    arrayList.add(element: person01)
    arrayList.add(element: person02)
    arrayList.add(element: nil)
    print("初始数组: \(arrayList)")
    
    print("获取最后一个元素 :\(String(describing: arrayList.get(atIndex: 2)))")
//
    let _ = arrayList.remove(index: arrayList.count()-1)
    print("移除最后一个 :\(arrayList)")

    arrayList.clear()
    print("清除数组: \(arrayList)")


    arrayList.add(element: person01)
    print("添加下标11: \(arrayList)")

    let _ = arrayList.remove(index: 0)
    print("移除下标0:\(arrayList)")
}
personArray()
//: [Next](@next)
