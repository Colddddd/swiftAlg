//: [Previous](@previous)

import Foundation

/**
 实现一个函数，检查二叉树是否平衡。在这个问题中，平衡树的定义如下：任意一个节点，其两棵子树的高度差不超过 1。
 
 
 示例 1:
 给定二叉树 [3,9,20,null,null,15,7]
      3
     / \
    9  20
      /  \
     15   7
 返回 true 。
 示例 2:
 给定二叉树 [1,2,2,3,3,null,null,4,4]
       1
      / \
     2   2
    / \
   3   3
  / \
 4   4
 返回 false 。
 
 链接：https://leetcode-cn.com/problems/check-balance-lcci
 */

/***
 平衡二叉树 ：平衡树 +  排序 ，左边必须小于根节点，右边必须大于根节点
 
 
 平衡树: 每个节点的 左右节点，深度相差 不大于 1，✨ 本题
 */
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    
    var isBalanced = true
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        dfs(root)
        return isBalanced
    }
    
    func dfs(_ root: TreeNode?) -> Int {
        // 如果已经非平衡，结束递归
        if !isBalanced { return 0 }
        
        // 根节点为 nil， 结束递归
        if root == nil { return 0 }
        
        // 当前节点的左节点一直递归
        let lDepth = dfs(root?.left)
        
        // 当前节点的右节点一直递归
        let rDepth = dfs(root?.right)
        
        // 相差大于1，非平衡
        if abs(lDepth - rDepth) > 1 {
            isBalanced = false
        }
        // 返回当前节点的深度(左右节点d的最大深度)
        return max(lDepth, rDepth) + 1
    }
}


