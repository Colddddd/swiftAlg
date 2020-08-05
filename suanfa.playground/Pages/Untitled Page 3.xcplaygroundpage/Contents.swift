//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

public class TreeNode {
    public var val :  Int?
    public var left:  TreeNode?
    public var right: TreeNode?
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

public class Tree {
    public var root: TreeNode?
    
    // 插入
    public func insert(_ val: Int) {
        
    }
}
