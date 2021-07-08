import Foundation
/// 删除链表中的节点
/// https://leetcode-cn.com/problems/delete-node-in-a-linked-list/

/*
 解题思路：1.判断传入的node是否有值，有值在进行处理
            当前val 等于 下一个节点的 val
            将node下下个节点赋值给node的next。这样当前node节点的值就被删除了
 
 
 **/
public func deleteNode(_ node: ListNode?) {
    if node != nil {
        node?.val = node?.next?.val ?? 0
        node?.next = node?.next?.next
    }
}

public func testDeleteNode () {
    let node1: ListNode = ListNode(4)
    let node2: ListNode = ListNode(5)
    let node3: ListNode = ListNode(1)
    let node4: ListNode = ListNode(9)
    
    
    node1.next = node2
    node2.next = node3
    node3.next = node4

    deleteNode(node2)
    var tmpNode: ListNode? = node1
    while tmpNode != nil{
        guard let node = tmpNode else {
            return
        }
        if node.next == nil {
            print("\(node.val)", terminator: "")
        }else{
            print("\(node.val)", terminator: ",")
        }
        
        tmpNode = tmpNode?.next
    }
}
