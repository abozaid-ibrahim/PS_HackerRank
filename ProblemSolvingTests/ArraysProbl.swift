//
//  Int.swift
//  ProblemSolvingTests
//
//  Created by abuzeid on 11/3/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import XCTest

class ArraysPro: XCTestCase {


    func getFirstTwoItemsWithoutPair(list: [Int]) -> [Int] {
        let count = INT_MAX
        var founded  :[Int] = []
        for x in 0...INT64_MAX{
            founded.append(0)
        }
        var uniques:[Int] = []
        for item in list.enumerated(){
            founded[item.element] =  founded[item.element] + 1
        }
        for item in list.enumerated(){
            if  founded[item.element] ==  1{
                uniques.append(item.element)
            }
        }
        

        return uniques
    }



    func testExample() {
let x = getFirstTwoItemsWithoutPair(list: [23,23,5,1,2,3,4,6,5,2,0,1])
        XCTAssertEqual(x, [3,4,6,0])
    }

   

}
