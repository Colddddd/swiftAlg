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
 // On方 的时间复杂度找出所有子串，n 的时间复杂度 检查是否是回文, 一共是 On 3次方

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


// 中心扩散法
/**
 每2个相邻的字母 中间的间隙也算一个 字符的话，一共有 n + （ n - 1） 个空隙，方便 奇数 和 偶数 找中间点

 acbca

 acbbca
 */

class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard !s.isEmpty else { return "" }

        var start = 0, end = 0
        let chars = [Character](s)

        for i in 0..<chars.count {
            let len1 = getMaxLength(chars, i, i)
            let len2 = getMaxLength(chars, i, i+1)
            let len = max(len1, len2)

            print(len)
            if len > (end - start + 1) {
                start = i - (len - 1) / 2
                end = i + len / 2
            }
        }
        return String(chars[start...end])
    }

    // 获取某个中心点开始扩散的最大长度
    func getMaxLength(_ chars: [Character], _ left: Int, _ right: Int) -> Int {
        var L = left, R = right

        while L >= 0 && R < chars.count && (chars[L] == chars[R]) {
            L -= 1
            R += 1
        }
        // 此时已经越界，需 -1
        return R - L - 1
    }
}

let s = Solution()
print(s.longestPalindrome("babad"))


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

