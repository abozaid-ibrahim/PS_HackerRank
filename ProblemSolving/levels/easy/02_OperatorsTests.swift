//
//  02_OperatorsTests.swift
//  ProblemSolvingTests
//
//  Created by abuzeid on 1/15/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

@testable import ProblemSolving
import XCTest

class _2_OperatorsTests: XCTestCase {
    func test_percentCalculator() {
        let meal = MealCost(mealCost: 12, tipPercent: 20, taxPercent: 8)
        XCTAssertEqual(meal.getPercent(percent: 10, total: 100), 10)
    }

    func test_useCase() {
        let meal = MealCost(mealCost: 12, tipPercent: 20, taxPercent: 8)
        XCTAssertEqual(meal.totalCost(), 15)
    }

    func test_useCase2() {
        let meal = MealCost(mealCost: 15.50, tipPercent: 15, taxPercent: 10)
        XCTAssertEqual(meal.totalCost(), 19)
    }
}
