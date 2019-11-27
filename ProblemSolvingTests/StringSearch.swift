//
//  StringSearch.swift
//  ProblemSolvingTests
//
//  Created by abuzeid on 10/23/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import XCTest

class StringSearch: XCTestCase {
    func programmerStrings(s: String) -> Int {
        let st = "programmer".charArray
        
        var word = st.enumerated().makeIterator()
        
        var lastRIndex = 0
        var SecondPIndex = 0
        var char =  word.next()
        for (index, value) in s.enumerated(){
            if  "\(value)" == char!.element {
                 char =  word.next()
                lastRIndex = index
                if char == nil{
                break
                }
            }else{
                continue
            }
        }
        
        let end = s.count -  lastRIndex
        let given = s.charArray
var nTarget = "\(s.last!)"
        var nIndex = st.count - 1
        for index in 0..<s.count{
            if "\(given[end - (index+1)])" == nTarget {
                nIndex -= 1
                nTarget = st[nIndex]
                if nIndex == 0{
                SecondPIndex =  index
                    
                    break}
            }else{
                continue
            }
        }
        
        return SecondPIndex - lastRIndex
        
    }
    
    

    func testExample() {
        XCTAssertEqual(programmerStrings(s: "progxrammerrxproxgrammer"), 2)
    }


}
