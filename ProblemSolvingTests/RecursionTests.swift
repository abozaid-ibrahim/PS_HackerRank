//
//  RecursionTests.swift
//  ProblemSolvingTests
//
//  Created by abuzeid on 8/8/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

@testable import ProblemSolving
import XCTest

class RecursionTests: XCTestCase {
    func testExample() {
        var name = "abuzeid".charArray
        Rec().reverseString(&name)
        XCTAssertEqual(name, "diezuba".charArray)
    }
}
