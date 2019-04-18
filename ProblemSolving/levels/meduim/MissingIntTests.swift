//
//  MissingInt.swift
//  ProblemSolvingTests
//
//  Created by abuzeid on 4/18/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import XCTest
@testable import ProblemSolving

class MissingInt: XCTestCase {

    func test_allNegative(){
        var a =  [1,2,3,4,5,5,7]
        XCTAssertEqual(solution(&a), 6)
    }
    func test_allNegative2(){
        var a =  [1,3,4,5,5,7]
        XCTAssertEqual(solution(&a), 2)
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
