//: [Previous](@previous)

/**
 给定一个 没有重复 数字的序列，返回其所有可能的全排列。

 输入: [1,2,3]
 输出:
 [
   [1,2,3],
   [1,3,2],
   [2,1,3],
   [2,3,1],
   [3,1,2],
   [3,2,1]
 ]

 链接：https://leetcode-cn.com/problems/permutations
 */

class Solution {
    
    var res: [[Int]] = []

    func permute(_ nums: [Int]) -> [[Int]] {
        
        var track: [Int] = []
        var set =  Set<Int>()
        
        backtrack(nums, &set, &track)
        return res
    }

    func backtrack(_ nums: [Int], _ set: inout Set<Int>, _ track: inout [Int] ) {
        if track.count == nums.count {
            res.append(track)
            return
        }
        
        for item in nums {
            if set.contains(item) {
                continue
            }
            set.insert(item)
            track.append(item)
            
            backtrack(nums, &set, &track)
            
            set.remove(item)
            track.removeLast()
        }
    }
}

let s = Solution()
print(s.permute([2,3,4]))

