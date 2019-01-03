//
//  00_DataType.swift
//  ProblemSolving_HackerRank
//
//  Created by abuzeid on 1/3/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import Foundation

struct DataTypeProblem{
    var i:Int
    var d:Double
    var s:String
    
    func step1(input:Int)->Int{
        return i + input
    }
    func step2(newInput:Double)->Double{
        let y = Double(round(10*newInput)/10)
        return d + y
    }
    func step3(newInput:String)->String{
        return s + newInput
    }
    
    func printValues(i:Int,d:Double,s:String){
        let value1 = self.step1(input: i)
        let value2 =   self.step2(newInput: d)
        let value3 = self.step3(newInput: s)
        print(value1)
        print(value2)
        print(value3)
    }
    
}
