//
//  NumberToAlphabeticMapperTests.swift
//  ProblemSolvingTests
//
//  Created by abuzeid on 4/18/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import XCTest

extension String {
    var charArray: [String] {
        return Array(self).map { String($0) }
    }
   
}

class LetterCompination {
    func numValu(c: Character) -> String {
        switch c {
        case "2":
            return "abc"
        case "3":
            return "def"
        case "4":
            return "ghi"
        case "5":
            return "jkl"
        case "6":
            return "mno"
        case "7":
            return "pqrs"
        case "8":
            return "tuv"
        case "9":
            return "wxyz"
        default:
            return ""
        }
    }

    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty { return [] }
        var stack: [String] = []
        stack.reserveCapacity(digits.count * digits.count)
        stack.append("")
        for level in digits.enumerated() {
            let numStringSet = numValu(c: level.element)
            var levelColumn = [String]()
            levelColumn.reserveCapacity((level.offset + 1) * 3)
            if level.offset == 0 {
                levelColumn.append(contentsOf: numStringSet.charArray) // index Zero
            }

            for char in numStringSet.enumerated() {
                guard level.offset > 0 else {
                    continue
                }
                let prevRow = stack.map { "\($0)\(char.element)" }
                levelColumn.append(contentsOf: prevRow)
            }
            stack = levelColumn
        }

        return stack
    }
}

class NumberToAlphabeticMapperTests: XCTestCase {
    func testZero() {
        let str = LetterCompination().letterCombinations("")
        XCTAssertEqual(str.count, 0)
    }

    func testExample() {
        let str = LetterCompination().letterCombinations("23")
        XCTAssertEqual(str.count, 9)
    }

    func testThreeDigits() {
        let str = LetterCompination().letterCombinations("234")
        XCTAssertEqual(str.count, 27)
    }

    func testOne() {
        let str = LetterCompination().letterCombinations("2")
        XCTAssertEqual(str.count, 3)
    }

    func testPerformanceExample() {
        measure {
            _ = LetterCompination().letterCombinations("234")
        }
    }
}
