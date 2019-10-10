
//
//  TreeTests.swift
//  ProblemSolvingTests
//
//  Created by abuzeid on 8/5/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

@testable import ProblemSolving
import XCTest

class TreeTests: XCTestCase {
    func testSameTrees() {
        let t1 = TreeNode(4)
        let t2 = TreeNode(4)
        
        let t10 = TreeNode(5)
        let t11 = TreeNode(6)
        
        let t12 = TreeNode(7)
        let t13 = TreeNode(9)
        t1.left = t12
        t1.right = t11
        t1.left?.left = t10
        t1.right?.right = t13
        
        t2.left = t12
        t2.right = t11
        t2.left?.left = t10
        t1.right?.right = t13
        XCTAssertEqual(Tree().sameBinaryTree(tree1: t1, tree2: t2), true)
    }
    
    func testPostOrderTraverssalARr() {
        let root = TreeNode(1)
        let left = TreeNode(2)
        let right = TreeNode(3)
        
        let t11 = TreeNode(4)
        let t12 = TreeNode(5)
        root.left = left
        root.right = right
        root.left?.left = t11
        root.right?.right = t12
        
        XCTAssertEqual(Tree().postOrderTre(root), [[1], [2, 3], [4, 5]])
    }
    
    func testSerielization() {
        let root = TreeNode(1)
        let left = TreeNode(2)
        let right = TreeNode(3)
        
        let t11 = TreeNode(4)
        let t12 = TreeNode(5)
        root.left = left
        root.right = right
        root.left?.left = t11
        root.right?.right = t12
        let t = Tree()
        t.serialize(root: root)
        XCTAssertEqual(t.heap, "12345")
    }
    
    func testIsSubTree() {
        let root = TreeNode(3)
        let left = TreeNode(4)
        let right = TreeNode(5)
        
        let t11 = TreeNode(1)
        let t12 = TreeNode(2)
        root.left = left
        root.right = right
        root.left?.left = t11
        root.right?.right = t12
        
        let left2 = TreeNode(4)
        let subRight = TreeNode(1)
        let subLeft = TreeNode(2)
        left2.left = subRight
        left2.right = subLeft
        XCTAssertEqual(Tree().isSubtree(root, left2), true)
    }
}
