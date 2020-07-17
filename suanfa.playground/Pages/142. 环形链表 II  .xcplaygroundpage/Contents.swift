//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
/** https://leetcode-cn.com/problems/linked-list-cycle-ii/
 
 
 给定一个链表，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。
 
 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。
 
 说明：不允许修改给定的链表。
 
 */


/**
 
 双指针
 
 分析数组的特点：值的范围 正好在 下标的范围 内
 这个数组的特点，索引从 0 到 nn，数组项的范围是 1～n1～n
 数组项的范围，在 索引的范围 内，值可以当索引使
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        
        var slow = head
        var fast = head

        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast!.next?.next

            if slow === fast {
                break;
            }
        }
        if fast == nil || fast?.next == nil {
            return nil
        }

        fast = head
        while slow !== fast {
            fast = fast?.next
            slow = slow?.next
        }

        return slow
    }
}

