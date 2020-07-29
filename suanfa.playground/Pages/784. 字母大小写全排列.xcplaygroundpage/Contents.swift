//: [Previous](@previous)

import Foundation
import UIKit
/**
 给定一个字符串S，通过将字符串S中的每个字母转变大小写，我们可以获得一个新的字符串。返回所有可能得到的字符串集合。
 
 示例:
 输入: S = "a1b2"
 输出: ["a1b2", "a1B2", "A1b2", "A1B2"]
 
 输入: S = "3z4"
 输出: ["3z4", "3Z4"]
 
 输入: S = "12345"
 输出: ["12345"]
 
 注意：
 
 S 的长度不超过12。
 S 仅由数字和字母组成。
 
 链接：https://leetcode-cn.com/problems/letter-case-permutation
 */

/**
 思路:
 数字只是干扰，实际上就是字符串大小写全排列
 
 为什么要用数字 干扰？
 
 
 解答：
 
 DFS 思路：递归的问题其实就是一个树的分支问题，比如这道题，数字是不需要改变的，是唯一的，涉及不到分支。而字母就不同了，字母需要分为大小写两种情况
 
 */

class Solution {
    
    func letterCasePermutation(_ S: String) -> [String] {
        var s = S
        var ans: [String] = []
        dfs(s: &s, idx: 0, ans: &ans)
        return ans
    }
    
    func dfs(s: inout String, idx: Int, ans: inout [String]) {
        var chars = [Character](s)
        
        if idx == chars.count {
            ans.append(s)
            return
        }
        
        let char = chars[idx]
        
        if char.isLetter {
            dfs(s: &s, idx: idx + 1, ans: &ans)
            
            if let newascii = char.asciiValue {
                chars[idx] = Character(UnicodeScalar(newascii ^ 32))
                s = String(chars)
            }
            
            dfs(s: &s, idx: idx + 1, ans: &ans)
        } else {
            dfs(s: &s, idx: idx + 1, ans: &ans)
        }
    }
}


let s = Solution()
print(s.letterCasePermutation("a1b2"))

