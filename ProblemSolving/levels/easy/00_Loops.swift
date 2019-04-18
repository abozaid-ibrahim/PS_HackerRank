//
//  00_Loops.swift
//  ProblemSolving
//
//  Created by abuzeid on 1/17/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import Foundation

class Multiplier{
    
    func getMultipliers(_ item:Int){
        guard item >= 2 && item < 20 else{
            return
        }
        for indx in 1...10{
            print("\(item) * \(indx) = \(item*indx)")
        }
    }
    
}

