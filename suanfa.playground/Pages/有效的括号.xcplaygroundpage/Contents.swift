//: [Previous](@previous)

import Foundation
import UIKit

func isValid(_ s: String) -> Bool {
    
    var symbolStack = [Character]()
    
    guard !s.isEmpty else {
        return true
    }
    
    guard s.count % 2 == 0 else {
        return false
    }
    
    let dict: [Character: Character] = ["{": "}",
                                        "[": "]",
                                        "(": ")",
    ]

    
    for char in s {
        if dict.keys.contains(char) {
            symbolStack.append(char)
        } else {
            if symbolStack.count > 0 {
                if char == dict[symbolStack.last!] {
                   symbolStack.removeLast()
                }
            }
        }
    }
    print(symbolStack)
    return symbolStack.isEmpty
}

isValid("{}")
