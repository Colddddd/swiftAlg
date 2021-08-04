//: [Previous](@previous)

import Foundation

/**
 给你一个整数数组 nums ，你需要找出一个 连续子数组 ，如果对这个子数组进行升序排序，那么整个数组都会变为升序排序。

 请你找出符合题意的 最短 子数组，并输出它的长度。

  

 示例 1：

 输入：nums = [2,6,4,8,10,9,15]
 输出：5
 解释：你只需要对 [6, 4, 8, 10, 9] 进行升序排序，那么整个表都会变为升序排序。
 示例 2：

 输入：nums = [1,2,3,4]
 输出：0
 示例 3：

 输入：nums = [1]
 输出：0
  

 提示：

 1 <= nums.length <= 104
 -105 <= nums[i] <= 105
  

 进阶：你可以设计一个时间复杂度为 O(n) 的解决方案吗？

 链接：https://leetcode-cn.com/problems/shortest-unsorted-continuous-subarray
 */

/**
 单调递减栈： 栈顶最大
 2入栈
 6入栈。        ------ 左边界
 4入栈，6 > 4，6出栈
 8入栈
 10入栈
 9 入栈，10 >9, 10出栈 ------ 右边界
 15入栈

 
 时间复杂度 On ，空间复杂度 On
 */


class Solution {
    
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        // 保存下标
        var stack: [Int] = []
        var left: Int = nums.count
        var right: Int = -1
        
        for idx in 0..<nums.count {
            // 当前数小于栈顶，执行出栈操作，直到当前数 大于 之后的栈顶
            if !stack.isEmpty && nums[idx] < nums[stack.last!] {
                
                // 进入条件就说明当前顺序不对，右边比左边某个数小，需要更新右边界
                right = max(right, idx)
                
                // 栈顶永远是最大的
                let maxValue: Int = stack.last!
                
                while !stack.isEmpty && nums[idx] < nums[stack.last!] {
                    // 更新左边界最小值
                    left = min(left, stack.last!)
                    
                    // 栈顶已经发生改变
                    stack.removeLast()
                }
                
                // 将以往最大的下标，重新加入栈顶与之后的数 作比较
                stack.append(maxValue)
            } else {
                stack.append(idx)
            }
        }
        return left < right ? right - left + 1 : 0
    }
}

let s = Solution()
print(s.findUnsortedSubarray([2,6,4,8,10,9,15]))

