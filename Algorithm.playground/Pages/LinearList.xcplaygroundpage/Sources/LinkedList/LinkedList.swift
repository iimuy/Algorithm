import Foundation

//public class Node<Element: Equatable>: NSObject {
//    var elment: Element?
//    var prev: Node<Element>?
//    var next: Node<Element>?
//
//    public func Node(prev: Node<Element>, element: Element, next: Node<Element>) {
//        self.prev = prev
//        self.next = next
//        self.elment = element
//    }
//    public override var description: String{
//        var string: String = ""
//        if let prev = self.prev, let elment = prev.elment {
//            string.append("\(elment)")
//        }else{
//            string.append("null");
//        }
//        string.append("_")
//        if self.elment != nil {
//            string.append("\(String(describing: elment))")
//        }else{
//            string.append("null")
//        }
//        string.append("_")
//        if let next = self.next, let elment = next.elment {
//            string.append("\(elment)")
//        }else{
//            string.append("null");
//        }
//        return ""
//    }
//}

public class Node<Element: Equatable>: NSObject {
    var element: Element?
    var next: Node<Element>?
    public init(element: Element?, next: Node<Element>?) {
        self.element = element;
        self.next = next;
    }
}


public class LinkedList<Element: Equatable>: NSObject, LineaList {
    
    public typealias ItemType = Element
    public var size: Int
    
    private var first: Node<Element>?
    override public init() {
        self.size = 0
        super.init()
    }
    public func clear() {
        size = 0
        first = nil
    }
    
    public func get(atIndex index: Int) -> Element? {
        return node(atIndex: index)?.element
    }

    public func set(element: Element?, atIndex index: Int) -> Element? {
        let node = node(atIndex: index)
        let oldElement = node?.element
        node?.element = element
        return oldElement
    }
    
    
    public func add(element: Element?, atIndex index: Int) {
        if index == 0 {
            first = Node(element: element, next: first)
        }else{
            let prev = node(atIndex: index - 1)
            prev?.next = Node(element: element, next: prev?.next)
        }
        size += 1
    }

    
    public func remove(index: Int) -> Element? {
        var node = first
        if index == 0 {
            first = first?.next
        }else{
            let prev = self.node(atIndex: index - 1)
            node = prev?.next
            prev?.next = node?.next
        }
        size -= 1
        return node?.element
    }
    
    public func remove(element: Element?) -> Element? {
        var node = first
        var index = 0;
        while node != nil {
            if node?.element == element {
                return remove(index: index)
            }
            node = node?.next
            index += 1
        }
        return nil
    }
    
    public func indexOf(element: Element?) -> Int {
        var node = first
        for i in 0..<size {
            if node?.element == element {
                return i
            }
            node = node?.next
        }
        return default_not_found
    }
    
    
    /// 根据下标找到对应的节点
    /// - Parameter index: 下标
    /// - Returns: 返回对应的节点
    private func node(atIndex index: Int) -> Node<Element>? {
        rangeCheck(index: index)
        var node = first
        for _ in 0..<index {
            node = node?.next
        }
        return node
    }
    
}
