//
//  RingInterView.swift
//  ProblemSolvingTests
//
//  Created by abuzeid on 4/25/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import Foundation
import XCTest

enum Axe {
    case x, y
}

struct Point {
    let x: Int
    let y: Int
}

struct Move {
    let steps: Int
    let direction: Axe
}

func getLastMove(stream: String) -> Point {
    let xBoundry = 0 ... 10
    let yBoundry = 0 ... 10

    var xOutput = 0
    var yOutput = 0
    if stream.isEmpty {
        return Point(x: xOutput, y: yOutput)
    }
    let moves = stream.split(separator: " ")
    for move in moves {
        guard let oneMove = getStepsAndDirection(String(move)) else {
            continue
        }
        if oneMove.direction == Axe.x {
            let nextMove = xOutput + oneMove.steps
            if xBoundry ~= nextMove { // ~= means in the range
                xOutput += oneMove.steps
            }
        } else if oneMove.direction == Axe.y {
            let nextMove = yOutput + oneMove.steps
            if yBoundry ~= nextMove {
                yOutput += oneMove.steps
            }
        }
    }
    return Point(x: xOutput, y: yOutput)
}

func getStepsAndDirection(_ move: String) -> Move? {
    let pattern = "[^-|\\d]"
    guard let directionRange = move.range(of: pattern, options: .regularExpression) else {
        return nil
    }

    guard let steps = Int(move.dropLast()) else {
        return nil
    }
    let direction = move[directionRange]
    var stepsInAxe: Int!
    var dir: Axe!
    if direction == "U" {
        stepsInAxe = steps
        dir = .y
    } else if direction == "D" {
        stepsInAxe = -steps
        dir = .y
    } else if direction == "L" {
        stepsInAxe = -steps
        dir = .x
    } else if direction == "R" {
        stepsInAxe = steps
        dir = .x
    }
    return Move(steps: stepsInAxe, direction: dir)
}

class RingInterView: XCTestCase {
    func testGettingDirection() {
        XCTAssertEqual(getStepsAndDirection("2U")!.steps, 2)
        XCTAssertEqual(getStepsAndDirection("2U")!.direction, Axe.y)
    }

    func testLastMoveUpOnly() {
        XCTAssertEqual(getLastMove(stream: "1U 1U 2U").y, 4)
        XCTAssertEqual(getLastMove(stream: "1U 1U 2U").x, 0)
    }

    func testLastMoveInFourDirection() {
        //        4U, 2L 2R 4D = Zero Zero
        let coordinates = getLastMove(stream: "1U 1U 2U 2L 2R 4D")
        XCTAssertEqual(coordinates.x, 2)
        XCTAssertEqual(coordinates.y, 0)
    }

    func testLastMoveDropLargeMove() {
        let coordinates = getLastMove(stream: "1U 1U 2U 2L 13R 2R 4D")
        XCTAssertEqual(coordinates.x, 2)
        XCTAssertEqual(coordinates.y, 0)
    }

    func testPerformanceExample() {
        measure {
            _ = getLastMove(stream: "1U 1U 2U 2L 13R 2R 4D 1U 1U 2U 2L 13R 2R 4D")
        }
    }
}
