/*func lengthOfLongestSubstring(_ s: String) -> Int {
 
 print(s.count)
 guard s.count > 1 else {
 return s.count
 }
 
 var array: [Character] = []
 var max: Int  = 0
 
 for char in s {
 if array.contains(char) {
 if array.count > max {
 max = array.count
 }
 array.removeAll()
 }
 array.append(char)
 }
 return max
 }*/

func lengthOfLongestSubstring(_ s: String) -> Int {
    
    guard s.count > 1 else {
        return s.count
    }
    
    var i: Int = 0
    var j: Int = 0
    var maxNum: Int = 0
    var dic: [Character: Int] = [:]
    
    for (idx, val) in s.enumerated() {
        if dic.keys.contains(val) {
            maxNum = max(maxNum, j - i + 1)
            i = max(i, dic[val]! + 1)
        }
        j = idx
        dic[val] = idx
    }
    
    maxNum = max(maxNum, j - i + 1)
    
    return maxNum
}

lengthOfLongestSubstring("abba")

// aab  abba abcabcbb  auc
