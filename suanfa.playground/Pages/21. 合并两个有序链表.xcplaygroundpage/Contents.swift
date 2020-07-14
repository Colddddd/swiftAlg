//: [Previous](@previous)

import Foundation
import UIKit
var str = "Hello, playground"

//: [Next](@next)
//https://leetcode-cn.com/problems/merge-two-sorted-lists/

/**
 将两个升序链表合并为一个新的升序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 
 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 */
/**
 * Definition for singly-linked list.
 
 个人想法：2个list 两两比较，相等一起添加，不相等，谁小谁添加
 
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}



func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    guard l1 != nil else {
        return l2
    }
    
    guard l2 != nil else {
        return l1
    }
    
    if l1!.val < l2!.val {
        l1?.next = mergeTwoLists(l1?.next, l2)
        return l1
    } else {
        l2?.next = mergeTwoLists(l2?.next, l1)
        return l2
    }
}



