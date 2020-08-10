//: [Previous](@previous)

import Foundation

/**
 给定一个整数 n，生成所有由 1 ... n 为节点所组成的 二叉搜索树 。



 示例：

 输入：3
 输出：
 [
   [1,null,3,2],
   [3,2,null,1],
   [3,1,null,null,2],
   [2,1,3],
   [1,null,2,null,3]
 ]
 解释：
 以上的输出对应以下 5 种不同结构的二叉搜索树：

 1         3     3      2      1
 \       /     /      / \      \
 3     2     1      1   3      2
 /     /       \                 \
 2     1         2                 3


 提示：

 0 <= n <= 8

 链接：https://leetcode-cn.com/problems/unique-binary-search-trees-ii
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
    func generateTrees(_ n: Int) -> [TreeNode?] {
        guard n > 0 else { return [] }
        return helper(1, n)
    }

    func helper(_ start: Int, _ end: Int ) -> [TreeNode] {
        var list = [TreeNode]()

        if start > end {
            return list
        }

        for i in start...end {
            let leftList  = helper(start, i - 1)
            let rightList = helper(i + 1, end)

            if leftList.count == 0 && rightList.count == 0 {
                let node = TreeNode.init(i)
                list.append(node)
            } else if leftList.count == 0 {
                for rightNode in rightList {
                    let node = TreeNode.init(i)
                    node.right = rightNode
                    list.append(node)
                }
            } else if rightList.count == 0 {
                for leftNode in leftList {
                    let node = TreeNode.init(i)
                    node.left = leftNode
                    list.append(node)
                }
            } else {
                for leftNode in leftList {
                    for rightNode in rightList {
                        let node = TreeNode.init(i)
                        node.left = leftNode
                        node.right = rightNode
                        list.append(node)
                    }
                }
            }
        }
        return list
    }
}


