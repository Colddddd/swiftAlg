//: [Previous](@previous)

import Foundation

/*
 给定一个包含非负整数的数组，你的任务是统计其中可以组成三角形三条边的三元组个数。

 示例 1:

 输入: [2,2,3,4]
 输出: 3
 解释:
 有效的组合是:
 2,3,4 (使用第一个 2)
 2,3,4 (使用第二个 2)
 2,2,3
 注意:

 数组长度不超过1000。
 数组里整数的范围为 [0, 1000]。

 链接：https://leetcode-cn.com/problems/valid-triangle-number
 */

/**
 变相于找数据里 3个数的 组合，并且满足 任意2边和 大于第三边
 怎么找？
 
 需要从大到小排序 + 双指针

 4 3 2 2
 c b   a
 
 
 9 8 7 6 5 4 3 2 1 0
 c b               a

 如果 a+b 大于c，则 大于a 的数都满足， b ++
 如果 a+b 小于c，则 a 需要往前移，a --
 
 
 100 个数以下 时间复杂度可以n方
 本题限制1000 ，不可n3方
 */

class Solution {
    func triangleNumber(_ nums: [Int]) -> Int {
        
        // 数组小于3，构不成三角形
        guard nums.count > 2 else {
            return 0
        }

        var res: Int = 0
        // 排序
        let array: [Int] = nums.sorted(by: >)
        
        // 留2位 给 a 和 b
        for idx in 0..<array.count - 2 {
            var b: Int = idx + 1
            var a: Int = array.count - 1
            
            while a > b {
                if array[a] + array[b] > array[idx] {
                    res += (a - b)
                    b += 1
                } else {
                    a -= 1
                }
            }
        }
        return res
    }
}


let s = Solution()
print(s.triangleNumber([2, 2, 3, 4]))
