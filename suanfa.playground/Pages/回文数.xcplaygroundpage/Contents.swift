//: [Previous](@previous)

import Foundation

/**
 判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。
 https://leetcode-cn.com/problems/palindrome-number/
 
 不用判断全部 ，判断一半即可
 


// 简单解法，反转字符串

func isPalindrome(_ x: Int) -> Bool {

    guard x > 0 else {
        return false
    }
    
    let str = String(x)
    
    guard str.count > 0 else {
        return false
    }
    
    let str1 = String(str.reversed())
    
    if str == str1 {
        return true
    }
    
    return false
}

isPalindrome(-101)
 */

/**
 进阶:

 你能不将整数转为字符串来解决这个问题吗？
 */


func isPalindrome(_ x: Int) -> Bool {
    
    if x < 0 || ( x % 10 == 0 && x != 0 ) {
        return false
    }
    
    var y = x
    var res = 0
    
    while y > res {
        res = res * 10 + y % 10
        y /= 10
    }
    
    return y == res || y == res / 10
}

isPalindrome(0)
