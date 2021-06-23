//: [Previous](@previous)

import Foundation

let arrayList: ArrayList = ArrayList(capaticy: 10)

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

//: [Next](@next)
