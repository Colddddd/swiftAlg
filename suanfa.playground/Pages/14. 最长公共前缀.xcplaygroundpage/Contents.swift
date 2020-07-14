//: [Previous](@previous)

import Foundation

/**
 编写一个函数来查找字符串数组中的最长公共前缀。
 
 如果不存在公共前缀，返回空字符串 ""。
 输入: ["flower","flow","flight"]
 输出: "fl"
 
 输入: ["dog","racecar","car"]
 输出: ""
 解释: 输入不存在公共前缀。
 
 所有输入只包含小写字母 a-z 。
 
 
 思路:
 
 核心在于 查找，查找的时间复杂度最低的是， 字典 he 数组，但是找的是具体 元素，所以用字典
 
 
 */
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard !strs.isEmpty else {
            return ""
        }
        
        guard let firstStr = strs.first, !firstStr.isEmpty else {
            return ""
        }
        
        for idx in 0 ..< firstStr.count {
            let char: Character = firstStr[firstStr.index(firstStr.startIndex, offsetBy: idx)]
            for idx1 in 1 ..< strs.count {
                let str1 = strs[idx1]
                if idx == str1.count  || str1[str1.index(str1.startIndex, offsetBy: idx)] != char  {
                    return String(firstStr.prefix(idx))
                }
            }
        }
        return strs[0]
    }
}

let c = Solution()

print(c.longestCommonPrefix(["a","","aa"]))
