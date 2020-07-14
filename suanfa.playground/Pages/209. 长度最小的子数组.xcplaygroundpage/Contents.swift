//: [Previous](@previous)

import Foundation
import UIKit
/**
 
 给定一个含有 n 个正整数的数组和一个正整数 s ，找出该数组中满足其和 ≥ s 的长度最小的连续子数组，并返回其长度。如果不存在符合条件的连续子数组，返回 0。
 
 示例:
 
 输入: s = 7, nums = [2,3,1,2,4,3]
 输出: 2
 解释: 子数组 [4,3] 是该条件下的长度最小的连续子数组。
 进阶:
 
 如果你已经完成了O(n) 时间复杂度的解法, 请尝试 O(n log n) 时间复杂度的解法
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/minimum-size-subarray-sum
 
 1.顺序不能打乱
 2.
 */






class Solution {
    
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        
        var res = Int.max
        let count = nums.count
        var left = 0, right = 0, sum = 0
        
        while right < count {
            sum += nums[right]
            right += 1
            
            while sum >= s {
                res = min(res, right - left)
                sum -= nums[left]
                left += 1
            }
        }
        guard res != Int.max else { return 0 }
        
        return res
    }
}

let s = Solution()
print(s.minSubArrayLen(7, [2,3,1,2,4,3]))


/**
 2,3,1,2,4,3
 
 0 1 2 3 4 5
 
 
 2 3 1
 2 3 1 2   >7    3 - 0 长度为3， left + 1 = 1
   3 1 2   <7
 
   3 1 2  4  >7    4 - 1 长度为3。 left + 1 = 2
     1 2  4  =7    4 - 2 长度为2,  left + 1 = 3
     1 2  4 3 >7   5 - 3 长度为2， left + 1 = 4
       2  4 3 >7   5 - 4 长度为1， left + 1 = 5
          4 3 = 7  5 - 5 长度为0
 
上面思路不对啊 需要注意 right + 1的时机，当满足条件的时候，right 已经+ 1了。所以应该是
 
 
 2 3 1
 2 3 1 2    >7    4 - 0 长度为4， left + 1 = 1
   3 1 2    <7    打破循环
 
 3 1 2 4    >7    5 - 1 长度为4。 left + 1 = 2
   1 2 4    =7    5 - 2 长度为3,  left + 1 = 3
     2 4    <7    打破循环，此时 right 还是 5
 
  2 4 3     >7    6 - 3 长度为3， left + 1 = 4
    4 3     =7    6 - 4 长度为2， left + 1 = 5
 
 right = 6 < 6 ，不成立 ，到此全部结束

*/

/**
 此方法 超时了
 func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
 guard nums.count > 0 else { return 0 }
 var minCount = 0
 var i = 0
 while i < nums.count {
 var sum = 0
 for (idx, val) in nums[i ..< nums.count].enumerated() {
 sum += val
 if sum >= s {
 let temp = idx + 1
 if minCount == 0 || temp < minCount {
 minCount = temp
 }
 break
 }
 }
 i += 1
 }
 return minCount
 }
 */
