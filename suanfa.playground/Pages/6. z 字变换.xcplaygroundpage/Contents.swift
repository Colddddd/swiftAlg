//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

/**
 
 https://leetcode-cn.com/problems/zigzag-conversion/
 比如输入字符串为 "LEETCODEISHIRING" 行数为 3 时，排列如下：
 
 
 L   C   I   R
 E T O E S I I G
 E   D   H   N
 
 想法如下
 
 L # C # I # R #
 E T O E S I I G
 E # D # H # N #
 
 L E E # T # C ,跳着拼接
 
 16/3 = 5...1
 
 之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："LCIRETOESIIGEDHN"
 
 
 
 怎么竖着排列 ？ 先L，E，E，
 
 3行，所以中间必有数字。去第一行和 第三行，中间只剩一行，所以列 只会差一列，所以下个数字，必定在 第二行的中间
 
 按照这个规律写？
 
 怎么用代码表现出 行 和列？
 
 */



/**
 L   C   I   R
 E T O E S I I G
 E   D   H   N
 
 
 L
 E   O
 E C
 T
 
 
 
 leet为一个循环，求出有多少个 leet,
 
 3行，每一个leet 为  3 * 2 - 2
 
 4行，每一个leet 为  4 * 2 - 2
 
 算出每个字母在第几行，分别放入对应的数组中
 
 
 如果 字母的index 小于  行数，正向放入 数组
 
 如果 一个循环的 字母的index 大于 行数
 
 */

//func convert(_ s: String, _ numRows: Int) -> String {
//
//    var arrays = [Array<String>]()
//
//    for _ in 0 ..< numRows {
//        let itemArray = [String]()
//        arrays.append(itemArray)
//    }
//
//    var arr = arrays[1]
//    arr.append("222")
//
//    print(arrays)
//
//
//    return ""
//}


/**
 一直纠结数组套数组，数组套字符串就可以
 */
func convert(_ s: String, _ numRows: Int) -> String {
    
    guard numRows > 1 else {
        return s
    }
    
    var letterArray = Array<String>()
    for _ in 0 ..< numRows {
        letterArray.append("")
    }
    
    let cycleCount = numRows * 2 - 2
    
    for (idx, letter) in s.enumerated() {
        let whichLine = idx % cycleCount
        if whichLine < numRows {
            letterArray[whichLine].append(letter)
        } else {
            letterArray[cycleCount - whichLine].append(letter)
        }
    }
    
    return letterArray.joined()
}


