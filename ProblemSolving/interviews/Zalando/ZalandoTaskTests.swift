//
//  ZalandoTaskTests.swift
//  ProblemSolvingTests
//
//  Created by abuzeid on 4/18/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import XCTest
public func solution(_ A : inout [Int]) -> Int {
    if A.isEmpty{return 0}
    var fistTimeToAllShines :Int!
    var secondTimeToAllShines:Int!
    var onLambs :[Int] = []
    for (index,lamb) in A.enumerated(){
        onLambs.append(lamb)
        var allPrevIsON = true
        
        for o in 0..<lamb{
            if !onLambs.contains(A[o]){
                allPrevIsON = false
                break
            }
        }
        if allPrevIsON{
            if fistTimeToAllShines == nil {
                fistTimeToAllShines = lamb
            }else{
                if secondTimeToAllShines == nil{
                    secondTimeToAllShines = lamb
                }
            }
        }
        
        
        
    }
    return secondTimeToAllShines - fistTimeToAllShines
}
class ZalandoTaskTests: XCTestCase {
  
}
