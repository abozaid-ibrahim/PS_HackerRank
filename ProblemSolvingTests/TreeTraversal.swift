//
//  TreeTraversal.swift
//  ProblemSolvingTests
//
//  Created by abuzeid on 7/31/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import XCTest
private class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

private class TreeTraversalSolution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var results: [Int] = []
        if root == nil {
            return []
        }
        results.append(contentsOf: inorderTraversal(root?.left))
        results.append(root!.val)
        results.append(contentsOf: inorderTraversal(root?.right))
        return results
    }

    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let node = root else {
            return true
        }
        if node.left == nil && node.right == nil {
            return true
        }
        if let lvalue = node.left {
            if lvalue.val >= node.val {
                return false
            }
        }
        if let rvalue = node.right {
            if rvalue.val <= node.val {
                return false
            }
        }

        return isValidBST(node.left) && isValidBST(node.right)
    }
}

class TreeTraversal: XCTestCase {
    func testExample() {
        let tree = TreeNode(1)
        tree.left = TreeNode(2)
        tree.right = TreeNode(3)
        tree.left?.left = TreeNode(4)
        tree.left?.right = TreeNode(5)
        XCTAssertEqual(TreeTraversalSolution().inorderTraversal(tree), [4, 2, 5, 1, 3])
    }

    func testValidation() {
        let tree = TreeNode(7)
        tree.left = TreeNode(5)
        tree.right = TreeNode(9)
        tree.left?.left = TreeNode(4)
        tree.left?.right = TreeNode(6)
        XCTAssertEqual(TreeTraversalSolution().isValidBST(tree), true)
        
        let tree1 = TreeNode(1)
        tree1.right = TreeNode(1)
        XCTAssertEqual(TreeTraversalSolution().isValidBST(tree1), false)
        
        let tree2 = TreeNode(1)
        tree2.left = TreeNode(1)
        XCTAssertEqual(TreeTraversalSolution().isValidBST(tree2), false)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
