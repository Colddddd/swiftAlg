//: [Previous](@previous)

import Foundation

/**
 
 给定一个二叉树，找出其最小深度。
 
 最小深度是从根节点到最近叶子节点的最短路径上的节点数量。
 
 说明: 叶子节点是指没有子节点的节点。
 
 示例:
 
 给定二叉树 [3,9,20,null,null,15,7],
 
    3
   / \
  9  20
     /  \
    15   7
 返回它的最小深度  2.
 
 链接：https://leetcode-cn.com/problems/minimum-depth-of-binary-tree
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
 
 BFS
 
 时间复杂度：最坏情况下，这是一棵平衡树
 
 我们需要按照树的层次一层一层的访问完所有节点，除去最后一层的节点。这样访问了 N/2 个节点，因此复杂度是 O(N)。
 
 空间复杂度：和时间复杂度相同，也是 O(N)
 */
/*
class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        
        guard let root = root else { return 0 }
        var step = 1, queue = [root]
        
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                
                if node.left == nil && node.return == nil {
                    return step
                }
                
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
 */



// DFS
//  1
// /
//2
class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        if root.left == nil && root.right == nil { return 1 }
        let leftMin  = minDepth(root.left)
        let rightMin = minDepth(root.right)
        if root.left == nil || root.right == nil {
            return (leftMin + rightMin + 1)
        }
        return min(leftMin, rightMin) + 1
    }
}
