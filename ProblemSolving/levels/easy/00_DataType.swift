//
//  00_DataType.swift
//  ProblemSolving
//
//  Created by abuzeid on 1/3/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import Foundation
var i = 4
var d = 4.0
var s = "HackerRank "
import Foundation
struct DataTypeProblem {
    var i: Int
    var d: Double
    var s: String
    func step1(input: Int) -> Int {
        return i + input
    }

    func step2(newInput: Double) -> String {
        let doubleStr = String(format: "%.1f", newInput + d) // "3.14"
        return doubleStr
        //        let newy = (newInput * 10)
        //        let y = floor(newInput) //Double(round(10*newInput)/10)
        //        return d + y
    }

    func step3(newInput: String) -> String {
        return s + newInput
    }

    func printValues(i: Int, d: Double, s: String) {
        let value1 = step1(input: i)
        let value2 = step2(newInput: d)
        let value3 = step3(newInput: s)
        print(value1)
        print(value2)
        print(value3)
    }
}

func main_00() {
    guard let iInput = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    guard let dInput = Double((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    let sInput = String((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)

    let obj = DataTypeProblem(i: i, d: d, s: s)
    obj.printValues(i: iInput, d: dInput, s: sInput)
}
