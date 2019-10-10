//
//  Recursion.swift
//  ProblemSolving
//
//  Created by abuzeid on 8/8/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import Foundation
class Rec {
    func reverseString(_ s: inout [String]) {
        if s.isEmpty {
            return
        }
        var index = 0
        let count = s.count - 1
        var lastChar = s[count] // d

        while index <= count {
            lastChar = s[count - index] // e
            s[index] = lastChar //
        }
    }
}
