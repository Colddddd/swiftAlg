//: [Previous](@previous)

import Foundation

let str  = "/a/./b/../../c/"

//path = "/a/./b/../../c/", => "/c"

func getPath(_ path: String) -> String {
    var pathStack = [String]()

    let paths = path.components(separatedBy: "/")

    for path in paths {
        guard path != "." else {
            continue
        }
        
        if path == ".." {
            if pathStack.count > 0 {
                pathStack.removeLast()
            }
        } else if path != "" {
            pathStack.append(path)
        }
    }

//    print(pathStack)
    
    let res = pathStack.reduce("") { a, b in
       "\(a)/\(b)"
    }
    return res
}

debugPrint(getPath(str))

