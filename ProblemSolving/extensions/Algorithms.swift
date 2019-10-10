//
//  Algorithms.swift
//  ProblemSolving
//
//  Created by abuzeid on 8/1/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import Foundation
extension Int {
    func isPrime() -> Bool {
        if self % 2 == 0 || self < 2 {
            return false
        }
        var i = 3

        while i * i < self {
            print("iii\(i)")
            if self % i == 0 {
                return false
            }
            i += 2
        }
        return true
    }

    func findDescendingPrimies() -> [Int] {
        var result: [Int] = []
        var i = 3
        while i * i < self {
            if i.isPrime() {
                // remove all its dublicates,
                result.append(i)
            }
            i += 2
        }

        return result
    }
}
