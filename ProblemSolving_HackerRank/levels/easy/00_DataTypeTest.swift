//
//  00_DataTypeTest.swift
//  ProblemSolving_HackerRank
//
//  Created by abuzeid on 1/3/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import XCTest
@testable import ProblemSolving_HackerRank
class DataTypeProblemTest: XCTestCase {
    func test_useCase(){
        let data = DataTypeProblem(i: 12, d: 4, s: "Hacker")
        XCTAssertEqual(data.step1(input: 4), 16)
         XCTAssertEqual(data.step2(newInput: 5), 9)
         XCTAssertEqual(data.step3(newInput: " is Great"), "Hacker is Great")
    }
    
    func test_scaleDoubleByOneDigit(){
        let data = DataTypeProblem(i: 4, d: 4.0, s: "HackerRank ")
        XCTAssertEqual(data.step2(newInput: 2.08) , 6.1)
         XCTAssertEqual(data.step2(newInput: 2.0108) , 6.0)
    }

    func test_useCase2(){
        let data = DataTypeProblem(i: 4, d: 4.0, s: "HackerRank ")
        
        XCTAssertEqual("\(data.step1(input: 3))", "7")
        XCTAssertEqual("\(data.step2(newInput: 2.08))" , "6.1")
        XCTAssertEqual(data.step3(newInput: "is my favorite platform!"), "HackerRank is my favorite platform!")
    }
    
}

