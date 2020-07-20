//: [Previous](@previous)

import Foundation

/**
 给定一个已按照升序排列 的有序数组，找到两个数使得它们相加之和等于目标数。

 函数应该返回这两个下标值 index1 和 index2，其中 index1 必须小于 index2。

 说明:

 返回的下标值（index1 和 index2）不是从零开始的。
 你可以假设每个输入只对应唯一的答案，而且你不可以重复使用相同的元素。
 示例:

 输入: numbers = [2, 7, 11, 15], target = 9
 输出: [1,2]
 解释: 2 与 7 之和等于目标数 9 。因此 index1 = 1, index2 = 2 。

 链接：https://leetcode-cn.com/problems/two-sum-ii-input-array-is-sorted
 */

// nlogN
class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        guard numbers.count > 1 else { return [-1, -1] }

        for i in 0..<numbers.count {
            var left = i + 1, right = numbers.count - 1
            while left <= right {
                let mid = left + (right - left) / 2
                if numbers[mid] > (target - numbers[i]) {
                    right = mid - 1
                } else if numbers[mid] < (target - numbers[i]) {
                    left = mid + 1
                } else {
                    return [i + 1, mid + 1]
                }
            }
        }
        return [-1, -1]
    }
}
let s = Solution()
print(s.twoSum([2, 7, 8, 11, 15],26))


/**

 借助哈希表使用 O(n) 的时间复杂度和 O(n) 的空间复杂度求解。

 但是解法都是针对无序数组的，没有利用到输入数组有序的性质

 利用输入数组有序的性质，可以得到时间复杂度和空间复杂度更优的解法

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {

        guard numbers.count > 0 else { return [] }

        var dic:[Int: Int] = [:]
        var res:[Int]  = []

        for (idx, val) in numbers.enumerated() {
            let tem = target - val
            if let num = dic[tem] {
                res.append(num + 1)
                res.append(idx + 1)
            } else {
                dic[val] = idx
            }
        }
        return res
    }
}
 */
