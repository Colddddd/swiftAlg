//: [Previous](@previous)

import Foundation

/**
 给定一个可包含重复数字的序列，返回所有不重复的全排列。
 
 示例:
 
 输入: [1,1,2]
 输出:
 [
 [1,1,2],
 [1,2,1],
 [2,1,1]
 ]
 
 链接：https://leetcode-cn.com/problems/permutations-ii
 */


class Solution {
    
    var res: [[Int]] = []

    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        
        var track: [Int] = []
        var boolArray = Array.init(repeating: false, count: nums.count)
        let nums = nums.sorted()
        backtrack(nums, &boolArray, &track)
        return res
    }
    
    func backtrack(_ nums: [Int], _ bools: inout Array<Bool>, _ track: inout [Int] ) {
        if track.count == nums.count {
            res.append(track)
            return
        }
        
        var preNum = nums[0] - 1
        
        for (idx, val) in nums.enumerated() {
            if val != preNum && bools[idx] == false {
                
                preNum = val
                
                track.append(val)
                bools[idx] = true

                backtrack(nums, &bools, &track)
                
                bools[idx] = false
                track.removeLast()
            }
        }
    }
}

let s = Solution()
print(s.permuteUnique([-2,2,3,]))

