//
//  Swift3TestCase.swift
//  ProblemSolvingTests
//
//  Created by abuzeid on 10/23/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import XCTest

class Swift3TestCase: XCTestCase {
    func consecutive(num: Int,start:Int = 0, count:Int = 0) -> Int {
        // Write your code here
        var sum =  0
        var count = count
        for index in start...num/2{
              sum += index
            if sum == num{
                count += 1;
                sum = 0
            }else if sum < num{
              continue
                
            }else{
               return consecutive(num: num, start: start + 1, count: count)
            }
        }
        return count
    }
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
       XCTAssertEqual(consecutive(num: 21), 3)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
