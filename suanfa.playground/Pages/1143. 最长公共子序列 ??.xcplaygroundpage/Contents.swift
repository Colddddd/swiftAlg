//: [Previous](@previous)

import Foundation

/**
 给定两个字符串 text1 和 text2，返回这两个字符串的最长公共子序列的长度。
 
 一个字符串的 子序列 是指这样一个新的字符串：它是由原字符串在不改变字符的相对顺序的情况下删除某些字符（也可以不删除任何字符）后组成的新字符串。
 例如，"ace" 是 "abcde" 的子序列，但 "aec" 不是 "abcde" 的子序列。两个字符串的「公共子序列」是这两个字符串所共同拥有的子序列。
 
 若这两个字符串没有公共子序列，则返回 0。
 
 链接：https://leetcode-cn.com/problems/longest-common-subsequence
 
 
 例 1:
 
 输入：text1 = "abcde", text2 = "ace"
 输出：3
 解释：最长公共子序列是 "ace"，它的长度为 3。
 
 */

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let chars1 = [Character](text1), chars2 = [Character](text2)
        let count1 = chars1.count, count2 = chars2.count
        
        var dpArray = [[Int]](repeating: [Int](repeating: 0, count: text2.count + 1), count: text1.count + 1)
        
        for i in 0..<count1 {
            for j in 0..<count2 {
                if chars1[i] == chars2[j] {
                    dpArray[i+1][j+1] =  dpArray[i][j] + 1
                } else {
                    dpArray[i+1][j+1] =  max(dpArray[i][j+1], dpArray[j][i+1])
                }
            }
        }
        
        return dpArray[count1][count2]
    }
}



let s = Solution()
//print(s.longestCommonSubsequence("bl", "yby"))

print(s.longestCommonSubsequence("abcde", "ace"))
