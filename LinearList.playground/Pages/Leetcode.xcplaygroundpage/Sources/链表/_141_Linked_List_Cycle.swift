import Foundation

/// 环形列表
/// https://leetcode-cn.com/problems/linked-list-cycle/
/// 快慢指针
public func hasCycle(_ head: ListNode?) -> Bool {
    if let first = head, let second = head?.next {
        var slow: ListNode? = first
        var fast: ListNode? = second
        while fast != nil  && fast?.next != nil{
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                return true
            }
        }
    }
    return false
}

public func testLinkedCycle () {
    
    let node1: ListNode = ListNode(1)
    let node2: ListNode = ListNode(2)
    let node3: ListNode = ListNode(3)
    let node4: ListNode = ListNode(4)
    
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node2
    
    print("\(hasCycle(node1) ? "是" : "否")")
}
