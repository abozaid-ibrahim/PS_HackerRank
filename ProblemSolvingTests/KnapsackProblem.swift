//
//  KnapsackProblem.swift
//  ProblemSolvingTests
//
//  Created by abuzeid on 8/2/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

@testable import ProblemSolving
import XCTest

class KnapsackProblem: XCTestCase {
    func testExample1() {
//        let flatHas = [SItem(weight: 4, price: 15),
//                       SItem(weight: 5, price: 1),
//                       SItem(weight: 7, price: 4),
//                       SItem(weight: 10, price: 10),
//                       SItem(weight: 20, price: 20)]
//        XCTAssertEqual(knapsack2(items: flatHas, capacity: 12), 19)
        let flatHas2 = [SubSet.SItem(weight: 30, price: 120),
                        SubSet.SItem(weight: 20, price: 100),
                        SubSet.SItem(weight: 10, price: 60)]
        XCTAssertEqual(SubSet().knapsack(items: flatHas2, capacity: 50), 220)

//        let flatHas3 = [SItem(weight: 4, price: 12),
//                        SItem(weight: 5, price: 1),
//                        SItem(weight: 6, price: 4),
//                        SItem(weight: 10, price: 10),
//                        SItem(weight: 20, price: 20)]
//        XCTAssertEqual(knapsack(items: flatHas3, capacity: 12), 16)
//        let flatHas4 = [SItem(weight: 10, price: 3),
//                        SItem(weight: 7, price: 3),
//                        SItem(weight: 4, price: 6),
//                        SItem(weight: 8, price: 8)]
//
//        XCTAssertEqual(knapsack(items: flatHas4, capacity: 11), 9)
    }

    func testSub(){
        
        XCTAssertEqual(SubSet().longestSubSeq(s1: ["a","b","c","e", "f", "g"], s2: ["a","b","d","e", "f", "g"], index1: 0, index2: 0), 5)

    }
//    func testConnectedSub(){
//        XCTAssertEqual(SubSet().longestConnectedSubSeq(s1: ["a","h","c","d"], s2: ["a","b","c","d"], index1: 0, index2: 0), 2)
//
//    }

    func testExampleDP() {
        let flatHas = [SubSet.SItem(weight: 4, price: 15),
                       SubSet.SItem(weight: 5, price: 1),
                       SubSet.SItem(weight: 7, price: 4),
                       SubSet.SItem(weight: 10, price: 10),
                       SubSet.SItem(weight: 20, price: 20)]
        XCTAssertEqual(SubSet().knapsackWithDynamicProgramming(items: flatHas, capacity: 12), 19)
//        let flatHas2 = [SubSet.SItem(weight: 30, price: 120),
//                        SubSet.SItem(weight: 20, price: 100),
//                        SubSet.SItem(weight: 10, price: 60)]
//        XCTAssertEqual(SubSet().knapsackWithDynamicProgramming(items: flatHas2, capacity: 50), 220)
//
//        let flatHas3 = [SubSet.SItem(weight: 4, price: 12),
//                        SubSet.SItem(weight: 5, price: 1),
//                        SubSet.SItem(weight: 6, price: 4),
//                        SubSet.SItem(weight: 10, price: 10),
//                        SubSet.SItem(weight: 20, price: 20)]
//        XCTAssertEqual(SubSet().knapsackWithDynamicProgramming(items: flatHas3, capacity: 12), 16)
//        let flatHas4 = [SubSet.SItem(weight: 10, price: 3),
//                        SubSet.SItem(weight: 7, price: 3),
//                        SubSet.SItem(weight: 4, price: 6),
//                        SubSet.SItem(weight: 8, price: 8)]
//
//        XCTAssertEqual(SubSet().knapsackWithDynamicProgramming(items: flatHas4, capacity: 11), 9)
    }
}
