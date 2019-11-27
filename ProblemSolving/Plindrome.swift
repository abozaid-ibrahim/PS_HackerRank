//
//  Plindrome.swift
//  ProblemSolvingTests
//
//  Created by abuzeid on 8/21/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//
class PlindSolution {
//    func isPalindrome(_ s: String) -> Bool {
//        if s.isEmpty{
//            return true
//        }
//        var index = 0
//        var rIndex  = s.count - 1
//        let stopPoint = rIndex / 2
//        while index < stopPoint && rIndex > 0{
//            if !s[index].isLetter{
//                index  += 1
//                continue
//            }
//            if !s[rIndex].isLetter{
//                rIndex  -= 1
//                continue
//            }
//            if s[index] != s[rIndex]{
//                return false
//            }
//            index += 1
//            rIndex -= 1
//        }
//        return true
//    }
   
}

import XCTest

class Plindrome: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
