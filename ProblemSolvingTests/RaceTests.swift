//
//  RaceTests.swift
//  ProblemSolvingTests
//
//  Created by abuzeid on 10/23/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import XCTest

class RaceTests: XCTestCase {
  
    func winner(erica: String, bob: String) -> String {
        var index = 0
        let length = erica.count
        let bobCount = bob.count
        var ericaSum = 0
        var bobSum = 0
        let bobs = bob.charArray
        let er = erica.charArray
        while index < max(length, bobCount) {
            if index < bobCount{
            bobSum += getValue(bobs[index])
            }
            if index < length{
            ericaSum += getValue(er[index])
            }
            index += 1
        }
        if bobSum > ericaSum{
            return "Bob"
        }else if ericaSum > bobSum{
            return "Erica"
        }else {
            return "Tie"
        }
        
    }

    func getValue(_ digit: String) -> Int {
        switch digit {
        case "E":
            return 1
        case "M":
            return 3
        case "H": return 5
        default:
            return 0
        }
    }

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
extension String {
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }
    
    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
}
