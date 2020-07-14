class Solution {
    func validPalindrome(_ s: String) -> Bool {
        
        guard s.count < 3 else {
            return true
        }
        
        var count: Int = 0
        
        let reverStr = String(s.reversed())
        let strCount = s.count % 2 == 0 ? s.count / 2 : s.count / 2 + 1
        
        for i in 0 ..< strCount {
            let char: Character = s[s.index(s.startIndex, offsetBy: i)]
            let char1: Character = reverStr[reverStr.index(reverStr.startIndex, offsetBy: i)]
            print(char,char1)
            if char != char1 {
                count += 1
            }
        }
        
        return count < 2
    }
}
