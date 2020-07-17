//: [Previous](@previous)

import Foundation

/**
 给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。
 
 不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 原地 修改输入数组。
 
 元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。
 
   
 
 示例 1:
 
 给定 nums = [3,2,2,3], val = 3,
 
 函数应该返回新的长度 2, 并且 nums 中的前两个元素均为 2。
 
 你不需要考虑数组中超出新长度后面的元素。
 
 链接：https://leetcode-cn.com/problems/remove-element
 */

/**
 改变顺序，但是不改变原数组，不可以删除
 
class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        for i in (0..<nums.count).reversed() {
            if val == nums[i] {
                nums.remove(at: i)
            }
        }
        print(nums)
        return nums.count
    }
}
*/


class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        
        return 2
    }
}

let s = Solution()
var arr = [3,2,1,3]
print(s.removeElement(&arr, 3))

