//: [Previous](@previous)

import Foundation

/*
 给定两个二叉树，编写一个函数来检验它们是否相同。
 
 如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。
 
 示例 1:
 
 输入:       1         1
           / \       / \
          2   3     2   3
 
 [1,2,3],   [1,2,3]
 
 输出: true
 示例 2:
 
 输入:      1          1
           /           \
          2             2
 
 [1,2],     [1,null,2]
 
 输出: false
 
 链接：https://leetcode-cn.com/problems/same-tree
 */

/**
 结构相同  +  数值相同
 
 
 */
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    var isSame = true
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {

        if p == nil && q == nil {
            return true
        }
        if p == nil || q == nil {
            return false
        }
        if p!.val != q!.val {
            return false
        }
        
        return isSameTree(p!.right, q!.right) && isSameTree(p!.left, q!.left)
    }
}
