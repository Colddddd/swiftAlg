//: [Previous](@previous)

import Foundation

/**
 给定一个包含非负整数的 m x n 网格，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。
 
 说明：每次只能向下或者向右移动一步。
 
 示例:
 
 输入:
 [
     [1,3,1],
 [1,5,1],
 [4,2,1]
 ]
 输出: 7
 解释: 因为路径 1→3→1→1→1 的总和最小。
 
 链接：https://leetcode-cn.com/problems/minimum-path-sum
 */

/**

 dp 思想

 从 i = 0，j = 0 开始

 第一行，只能往右加

 第一列，只能往下加

 非第一行，第一列，由左边 和上边相加
 */
class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let line = grid.count
        let column = grid[0].count
        var grid = grid

        for i in 0..<line {
            for j in 0..<column {
                if i == 0 && j == 0 { continue }
                if i == 0 {
                    grid[i][j] = grid[i][j-1] + grid[i][j]
                } else if j == 0 {
                    grid[i][j] = grid[i-1][j] + grid[i][j]
                } else {
                    grid[i][j] = min(grid[i-1][j], grid[i][j-1]) + grid[i][j]
                }
            }
        }

        return grid[line-1][column-1]
    }
}


let s = Solution()
print(s.minPathSum([
    [1,3,1],
    [1,5,1],
    [4,2,1]
]))

