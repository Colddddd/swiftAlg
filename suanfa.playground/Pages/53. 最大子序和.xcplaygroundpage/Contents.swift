//: [Previous](@previous)

import Foundation
/**
 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
 
 示例:
 
 输入: [-2,1,-3,4,-1,2,1,-5,4]
 输出: 6
 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
 进阶:
 
 如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的分治法求解。
 
 链接：https://leetcode-cn.com/problems/maximum-subarray
 */

// dp 如果上一个值是负数，那就不加。  比较当前值   和   (当前值 + 上一个值得大小)

// On on

/*
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }
        
        var resArray: [Int] = Array(repeating: 0, count: nums.count)
        var res = nums[0]
        
        resArray[0] = nums[0]

        for i in 1..<nums.count {
            resArray[i] = max(nums[i], nums[i] + resArray[i - 1])
        }
        
        for x in resArray {
            res = max(res, x)
        }
        return res
    }
}
*/

// 空间 O1
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        let first = nums[0]
        guard nums.count > 1 else { return first }
        
        var res = first, sum = first
        
        for i in 1..<nums.count {
            sum = max(nums[i], nums[i] + sum)
            res = max(sum, res)
        }
        return res
    }
}

let s = Solution()
print(s.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
