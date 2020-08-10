//: [Previous](@previous)

import Foundation

/**  时间复杂度  O(n^2) 空间复杂 O(1)
 
 func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
 if nums.isEmpty {
 return []
 }
 
 for i in 0 ..< nums.count {
 let num1 = nums[i]
 for j in i ..< nums.count {
 let num2 = nums[j]
 if num1 + num2 == target {
 return [i,j]
 }
 }
 }
 
 return []
 }
 */


// 一遍hash

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    guard !nums.isEmpty else {
        return []
    }
    
    var dic: [Int: Int] = [:]
    for (idx, val) in nums.enumerated() {
        let tragetNum = target - val
        if dic.keys.contains(tragetNum) {
            return [dic[tragetNum]!,idx]
        } else {
            dic.updateValue(idx, forKey: val)
        }
    }
    
    return []
}


twoSum([1,2, 7, 11, 15],9)


