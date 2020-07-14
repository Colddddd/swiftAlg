
import UIKit

/**
 给定一个三角形，找出自顶向下的最小路径和。每一步只能移动到下一行中相邻的结点上。
 
 相邻的结点 在这里指的是 下标 与 上一层结点下标 相同或者等于 上一层结点下标 + 1 的两个结点。
 
 [
 [2],
 [3,4],
 [6,5,7],
 [4,1,8,3]
 ]
 
 自顶向下的最小路径和为 11（即，2 + 3 + 5 + 1 = 11）。
 
 如果你可以只使用 O(n) 的额外空间（n 为三角形的总行数）来解决这个问题，那么你的算法会很加分。

 链接：https://leetcode-cn.com/problems/triangle
 
 思路：第一个数是确定的，然后要找相邻小的数，再依据较小的下标继续找，应该有相同子问题。给定一个下标，求相邻下标的最小值 ？
 
 
 */

class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 0 else { return 0 }
    
        var triangle = triangle
        for i in (0..<triangle.count-1).reversed() {
            for j in 0..<triangle[i].count {
                triangle[i][j] += min(triangle[i+1][j], triangle[i+1][j+1])
            }
        }
        return triangle[0][0]
    }
}

let s = Solution()
print(s.minimumTotal( [
    [2],
   [3,4],
  [6,5,7],
 [4,1,8,3]
]))

