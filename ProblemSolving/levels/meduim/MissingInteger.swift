//
//  MissingInteger.swift
//  ProblemSolving
//
//  Created by abuzeid on 4/18/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

public func solution(_ A : inout [Int]) -> Int {
    
    let sorted = A.filter{$0>0}.sorted()
    if sorted.isEmpty {return 1}
    
    var currentPointer = sorted.first!
    if currentPointer > 1{
        return 1
    }
    var target:Int! = nil
    var lastValidInt = sorted.first!
    for item in sorted{
        if item == currentPointer {
            lastValidInt = item
        }else if item == (currentPointer + 1 ){//next
            lastValidInt = item
            currentPointer += 1
        } else if item > (currentPointer + 1 ){
            target = lastValidInt  + 1
            break
        }
    }
    
    if let myTarget = target {
        return myTarget
    }
    guard let first = sorted.first else {
        return 1
    }
    if first > 1 {
        return 1
    }
    guard let last = sorted.last else {
        return 1
    }
    
    return last + 1
    
}
