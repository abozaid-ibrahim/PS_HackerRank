//
//  PalandromicString.swift
//  ProblemSolving
//
//  Created by abuzeid on 4/20/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import XCTest
extension String {
    subscript(index: Int) -> Character {
        let _index = self.index(startIndex, offsetBy: index)
        return self[_index]
    }
}

func subString(str: String, r: Range<Int>) -> String {
    var sum = ""
    for char in r.lowerBound ... r.upperBound {
        sum += Array(str).map { String($0) }[char]
    }
    return sum
}

func isPlandrom(_ input: String, _ startIndex: Int, _ lastIndex: Int) -> Bool {
    if startIndex >= lastIndex {
        return true
    }
    if input[startIndex] == input[lastIndex] {
        return isPlandrom(input, startIndex + 1, lastIndex - 1)
    } else {
        return false
    }
}

func findAllPalindromesUsingBruteForceApproach(input: String) -> Set<String> {
    var palindromes: Set<String> = Set<String>()
    /// faceee
    for (i, _) in input.enumerated() {
        for j in i + 1 ..< input.count {
            //        for (int j = i + 1; j <= input.length(); j++) {
            if isPalindrome(subString(str: input, r: i ..< j)) {
                palindromes.insert(subString(str: input, r: i ..< j))
            }
        }
    }
    return palindromes
}

func isPalindrome(_ s: String) -> Bool {
    return s == String(s.reversed())
}

class Solution {
    func longestPalindrome(_ s: String) -> String {
        if s.count < 2 {
            return s
        }

        var low = 0
        var maxL = 0
        var count = 1
        let word = Array(s)
        for i in 0 ..< word.count - 1 {
            checkSubString(i, i, word, &low, &maxL)
            checkSubString(i, i + 1, word, &low, &maxL)
        }
        return String(word[low ..< low + maxL])
    }

    func checkSubString(_ i: Int, _ j: Int, _ s: [Character], _ low: inout Int, _ maxL: inout Int) {
        var x = i
        var y = j
        while x >= 0, y < s.count, s[x] == s[y] {
            x -= 1
            y += 1
        }

        if maxL < y - x - 1 {
            low = x + 1
            maxL = y - x - 1
        }
    }
}

func longestPalind(_ s: String) -> String {
    return findAllPalindromesUsingBruteForceApproach(input: s).max(by: { $1.count > $0.count }) ?? ""
}

class longestPalindromicTests: XCTestCase {
    func test() {
        XCTAssertEqual(longestPalind("aabaas"), "aabaa")
        //        XCTAssertEqual(longestPalind("ac"), "a")
        //        XCTAssertEqual(longestPalind("a"), "a")
        //        XCTAssertEqual(longestPalind("abcda"), "a")
        XCTAssertEqual(longestPalind("aaabaafannnafas"), "afannnafa")
        //        XCTAssertEqual(longestPalind("babad"), "aba")
        XCTAssertEqual(longestPalind("cbbd"), "bb")
        XCTAssertEqual(longestPalind("aaaab"), "aaaa")
        XCTAssertEqual(longestPalind("aaaa"), "aaaa")
        XCTAssertEqual(longestPalind("tattarrattat"), "tattarrattat")
        XCTAssertEqual(longestPalind("atattarrattat"), "tattarrattat")
    }
}
