//
//  SubSequence.swift
//  ProblemSolving
//
//  Created by abuzeid on 8/4/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import Foundation
class SubSet {
    struct SItem: Hashable {
        let weight: Float
        let price: Float
    }

//    func knapsack(items: [SItem], capacity: Float, start: Int = 0) -> Float? {
//        if start == items.count {
//            return nil
//        }
//        // if items out of scope return nil
//
//        var allOptions: Set<Float> = Set()
//        var leftCapacity = capacity
//        var sum: Float = 0
//        for i in start..<items.count {
//            if leftCapacity >= items[i].weight {
//                sum += items[i].price
//                leftCapacity -= items[i].weight
//            }
//        }
//        allOptions.insert(sum)
//        if let value = knapsack(items: items, capacity: leftCapacity, start: start + 1) {
//            allOptions.insert(value)
//        }
//        return allOptions.max()
//    }
//
    func knapsack(items: [SItem], capacity: Float, index: Int = 0) -> Float {
        print(#function)
        // base
        if index == items.count {
            return 0
        }
        // leave
        let valueWithLeavingItem = knapsack(items: items, capacity: capacity, index: index + 1)
        var valueAfterPicking = Float(0)
        // pick
        if capacity >= items[index].weight {
            valueAfterPicking = knapsack(items: items, capacity: capacity - items[index].weight, index: index + 1) + items[index].price
        }

        return max(valueWithLeavingItem, valueAfterPicking)
    }

    func knapsack(arr: [Int], capacity: Float, index: Int = 0) -> Float {
        print(#function)
        // base
        if index == arr.count {
            return 0
        }
//        // leave
//        let valueWithLeavingItem = knapsack(arr: arr, capacity: capacity, index: index + 1)
//        var valueAfterPicking = Float(0)
//        // pick
//        if capacity >= arr[index].weight {
//            valueAfterPicking = knapsack(arr: arr, capacity: capacity - arr[index].weight, index: index + 1) + arr[index].price
//        }
//
//        return max(valueWithLeavingItem, valueAfterPicking)
        return 0
    }

//    func unboundedKnapsack(k: Int, arr: [Int]) -> Int {
//
//
//    }
    // var/// max
    func longestSubSeq(s1: [Character], s2: [Character], index1: Int, index2: Int) -> Int {
        // base
        if index1 == s1.count || index2 == s2.count {
            return 0
        }
        print("index \(index1) \(index2)")
        if s1[index1] == s2[index2] {
            return 1 + longestSubSeq(s1: s1, s2: s2, index1: index1 + 1, index2: index2 + 1)
        }

        let nextCharINS1 = longestSubSeq(s1: s1, s2: s2, index1: index1 + 1, index2: index2)
        let nextCharINS2 = longestSubSeq(s1: s1, s2: s2, index1: index1, index2: index2 + 1)

        return max(nextCharINS1, nextCharINS2)
    }

    var biggest = 0
    func longestConnectedSubSeq(s1: [Character], s2: [Character], index1: Int, index2: Int) -> Int {
        // base
        if index1 == s1.count || index2 == s2.count {
            return 0
        }
        if s1[index1] == s2[index2] {
            /// abcd, ahcd
            let newMax = longestConnectedSubSeq(s1: s1, s2: s2, index1: index1 + 1, index2: index2 + 1)
            biggest = max(biggest, newMax)
        } else {
            _ = longestConnectedSubSeq(s1: s1, s2: s2, index1: index1 + 1, index2: index2 + 1)
        }

        return biggest
    }

    var setsRepo: [Float] = Array(repeating: -1, count: 20)
    func knapsackWithDynamicProgramming(items: [SItem], capacity: Float, index: Int = 0) -> Float {
        print(#function)

        // base
        if index == items.count {
            return 0
        }
        // leave
        var valueWithLeavingItem: Float = 0
        if setsRepo[index] == -1 {
            print("saveindex> \(index)")
            valueWithLeavingItem = knapsackWithDynamicProgramming(items: items, capacity: capacity, index: index + 1)
            setsRepo[index] = valueWithLeavingItem
        } else {
            valueWithLeavingItem = setsRepo[index]
            print("saved> \(index) with value \(valueWithLeavingItem)")
        }
        var valueAfterPicking = Float(0)
        // pick
        if capacity >= items[index].weight {
            valueAfterPicking = knapsackWithDynamicProgramming(items: items, capacity: capacity - items[index].weight, index: index + 1) + items[index].price
        }

        return max(valueWithLeavingItem, valueAfterPicking)
    }

    func partition(_ left: [Int], choosed: [Int] = [], index: Int = 0) -> Bool {
        if (index + 1) >= left.count + choosed.count {
            return false
        }
        var pck: [Int] = [left[index - choosed.count]]
        pck.append(contentsOf: choosed)
        var rest = left
        rest.remove(at: index - choosed.count)
        print("dx> \(index)")

        if pck.reduce(0, +) == rest.reduce(0, +) {
            return true
        }
        let ch2 = partition(rest, choosed: pck, index: index + 1) // pick
        if ch2 {
            return true
        }
        print("index> \(index), left: \(left.count) choosed: \(choosed.count)")
        return partition(left, choosed: choosed, index: index + 1) // leave
    }
}
