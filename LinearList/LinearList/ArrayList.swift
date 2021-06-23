//
//  ArrayList.swift
//  LinearList
//
//  Created by 李忠 on 2021/6/22.
//

import Cocoa

class ArrayList: NSObject {
    
    /// 存储的元素数量
    private var size: Int = 0
    /// 存储数据的数组
    private var elements: [Int]
    /// 默认数组容量
    private final let default_capacity = 10
    /// 未发现元素标识
    private final let default_not_found = -1
    
    override init() {
        self.elements = Array(repeating: 0, count: default_capacity)
        super.init()
    }
    init(capaticy: Int) {
        let tmpCapaticy = capaticy < default_capacity ? default_capacity : capaticy
        elements = Array(repeating: 0, count: tmpCapaticy)
        super.init()
    }
    
    /// 清空数组
    public func clear() {
        size = 0
    }
    
    /// 数组元素数量
    public func count() -> Int {
        return size
    }
    
    /// 数组是否为空
    /// - Returns: ture: 空，false: 不为空
    public func isEmpty() -> Bool {
        return size == 0
    }
    
    /// 数组是否包含某个元素
    /// - Parameter element: 查找的元素
    /// - Returns: true: 找到, false: 未找到
    public func contains(element: Int) -> Bool {
        return indexOf(element: element) != default_not_found
    }
    
    /// 添加元素到数组尾部
    /// - Parameter element: 元素
    public func add(element: Int) {
        insert(element: element, atIndex: size)
    }
    
    /// 插入元素到数组指定下表
    /// - Parameters:
    ///   - element: 元素
    ///   - index: 下表
    public func insert(element: Int,atIndex index: Int) {
        
        rangeCheckForInsert(index: index)
        ensureCapacity(capacity: size+1)
        var i: Int = size
        while i > index + 1 {
            elements[i] = elements[i-1]
            i -= 1
        }
        elements[index] = element
        size += 1
    }
    
    /// 指定index 设置元素
    /// - Parameters:
    ///   - element: 新的元素
    ///   - index: 下表
    /// - Returns: 返回老的值
    public func set(element: Int, atIndex index: Int) -> Int {
        rangeCheck(index: index)
        let oldElement: Int = elements[index]
        elements[index] = element
        return oldElement
    }
    
    /// 获取对应下表的元素
    /// - Parameter index: 下表
    /// - Returns: 返回元素
    public func get(atIndex index: Int) -> Int{
        rangeCheck(index: index)
        for (i, element) in elements.enumerated() {
            if index == i  {
                return element
            }
        }
        return default_not_found
    }
    
    /// 删除指定下标的元素
    /// - Parameter index: 下标
    /// - Returns: 元素
    public func remove(index: Int) -> Int {
        rangeCheck(index: index)
        let oldElement = elements[index]
        for i in index..<size {
            elements[i] = elements[i+1]
        }
        size -= 1
        return oldElement
    }
    
    /// 查找元素下表，返回第一个被查到的下表
    /// - Parameter element: 查找的元素
    /// - Returns: -1 未找到，
    public func indexOf(element: Int) -> Int {
        /// 遍历数组，index下表，tmpElement元素
        for (index, tmpElement) in elements.enumerated() {
            if tmpElement == element {
                return index
            }
        }
        return default_not_found
    }
    
    /// 检查下标是否越界
    /// - Parameter index: 下标
    private func rangeCheck(index: Int) {
        if index < 0 || index >= size {
            outOfBounds(index: index)
        }
    }
    /// 添加元素抛出的异常
    /// - Parameter index: 添加元素的下标
    private func rangeCheckForInsert(index: Int) {
        if index < 0 || index > size {
            outOfBounds(index: index)
        }
    }
    private func outOfBounds(index: Int) {
        assert(false, "数组越界 index:\(index), size:\(size)")
    }
    
    /// 保证要有capacity的容量
    /// - Parameter capacity: 容量
    private func ensureCapacity(capacity: Int) {
        let oldCapacity: Int = elements.count
        /// 如果旧的小于等于新的，不进行扩容
        if oldCapacity <= capacity {
            return
        }
        /// 新容量为旧容量的1.5倍
        let newCapacity: Int = oldCapacity + (oldCapacity >> 1)
        /// 数组元素拷贝到新数组里
        var newElements:[Int] = Array(repeating: 0, count: newCapacity)
        for (index, element) in elements.enumerated() {
            newElements[index] = element
        }
        elements = newElements
    }
    
    override var description: String {
        var tmpString : String = "["
        for index in 0..<size {
            if index != 0 {
                tmpString.append(",")
            }
            tmpString.append("\(elements[index])")
        }
        tmpString.append("]")
        return tmpString
    }
}
