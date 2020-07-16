//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


/**
 给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。

 输入: "babad"
 输出: "bab"
 注意: "aba" 也是一个有效答案。
 
 
 输入: "cbbd"
 输出: "bb"
 
 
奇： a  aba abcba
 
偶： aa abba
 
 */

 // 第一种：brute force   超时
 // On方 的时间复杂度找出所有子串，n 的时间复杂度 检查是否是回文

/*
class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 0 else { return "" }
                
        var res = ""
        for i in 0..<s.count {
            for j in i..<s.count {
                if j - i + 1 > res.count {
                    let range = s.index(s.startIndex, offsetBy: i) ... s.index(s.startIndex, offsetBy: j)
                    let temp = String(s[range])
                    if self.isPalindrome(temp) {
                        res = temp
                    }
                }
            }
        }
        
        return res
    }
    
    func isPalindrome(_ s: String) -> Bool {
        for i in 0..<(s.count/2 + 1) {
//            print(s[s.index(s.startIndex, offsetBy: i)])
            if s[s.index(s.startIndex, offsetBy: i)] != s[s.index(s.startIndex, offsetBy: s.count - i - 1)] {
                return false
            }
        }
        return true
    }
}
*/



class Solution {
    func longestPalindrome(_ s: String) -> String {
        
        return ""
    }
}

let s = Solution()
print(s.longestPalindrome("a"))


/*
b
ba
bab
baba
babab
bababd
 
a
ab
aba
abab
ababd
*/

