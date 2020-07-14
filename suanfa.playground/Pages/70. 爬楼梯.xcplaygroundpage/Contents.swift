//: [Previous](@previous)

import Foundation
/**
 
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
 
 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
 
 注意：给定 n 是一个正整数。
 
 输入： 2
 输出： 2
 解释： 有两种方法可以爬到楼顶。
 1.  1 阶 + 1 阶
 2.  2 阶
 
 
 
 输入： 3
 输出： 3
 解释： 有三种方法可以爬到楼顶。
 1.  1 阶 + 1 阶 + 1 阶
 2.  1 阶 + 2 阶
 3.  2 阶 + 1 阶
 
 */

/*
 
不加上记忆化会超时，时间 2的n次方， 空间 On
 
所以这里用map 保存下来每个结果，时间空间都是 On，
 
dp就是记忆化的 递归
 **/
class Solution {
    var map: [Int: Int] = [:]
    
    func climbStairs(_ n: Int) -> Int {
        if n <= 1 { return 1 }
        if let num = map[n] { return num }
        map[n] = climbStairs(n - 1) + climbStairs(n - 2)
        return map[n]!
    }
}


/**
class Solution {
    // 时间空间都是On， 递推解法
    func climbStairs(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        
        var res: [Int] = Array.init(repeating: 0, count: n + 1)
        res[0] = 1
        res[1] = 1
        
        for i in 2...n {
            res[i] = res[i - 1] + res[i - 2]
        }
        return res[n]
    }
}
 */

let s = Solution()
print(s.climbStairs(5))

