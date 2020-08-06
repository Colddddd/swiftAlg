//: [Previous](@previous)

import Foundation

/**
 在上次打劫完一条街道之后和一圈房屋后，小偷又发现了一个新的可行窃的地区。这个地区只有一个入口，我们称之为“根”。 除了“根”之外，每栋房子有且只有一个“父“房子与之相连。一番侦察之后，聪明的小偷意识到“这个地方的所有房屋的排列类似于一棵二叉树”。 如果两个直接相连的房子在同一天晚上被打劫，房屋将自动报警。
 
 计算在不触动警报的情况下，小偷一晚能够盗取的最高金额。
 
 示例 1:
 
 输入: [3,2,3,null,3,null,1]
 
       3
      / \
     2   3
      \   \
       3   1
 
 输出: 7
 解释: 小偷一晚能够盗取的最高金额 = 3 + 3 + 1 = 7.
 示例 2:
 
 输入: [3,4,5,1,3,null,1]
 
        3
       / \
      4   5
     / \   \
    1   3   1
 
 输出: 9
 解释: 小偷一晚能够盗取的最高金额 = 4 + 5 = 9.
 
 链接：https://leetcode-cn.com/problems/house-robber-iii
 */

// 递归怎么递 ？  状态怎么记 ？ 要转二叉树？ 根节点肯定无法跟左右节点共存，但是根节点也算是中间点
// 也就意味着，根节点和左右节点 只能去一个值



/**

根节点如果偷了，那么子节点必然偷不了
子节点如果偷了，左右2个节点可以一起偷

如果根节点 > 左+ 右，那么必偷根节点
如果根节点 = 左+ 右，继续判断

是不是要倒序偷 ？


意味着：要么取 根节点，要么取 左右之和。

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

    func rob(_ root: TreeNode?) -> Int {
        let rob = robOrNot(root)
        return max(rob[0], rob[1])
    }

    func robOrNot(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [0,0] }
        let left  = robOrNot(root!.left)
        let right = robOrNot(root!.right)
//        var res = [Int]()
        var res = [0,0]
        res[0] = max(left[0], left[1]) +  max(right[0], right[1])
        res[1] = left[0] + right[0] + root!.val
        return res
    }
    
}
