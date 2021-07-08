import Foundation

public class Node<Element: Equatable>: NSObject {
    var element: Element?
    var next: Node<Element>?
    public init(element: Element?, next: Node<Element>?) {
        self.element = element;
        self.next = next;
    }
    public override var description: String {
        guard let tmpElement = element else {
            return "nil"
        }
        return "\(tmpElement)"
    }
}

public class SingleLinkedList<Element: Equatable>: NSObject, LinearList {
    
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
        rangeCheckForAdd(index: index)
        if index == 0 {
            first = Node(element: element, next: first)
        }else{
            let prev = node(atIndex: index - 1)
            prev?.next = Node(element: element, next: prev?.next)
        }
        size += 1
    }
    
    public func remove(index: Int) -> Element? {
        rangeCheck(index: index)
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
    
    private func node(atIndex index: Int) -> Node<Element>? {
        rangeCheck(index: index)
        var node = first
        for _ in 0..<index {
            node = node?.next
        }
        return node
    }
    public override var description: String {
        var node: Node? = first
        var tmpString : String = "["
        for index in 0..<size {
            if index != 0 {
                tmpString.append(",")
            }
            if let tmpNode = node, let element = tmpNode.element {
                tmpString.append("\(element)")
            }else {
                tmpString.append("nil")
            }
            node = node?.next
        }
        tmpString.append("]")
        return tmpString
    }
}

