//: [Previous](@previous)

/**
 
 给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。
 
 示例 1:
 
 输入: 1->1->2
 输出: 1->2
 示例 2:
 
 输入: 1->1->2->3->3
 输出: 1->2->3
 
 如果 cur == next , cur.next = next.next
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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
  
        let dummy = ListNode(-1)
        var new = head
        dummy.next = new
        
        while new != nil {
            if new?.val == new?.next?.val {
                new?.next = new?.next?.next
            } else {
                new = new?.next
            }
        }
        
        return dummy.next
    }
}
