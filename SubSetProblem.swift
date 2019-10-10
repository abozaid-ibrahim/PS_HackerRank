//
//  SubSetProblem.swift
//  ProblemSolvingTests
//
//  Created by abuzeid on 8/4/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import XCTest

class SubSetProblem: XCTestCase {
    var data = [5, 2, 7, 3, 4, 5, 6]
    lazy var count = data.count

    func LIST(index: Int, prev: Int) -> Int {
        print("ccindex \(index)")
        if count == index {
            return 0
        }
        let choice1 = LIST(index: index + 1, prev: prev)
        var choice2 = 0
        if prev == count || data[prev] <= data[index] {
            choice2 = LIST(index: index + 1, prev: data[index]) + 1
        }
        print("ccchoice1 \(choice1) ch2 \(choice2)")
        return choice1
    }

    func testExample() {
        let sm = LIST(index: 0, prev: data.count)
        XCTAssertEqual(sm, 5)
    }
}
