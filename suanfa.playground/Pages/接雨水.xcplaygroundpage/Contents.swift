//: [Previous](@previous)

import Foundation

func trap(_ height: [Int]) -> Int {
    
    guard height.count > 2 else {
        return 0
    }
    
    var stack: [Int] = []
    var sum: Int = 0
 
    for i in 0 ..< height.count {
        
        while !stack.isEmpty && height[i] > height[stack.last!]{

            let pop = stack.last!
            
            stack.removeLast()

            if !stack.isEmpty {
                
                let minNum = min(height[i] , height[stack.last!]) - height[pop]
                
                sum += minNum * (i - stack.last! - 1)
            }
        }
        stack.append(i)
    }
    
    return sum
}

trap([0,1,0,2,0,0,1,3])
