//
//  Utils.swift
//  Examples
//
//  Created by Badrinath on 9/9/17.
//  Copyright © 2017 Badrinath. All rights reserved.
//

import Foundation


struct Utils {
    
    static func plusOne(_ digits: inout [Int]) {
        let n = digits.count
        for i in (0 ... n-1).reversed() {
            if digits[i] == 9 {
                digits[i] = 0
            } else {
                digits[i] += 1
                print(digits[i])
                return
            }
        }
        digits[0] = 1
        digits.append(0)
    }
    
    static func countAndSay(_ n: Int) -> String {
        var result: String = "1"
        for _ in 0 ..< n {
            let previous: String = result
            result = ""
            var counter = 1
            var say: Character = previous[0]
            for j in 1 ..< previous.characters.count {
                if previous[j] != say {
                    result = "\(result)\(counter)\(say)"
                    counter = 1
                    say = previous[j]
                } else {
                    counter += 1
                }
            }
            result = "\(result)\(counter)\(say)"
        }
        return result
    }

    
}


private extension String {
    subscript (index: Int) -> Character {
        return self[self.characters.index(self.startIndex, offsetBy: index)]
    }
}


