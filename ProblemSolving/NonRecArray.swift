//
//  NonRecArray.swift
//  ProblemSolvingTests
//
//  Created by abuzeid on 5/29/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import XCTest

class NonRecArray: XCTestCase {
    func getNonRec(list: [Int]) -> Set<Int> {
        let sorted = list.sorted()
        var set = Set<Int>()
        for item in sorted {
            let items = sorted.filter { $0 == item }
            if items.count == 1 {
                set.insert(item)
            }
        }
        return set
    }

    func getNonRecA(list: [Int]) -> Set<Int> {
        let sorted = list.sorted()
        var set = Set<Int>()
        var previous: Int!
        var next: Int!
        for (index, item) in sorted.enumerated() {
            if index < (sorted.count - 1) {
                next = sorted[index + 1]
            }
            if (item != next) && (item != previous) {
                set.insert(item)
            }
            previous = item
        }
        return set
    }

    func testExample() {
//        let x = getNonRec(list: [5, 5, 3, 5, 4, 2, 3, 1])
//        XCTAssertEqual(x.0, 1)
//        XCTAssertEqual(x.1, 2)
        let x2 = getNonRecA(list: [5, 5, 3, 5, 4, 2, 1, 3, 1, 3, 5, 0])
        print(x2)
    }
}
