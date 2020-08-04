//: [Previous](@previous)

import Foundation
/**
 给定两个字符串形式的非负整数 num1 和num2 ，计算它们的和。
 
   
 
 提示：
 
 num1 和num2 的长度都小于 5100
 num1 和num2 都只包含数字 0-9
 num1 和num2 都不包含任何前导零
 你不能使用任何內建 BigInteger 库， 也不能直接将输入的字符串转换为整数形式
 
 链接：https://leetcode-cn.com/problems/add-strings
 
 
 思路:
 */

class Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        
        let chars1 = num1.map { String($0) }
        let chars2 = num2.map { String($0) }
        var res    = [String]()
        
        var i = chars1.count - 1, j = chars2.count - 1
        var sum = 0, cur = 0
        
        while i >= 0 || j >= 0 {
            
            sum = cur

            if i >= 0 {
                sum += Int(chars1[i])!
            }
 
            if j >= 0 {
                sum += Int(chars2[j])!
            }

            cur = sum / 10
            res.append(String(sum % 10))
            
            i -= 1
            j -= 1
        }
        
        if cur != 0 {
            res.append(String(cur))
        }
        
        return res.reversed().joined()
    }
}

let s = Solution()
print(s.addStrings("99", "9"))


/**
 123
 6
 
 99
  9
  
 */
