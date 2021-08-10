//: [Previous](@previous)

import Foundation

/**
 
 如果一个数列 至少有三个元素 ，并且任意两个相邻元素之差相同，则称该数列为等差数列。

 例如，[1,3,5,7,9]、[7,7,7,7] 和 [3,-1,-5,-9] 都是等差数列。
 给你一个整数数组 nums ，返回数组 nums 中所有为等差数组的 子数组 个数。

 子数组 是数组中的一个连续序列。

  

 示例 1：

 输入：nums = [1,2,3,4]
 输出：3
 解释：nums 中有三个子等差数组：[1, 2, 3]、[2, 3, 4] 和 [1,2,3,4] 自身。
 示例 2：

 输入：nums = [1]
 输出：0
  

 提示：

 1 <= nums.length <= 5000
 -1000 <= nums[i] <= 1000
 
 1 和 2 的差值 为1，如果等差，那么第三个就是3，第4个就是4
 所有的子序列算一个，并且可以再组合
 双指针？
 
 但是 1 2 3 4 5 内的 1 3。5应该怎么找？ // 吗的好像没有 135 连续
 锁定 12 ，13 ， 14， 15，找等差下标 ，全部找完
 锁定 23，24，25，找等差下标
 直到 n-2？

 
 1 2  3 5
 */

/**
 
 思路基本一致
 时间复杂度 n,空间复杂度 1
 */

class Solution {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        guard nums.count > 2 else {
            return 0
        }
        
        var res: Int = 0
        var diff: Int = nums[1] - nums[0]
        var section: Int = 0
        
        for idx in 2..<nums.count {
            let inDiff = nums[idx] - nums[idx - 1]
            if inDiff == diff {
                section += 1
            } else {
                section = 0
                diff = inDiff
            }
            res += section
        }
        return res
    }
}


/**
 解法2 dp
 
 1 2 3 4 5
 
 状态转移方程： dp[i] = dp[i-1] + 1
 
 转移方程的规律在于：多的组合只是最长的那一个，其他的组合是对称的，除了最长的组合，其它个数一致
 
 123 和 1234， 1234 比 123 多了 1234， 至于 234 和 123 其实是对称的个数
 
 所以 dp【4】== dp【3】 + 1 ==  1 + 1 = 2
 
 所以 res = dp【3】 + dp【4】 = 3，即 1234 有 3种
 
 
 再看一个：
 
 1234 和 12345，其实就多了 12345 这个组合， 2345的等差个数 肯定是 和1234 一致的
 */

class so {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        guard nums.count > 2 else {
            return 0
        }
        
        var dp: [Int] = Array.init(repeating: 0, count: nums.count)
        var res: Int = 0
        
        for idx in 2..<nums.count {
            if nums[idx] - nums[idx - 1] == nums[idx - 1] - nums[idx - 2] {
                dp[idx] = dp[idx - 1] + 1
                res += dp[idx]
            }
        }
        
        return res
    }
}

/**
 优化dp
 空间复杂度 1
 */

class so1 {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        guard nums.count > 2 else {
            return 0
        }
        
        var dp: Int = 0
        var res: Int = 0
        
        for idx in 2..<nums.count {
            if nums[idx] - nums[idx - 1] == nums[idx - 1] - nums[idx - 2] {
                dp += 1
                res += dp
            } else {
                dp = 0
            }
        }
        
        return res
    }
}

let s = so1()
print(s.numberOfArithmeticSlices([1, 2, 3, 8, 9, 10]))

