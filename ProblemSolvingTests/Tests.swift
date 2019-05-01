//
//  Tests.swift
//  ProblemSolvingTests
//
//  Created by abuzeid on 4/26/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import XCTest

// The financial year starts from 1st of April to 31st of March the following year // Write a function which takes a date string in the format 'yyyy-mm-dd' and returns a string formatted as 'FY{StartYear}-{EndYear}' // e.g. 2018-05-01 => FY18-19 // e.g. 2018-03-01 => FY17-18



import Foundation
import XCTest

var inputsDateFormatter:DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-mm-dd"
    return dateFormatter
}


func getYearMinusBy(_ date:String, minus:Int = 0)->String?{
    guard let dateValue = inputsDateFormatter.date(from: date) else{
        return nil
    }
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yy"
    let year  =  dateFormatter.string(from: dateValue)
    let yearValue = Int(year)! - minus
    return "FY\(yearValue)-\(yearValue + 1 )"
}

func getBoundryFromat()->ClosedRange<Date>?{// we should use throw but to avoid time wasting I used optional
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "mm-dd"
    guard let from =  dateFormatter.date(from: "03-31"), let to  = dateFormatter.date(from: "04-01") else {
        return nil
    }
    return  to...from
}

extension String{
    func getFinancialYear()->String?{
        guard let dateBoundry = getBoundryFromat() else {return nil }
        guard  let inputDate  = inputsDateFormatter.date(from: self) else {
            return nil
        }
        // current date wich is in 2 18 belongs to 17 -- >1-4 31 2
        if dateBoundry ~= inputDate{//reverse the condition
            return getYearMinusBy(self,minus: 1)
        }else{
            return getYearMinusBy(self)
        }
    }
    
}


class Tests: XCTestCase {
    
    func testExample() {
        XCTAssertEqual("2018-04-05".getFinancialYear()!, "FY18-19")
        //
        //    func testExample() {
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
