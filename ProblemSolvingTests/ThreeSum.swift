//
//  ThreeSum.swift
//  ProblemSolvingTests
//
//  Created by abuzeid on 6/10/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import Foundation
import XCTest

class ThreeSum: XCTestCase {
    //threeSum([-3, -2, 1, -2, -4, -3, 1, 2, 3, 4, 5, 6, 7], target: 3)

    func twoSum(x: [Int], target: Int) -> [(Int, Int)] {
        var output: [(Int, Int)] = []
        let sortedUniqueArr = x.sorted().unique()
        let currentIndex = sortedUniqueArr.startIndex
        while currentIndex < sortedUniqueArr.endIndex {
            let item = sortedUniqueArr[currentIndex]
            let nextIndex = currentIndex + 1
            while nextIndex < sortedUniqueArr.endIndex {
                if item + sortedUniqueArr[nextIndex] == target {
                    output.append((sortedUniqueArr[currentIndex], sortedUniqueArr[nextIndex]))
                    break
                }
            }
        }

        return output
    }

    func testExample() {
        let x = self.twoSum(x: [-3, -2, 1, -2, -4, -3, 1, 2, 3, 4, 5, 6, 7], target: 3)
        print(x)
//        XCTAssertEqual(x.count, 3)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}

extension Array where Element: Equatable {
    func unique() -> Array {
        var output: [Element] = []
        output.reserveCapacity(self.count)
        var lastUniqeItem = self.first!
        output.append(lastUniqeItem)
        for item in self {
            if item != lastUniqeItem {
                output.append(item)
            }
            lastUniqeItem = item
        }
        return output
    }
}
