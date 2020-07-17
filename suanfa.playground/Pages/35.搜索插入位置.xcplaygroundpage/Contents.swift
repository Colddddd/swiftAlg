//: [Previous](@previous)

import Foundation

/**
 给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。
 
 你可以假设数组中无重复元素。
 
 示例 1:
 
 输入: [1,3,5,6], 5
 输出: 2
 示例 2:
 
 输入: [1,3,5,6], 2
 输出: 1
 示例 3:
 
 输入: [1,3,5,6], 7
 输出: 4
 示例 4:
 
 输入: [1,3,5,6], 0
 输出: 0
 
 链接：https://leetcode-cn.com/problems/search-insert-position
 */


// 二分法  1  2 3 4 5

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else { return 0 }
        // 左闭右开
        var left = 0, right = nums.count
        
        // 如果 right = nums.count， left < rght
        // 如果 right = nums.count - 1， left <= rght
        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] > target {
                right = mid
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        return left
    }
}



let s = Solution()
print("我是")
print(s.searchInsert([1,3,5,6], 2))




/**
 宝姐 On
 class Solution {
 func searchInsert(_ nums: [Int], _ target: Int) -> Int {
 guard nums.count > 0 else { return 0 }
 var index = -1
 
 for (idx, val) in nums.enumerated() {
 if val >= target {
 index = idx
 break
 }
 }
 
 return index == -1 ? nums.count : index
 }
 }
 */
