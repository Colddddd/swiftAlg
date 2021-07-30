//: [Previous](@previous)

import Foundation

/**
 202. 快乐数
 编写一个算法来判断一个数 n 是不是快乐数。

 「快乐数」定义为：

 对于一个正整数，每一次将该数替换为它每个位置上的数字的平方和。
 然后重复这个过程直到这个数变为 1，也可能是 无限循环 但始终变不到 1。
 如果 可以变为  1，那么这个数就是快乐数。
 如果 n 是快乐数就返回 true ；不是，则返回 false 。

  

 示例 1：

 输入：19
 输出：true
 解释：
 12 + 92 = 82
 82 + 22 = 68
 62 + 82 = 100
 12 + 02 + 02 = 1
 示例 2：

 输入：n = 2
 输出：false
  

 提示：

 1 <= n <= 231 - 1
 
 
 */



// 哈希表
// set内 存在代表有环，最终不可能回到1， set 内没有就一直循环，直到最后1加入 set
//class Solution {
//    var set: Set<Int> = []
//
//    func isHappy(_ n: Int) -> Bool {
//        var n: Int = n
//
//        while !set.contains(n) {
//            set.insert(n)
//            n = getNextNum(n)
//        }
//
//        return n == 1
//    }
//
//    func getNextNum(_ n: Int) -> Int {
//        var total: Int = 0
//        var n: Int = n
//
//        while n > 0 {
//            let mod = n % 10
//            n = n / 10
//            total += mod * mod
//        }
//        return total
//    }
//}


// 快慢指针
class Solution {
    
    func isHappy(_ n: Int) -> Bool {
        var slow: Int = n
        var fast: Int = getNextNum(n)
        
        while fast != 1 && slow != fast {
            slow = getNextNum(slow)
            fast = getNextNum(getNextNum(fast))
        }
        
        return fast == 1
    }
    
    func getNextNum(_ n: Int) -> Int {
        var total: Int = 0
        var n: Int = n
        
        while n > 0 {
            let mod = n % 10
            n = n / 10
            total += mod * mod
        }
        return total
    }
}


let s = Solution()
print(s.isHappy(7))
