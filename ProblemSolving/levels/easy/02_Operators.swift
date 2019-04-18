//
//  02_Operators.swift
//  ProblemSolving
//
//  Created by abuzeid on 1/15/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import Foundation
struct MealCost{
    let mealCost:Double
    let tipPercent:Int
    let taxPercent:Int
    
    func totalCost() ->Int  {
        let tip = getPercent(percent: tipPercent, total: mealCost)
        let tax = getPercent(percent: taxPercent, total: mealCost)
        let sum =  mealCost + tip + tax
        return Int(round(sum))
    }
    func getPercent(percent:Int,total:Double)->Double{
        return (Double(percent)*total) / 100.0
    }
  
}

