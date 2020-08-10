//: [Previous](@previous)

import Foundation

/**
 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有满足条件且不重复的三元组。
 
 注意：答案中不可以包含重复的三元组。
 
   
 
 示例：
 
 给定数组 nums = [-1, 0, 1, 2, -1, -4]，
 
 满足要求的三元组集合为：
 [
 [-1, 0, 1],
 [-1, -1, 2]
 ]
 
 链接：https://leetcode-cn.com/problems/3sum
 */

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        
        
        return []
    }
}

let s = Solution()
print(s.threeSum([-1, 0, 1, 2, -1, -4]))


/**
 
 思路: dfs 好像不行? 是否需要排序？
 
 -4  -1  -1  0  1   2
 
 小于0:
 
 -4 0
 
 */
