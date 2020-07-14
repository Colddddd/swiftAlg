//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/largest-number/   179题


/**
 给定一组非负整数，重新排列它们的顺序使之组成一个最大的整数。
 
 输入: [3,30,34,5,9]
 输出: 9534330
 
 说明: 输出结果可能非常大，所以你需要返回一个字符串而不是整数。
 
 最大 肯定要个位先比较，再比较十位，再比较百位
 
 怎么 拿到所有数的 个位呢？元素可能还有 3位数的？
 
 
 转为字符串，cmp,比较 s1 + s2 是否大于  s2 + s1
 
 */

let array = [9,91,14]

func largestNumber(_ nums: [Int]) -> String {
    let sortedArr = nums
        .map { "\($0)" }
        .sorted { $0 + $1 > $1 + $0 }
    
    guard sortedArr.first != "0" else {
        return "0"
    }
    return sortedArr.joined()
}

print(largestNumber(array))



