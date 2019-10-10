//
//  MedianOfTwoSortedArrayies.swift
//  ProblemSolvingTests
//
//  Created by abuzeid on 7/31/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import XCTest

class MedianSolution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        if nums1.isEmpty {
            return nums2.findMedianOfSortedArray()
        } else if nums2.isEmpty {
            return nums1.findMedianOfSortedArray()
        }

        var n1Index = 0
        var n2Index = 0
        var mergedArra: [Int] = []
        mergedArra.reserveCapacity(nums2.count + nums1.count)
        while n1Index < nums1.count && n2Index < nums2.count {
            if nums1[n1Index] < nums2[n2Index] {
                mergedArra.append(nums1[n1Index])
                n1Index += 1
            } else if nums2[n2Index] < nums1[n1Index] {
                mergedArra.append(nums2[n2Index])
                n2Index += 1
            } else {
                mergedArra.append(nums1[n1Index])
                n1Index += 1
                mergedArra.append(nums2[n2Index])
                n2Index += 1
            }
        }
        mergedArra.append(contentsOf: nums1[n1Index...])
         mergedArra.append(contentsOf: nums2[n2Index...])
        return mergedArra.findMedianOfSortedArray()
    }
}

extension Collection where Index == Int, Iterator.Element == Int {
    func findMedianOfSortedArray(start: Int = 0) -> Double {
        if self.isEmpty {
            return 0
        }
        if count % 2 == 0 {
            let m2 = (count + 1) / 2
            return Double(self[m2] + self[m2 - 1]) / 2
        } else {
            return Double(self[count / 2])
        }
    }
}

class MedianOfTwoSortedArrayies: XCTestCase {
    func testExample() {
        let arr1 = [1, 2, 3]
        let arr2 = [7, 8, 9]
        let result = MedianSolution().findMedianSortedArrays(arr1, arr2)
        XCTAssertEqual(result, 5)
        let result2 = MedianSolution().findMedianSortedArrays([], arr2)
        XCTAssertEqual(result2, 8)
        let result3 = MedianSolution().findMedianSortedArrays([3], [-2, -1])
        XCTAssertEqual(result3, -1)
    }

    func testMedianOfOneArray() {
        let arr1 = [1, 2, 3]
        let arr2 = [7, 8, 9, 6]
        XCTAssertEqual(arr1.findMedianOfSortedArray(), 2)
        XCTAssertEqual(arr2.findMedianOfSortedArray(), 8.5)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
