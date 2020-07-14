//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

//快慢指针问题


class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil {
            return false
        }
        
        var fast = head?.next, slow = head
        
        while slow?.next != nil {
            
            fast = fast?.next?.next
            slow = slow?.next
            
            if fast!.val == slow!.val {
                return true
            }
        }
        return false
    }
}



/**初版**/
//class Solution {
//    func hasCycle(_ head: ListNode?) -> Bool {
//
//
//        var fast = head?.next
//        var slow = head
//        while slow?.next != nil {
//            fast = fast?.next?.next
//            slow = slow?.next
//
//            if fast!.val == slow!.val {
//                return true
//            }
//        }
//        return false
//    }
//}
