//: [Previous](@previous)

import Foundation

/**
 
 给定一个二叉树，找出其最大深度。
 
 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。
 
 说明: 叶子节点是指没有子节点的节点。
 
 示例：
 给定二叉树 [3,9,20,null,null,15,7]，
 
   3
  / \
 9  20
    / \
   15  7
 
 返回它的最大深度 3 。
 
       3   9  20 15 7
       3   9  20   15 7
 
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

/**
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let leftDepth  = maxDepth(root?.left)
        let rightDepth = maxDepth(root?.right)
        
        return max(leftDepth, rightDepth) + 1
    }
}
 */

/**
 递归: DFS
 
 时间复杂度：O(n)，其中 n 为二叉树节点的个数。每个节点在递归中只被遍历一次。
 空间复杂度：O(height)，其中 height 表示二叉树的高度。
 递归函数需要栈空间，而栈空间取决于递归的深度，因此空间复杂度等价于二叉树的高度
 */

// ----------------------

/**
      3
     / \
    9  20
       / \
      15  7
 
 3 入， 3出， 9 入 20 入
 20 出，15入，7入， 【9.15.7】
 7 出
 15出
 9 出
 0
 
 */
// BFS


class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        
        guard let root = root else { return 0 }
        var step = 0, queue = [root]
        
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                
                if let leftNode = node.left {
                    queue.append(leftNode)
                }
                if let rightNode = node.right {
                    queue.append(rightNode)
                }
            }
            step += 1
        }
        return step
    }
}

/*

[1,2,3,4,null,null,5]

       1
     2  3
   4      5

1
2 3
 
 
 [3,9,20,null,null,15,7]
 
       3
     9   20
        15  7
 */
