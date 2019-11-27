//
//  UniqeStringChars.swift
//  ProblemSolvingTests
//
//  Created by abuzeid on 11/27/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import XCTest

class UniqeStringChars: XCTestCase {
    func isStringUnique(_ string: String) -> Bool {
        var checker: UInt8 = 0
        guard let asci = Character("a").asciiValue else { return false }
        for index in 0..<string.count {
            guard let currentAsci = string[index].asciiValue else { return false }
            let value = currentAsci - asci
            if (checker & (1 << value)) > 0 {
                return false
            } else {
                checker = checker | (1 << value)
            }
        }
        return true
    }

    func testExample() {
        XCTAssertEqual(isStringUnique("abcdefghilmsnwo"), true)
    }
}
