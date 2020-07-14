

/**
 给定一个非空字符串 s，最多删除一个字符。判断是否能成为回文字符串。
 示例 1:

 输入: "aba"
 输出: True
 示例 2:

 输入: "abca"
 输出: True
 解释: 你可以删除c字符。

 "acabca"
 
 我的思路是 反转判断首尾，没法涵盖别的位置
 https://leetcode-cn.com/problems/valid-palindrome-ii/
 */
func validPalindrome(_ s: String) -> Bool {
      
    var i = 0
    var j = s.count - 1
    
    while i < j  {
        for i in 0 ..< s.count {
              let char: Character = s[s.index(s.startIndex, offsetBy: i)]
              let char1: Character = s[s.index(s.startIndex, offsetBy: j)]
              if char != char1 {
                 
              }
          }
    }
    
  
    
    return true
}

validPalindrome("deeee")
                
// aab deeee
