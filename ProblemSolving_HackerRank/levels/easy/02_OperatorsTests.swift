//
//  02_OperatorsTests.swift
//  ProblemSolving_HackerRankTests
//
//  Created by abuzeid on 1/15/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import XCTest
@testable import ProblemSolving_HackerRank

class _2_OperatorsTests: XCTestCase {
    func test_percentCalculator(){
        let meal = MealCost(mealCost: 12, tipPercent: 20, taxPercent: 8)
        XCTAssertEqual(meal.getPercent(percent: 10, total: 100), 10)
    }
        func test_useCase(){
            let meal = MealCost(mealCost: 12, tipPercent: 20, taxPercent: 8)
            XCTAssertEqual(meal.totalCost(), 15)
        }
    
   
    func test_useCase2(){
        let meal = MealCost(mealCost: 15.50, tipPercent: 15, taxPercent: 10)
        XCTAssertEqual(meal.totalCost(), 19)
    }
    
}
