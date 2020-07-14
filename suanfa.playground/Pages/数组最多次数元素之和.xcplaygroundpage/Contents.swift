//: [Previous](@previous)

import Foundation

// 给定一个整数数组，计算出现次数最多的元素的和

// 数组的插入操作  和排序 。复杂度？

let array = [1,5,4,4]

func theMostOfCountArray(array: [Int]) -> Int {
    var dic: [Int: Int] = [:]
    
    for num in array {
        if dic.keys.contains(num) {
            let val = dic[num]!
            dic.updateValue(val + 1, forKey: num)
        } else {
            dic[num] = 1
        }
    }
    
    var count = 0
    var num = 0
    for (key,val) in dic{
        if val > count {
            count = val
            num = key
        }
    }
    
    
    print(count * num)
//    let count = dic[max]!
    return 0
}


print(theMostOfCountArray(array: array))
