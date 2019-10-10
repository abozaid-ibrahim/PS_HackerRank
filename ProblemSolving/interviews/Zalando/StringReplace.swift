//
//  StringReplace.swift
//  ProblemSolvingTests
//
//  Created by abuzeid on 9/29/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import XCTest

class StringReplace: XCTestCase {
    func testExample() {
        var x = "?"
        XCTAssertEqual(solution(&x), "a")
    }
}

func randomChar(except: String) -> String {
    var letters = "abcdefghijklmnopqrstuvwxyz"

    for char in except {
        if let dx = letters.lastIndex(of: char) {
            letters.remove(at: dx)
        }
    }
    return String((0..<1).map { _ in letters.randomElement()! })
}

public func solution(_ S: inout String) -> String {
    if S.isEmpty {
        return ""
    }
    var phoneNumber = ""
    var index = 0
    let chars = S.charArray
    while index < chars.count {
        if chars[index] == "?" {
            var ex = ""
            if index > 0 {
                ex += String(chars[index - 1])
            }
            if index < chars.count {
                ex += String(chars[index + 1])
            }
            phoneNumber.append(randomChar(except: ex))

        } else {
            phoneNumber.append(String(chars[index]))
        }
        index += 1
    }
    return phoneNumber
}
