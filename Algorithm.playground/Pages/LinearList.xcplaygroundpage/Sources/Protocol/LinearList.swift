import Foundation

public protocol LineaList  {
    //关联类型
    associatedtype ItemType
    /// 存储的元素数量
    var size: Int {get set}
    /// 未发现元素标识
    var default_not_found: Int {get}
    
    /// 清空数组
    func clear()
    
    /// 数组是否为空
    /// - Returns: ture: 空，false: 不为空
    func isEmpty() -> Bool
    
    /// 数组是否包含某个元素
    /// - Parameter element: 查找的元素
    /// - Returns: true: 找到, false: 未找到
    func contains(element: ItemType?) -> Bool
    
    /// 添加元素到数组尾部
    /// - Parameter element: 元素
    func add(element: ItemType?)
    
    /// 插入元素到数组指定下表
    /// - Parameters:
    ///   - element: 元素
    ///   - index: 下表
    func add(element: ItemType?,atIndex index: Int)
    
    /// 指定index 设置元素
    /// - Parameters:
    ///   - element: 新的元素
    ///   - index: 下表
    /// - Returns: 返回老的值
    func set(element: ItemType?, atIndex index: Int) -> ItemType?
    
    /// 获取对应下表的元素
    /// - Parameter index: 下表
    /// - Returns: 返回元素
   func get(atIndex index: Int) -> ItemType?
    
    /// 删除指定下标的元素
    /// - Parameter index: 下标
    /// - Returns: 返回被删除的元素
    func remove(index: Int) -> ItemType?
    
    /// 删除指定元素
    /// - Parameter element: 元素
    func remove(element: ItemType?) -> ItemType?
    
    /// 查找元素下表，返回第一个被查到的下表
    /// - Parameter element: 查找的元素
    /// - Returns: 返回对应元素的下表，-1 表示未找到，
    func indexOf(element: ItemType?) -> Int
    
    /// 检查下标是否越界
    /// - Parameter index: 下标
    func rangeCheck(index: Int)
    
    /// 添加元素抛出的异常
    /// - Parameter index: 添加元素的下标
    func rangeCheckForAdd(index: Int)
    
    /// 元素越界断言
    /// - Parameter index: 越界的下标
    func outOfBounds(index: Int)
}
/// 提供默认实现
extension LineaList {
    
    public var default_not_found: Int {
        return -1
    }
    public func isEmpty() -> Bool {
        return size == 0
    }
    
    public func contains(element: ItemType?) -> Bool {
        return indexOf(element: element) != default_not_found
    }
    public func add(element: ItemType?) {
        add(element: element, atIndex: size)
    }
    
    /// 检查下标是否越界
    /// - Parameter indepublic x: 下标
    public func rangeCheck(index: Int) {
        if index < 0 || index >= size {
            outOfBounds(index: index)
        }
    }
    /// 添加元素抛出的异常
    /// - Parameter index: 添加public 元素的下标
    public func rangeCheckForAdd(index: Int) {
        if index < 0 || index > size {
            outOfBounds(index: index)
        }
    }
    public func outOfBounds(index: Int) {
        assert(false, "数组越界 index:\(index), size:\(size)")
    }
}
