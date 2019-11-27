//
//  StringFind.swift
//  ProblemSolvingTests
//
//  Created by abuzeid on 10/27/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import XCTest

class StringFind: XCTestCase {
//    https://leetcode.com/problems/substring-with-concatenation-of-all-words/submissions/
    class Solution {
        func findSubstring(_ s: String, _ words: [String]) -> [Int] {
            var currentWordIndex = 0
            let wordSize = words.first!.count
            var findedWrods: [(String, Int)] = []
            var result: [Int] = []
            let queue = DispatchQueue(label: "sdgf")
            queue.async {
                  print(">>aysnc1")
                queue.sync {
                       print(">>DEADLock")
                }
             print(">>aysnc2")
            }
            
            while currentWordIndex < (s.count - wordSize) {
                let currentWord = String(s[currentWordIndex..<currentWordIndex + wordSize])
                if words.contains(currentWord) {
                    if findedWrods.contains(where: { $0.0 == currentWord }) {
                        findedWrods.removeAll()
                    } else {
                        findedWrods.append((currentWord, currentWordIndex))
                        if findedWrods.count == words.count {
                            result.append(findedWrods.min(by: { $0.1 < $1.1 })!.1)
                            findedWrods.removeAll()
                        }
                    }

                } else {
                    findedWrods.removeAll()
                }
                currentWordIndex += wordSize
            }
            return result
        }
    }

    func testExample() {
        XCTAssertEqual(Solution().findSubstring("barfoothefoobarman", ["foo", "bar"]), [0, 9])
    }
}
