//: [Previous](@previous)

import Foundation

/**
 给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。
 说明:
 
 初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。
 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
   
 
 示例:
 
 输入:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3
 
 输出: [1,2,2,3,5,6]
 
 链接：https://leetcode-cn.com/problems/merge-sorted-array
 */

/*
class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = 0, j = 0, res = 0
        let nums3 = nums1

        while j < n  && i < m {
            if nums3[i] <= nums2[j] {
                nums1[res] = nums3[i]
                i += 1
            } else {
                nums1[res] = nums2[j]
                j += 1
            }
            res += 1
        }
        
        while j <  n {
            nums1[res] = nums2[j]
            res += 1
            j += 1
        }
        
        while i < m {
            nums1[res] = nums3[i]
            res += 1
            i += 1
        }
    }
}
 */

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1, j = n - 1, res = m + n - 1
        while j >= 0 {
            if i >= 0 && nums1[i] > nums2[j] {
                nums1[res] = nums1[i]
                i -= 1
            } else {
                nums1[res] = nums2[j]
                j -= 1
            }
            res -= 1
        }
    }
}

let s = Solution()
var num1 = [1,2,3,0,0,0]
let num2 = [2,5,6]

s.merge(&num1, 3, num2, 3)

print(num1)
 

