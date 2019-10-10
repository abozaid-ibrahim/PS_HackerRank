//
//  File.swift
//  ProblemSolving
//
//  Created by abuzeid on 8/5/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import Foundation
public class TreeNode {
    public var val: Int
    var visited: Bool = false
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Tree {
    func sameBinaryTree(tree1: TreeNode?, tree2: TreeNode?) -> Bool {
        // base case
        if tree1 == nil && tree2 == nil {
            return true
        } else if (tree1 == nil) || (tree2 == nil) {
            return false
        }

        let values = tree1!.val == tree2!.val

        let leftNodes = sameBinaryTree(tree1: tree1!.left, tree2: tree2!.left)
        let rNodes = sameBinaryTree(tree1: tree1?.right, tree2: tree2?.right)
        return values && leftNodes && rNodes
    }

    // inorder traversal, pre, post
    func postOrderTreeTraversal(_ root: TreeNode?) -> [[Int]] {
        let queue = Queue<TreeNode?>()
        var results: [[Int]] = []
        guard let rootValue = root else { return [] }
        queue.push(rootValue)
        results.append([rootValue.val])
        while queue.hasItems {
            var row: [Int] = []
            let node = queue.pop()
            if let lnode = node?.left {
                row.append(lnode.val)
                queue.push(lnode)
            }
            if let rnode = node?.right {
                row.append(rnode.val)
                queue.push(rnode)
            }
            if !row.isEmpty {
                results.append(row)
            }
        }
        return results
    }

    func postOrderTre(_ root: TreeNode?) -> [[Int]] {
        guard let rootValue = root else { return [] }
        let queue = Queue<TreeNode?>()
        var results: [[Int]] = []
        results.append([rootValue.val])
        queue.push(rootValue)
        var res = getQueueChilds(queue: queue)
        while res.1.hasItems {
            queue.clear()
            results.append(res.0)
            res = getQueueChilds(queue: res.1)
        }
        return results
    }

    func getQueueChilds(queue: Queue<TreeNode?>) -> ([Int], Queue<TreeNode?>) {
        var row: [Int] = []
        let newChilds = Queue<TreeNode?>()
        while queue.hasItems {
            let node = queue.pop()
            if let lnode = node?.left {
                row.append(lnode.val)
                newChilds.push(lnode)
            }
            if let rnode = node?.right {
                row.append(rnode.val)
                newChilds.push(rnode)
            }
        }
        return (row, newChilds)
    }

    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if s == nil || t == nil {
            return false
        }

        if s?.val == t?.val {
            if isSameTree(s, t) {
                return true
            }
        }

        return isSubtree(s?.left, t) || isSubtree(s?.right, t)
    }

    func isSameTree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if s == nil && t == nil {
            return true
        } else if s == nil || t == nil {
            return false
        }

        if s?.val != t?.val {
            return false
        }

        return isSameTree(s?.left, t?.left) && isSameTree(s?.right, t?.right)
    }

    var maxDiameter: Int = Int.min
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }

        let total = nodeDepth(root?.left) + nodeDepth(root?.right)
        if total > maxDiameter {
            maxDiameter = total
        }
        return maxDiameter
    }

    func nodeDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let x = nodeDepth(root?.left) //
        let y = nodeDepth(root?.right)
        if x + y > maxDiameter {
            maxDiameter = x + y
        }
        return 1 + max(x, y)
    }

    var heap: String = ""
    // Encodes a tree to a single string.
    func serialize(root: TreeNode?) {
        guard let node = root else {
            return
        }
        if !heap.contains("\(node.val)") {
            heap.append("\(node.val)")
        }
        if let left = node.left {
            heap.append("\(left.val)")
        }
        if let right = node.right {
            heap.append("\(right.val)")
        }
        serialize(root: node.left)
        serialize(root: node.right)
    }

    class BSTIterator1 {
        var array: [Int] = []
        var nextIndex = 0
        init(_ root: TreeNode?) {
            traverseInOrder(process: root)
        }

        public func traverseInOrder(process: TreeNode?) {
            guard let node = process  else {
                return
            }
            traverseInOrder(process: node.left)
            array.append(node.val)
            traverseInOrder(process: node.right)
        }

        /** @return the next smallest number */
        func next() -> Int {
            nextIndex += 1
            return array[nextIndex - 1]
        }

        /** @return whether we have a next smallest number */
        func hasNext() -> Bool {
            return (nextIndex - 1 ) < array.count
        }
    }

    class BSTIterator {
        var currentNode: TreeNode?
        init(_ root: TreeNode?) {
            self.currentNode = gotoMostLeftParentNode(root)
        }

        func gotoMostLeftParentNode(_ root: TreeNode?) -> TreeNode? {
            guard let node = root else {
                return nil
            }
            if let leftleft = node.left?.left {
                if !leftleft.visited {
                    return gotoMostLeftParentNode(leftleft)
                }
            }
            if let left = node.left {
                if left.visited {
                    if let right = node.right {
                        if !right.visited {
                            return gotoMostLeftParentNode(right)
                        }
                    }
                }
            }

            return node
        }

        /** @return the next smallest number */
        func next() -> Int {
            guard let node = currentNode else { return -1 }
            if let left = node.left {
                if !left.visited {
                    left.visited = true
                    return left.val
                }
            }

            if !node.visited {
                node.visited = true
                // change current pointer to right item
                if let right = node.right {
                    if !right.visited {
                        currentNode = gotoMostLeftParentNode(right)
                    }
                }
                return node.val
            }
            if let right = node.right {
                if !right.visited {
                    right.visited = true
                    return right.val
                }
            }

            /// how to go to your parent
            currentNode = gotoMostLeftParentNode(node)
            return next()
        }

        /** @return whether we have a next smallest number */
        func hasNext() -> Bool {
            guard let node = currentNode else {
                return false
            }
            return !node.visited
        }
    }
}

class Queue<T> {
    var queue: [T] = []
    func push(_ newItem: T) {
        queue.append(newItem)
    }

    func clear() {
        queue.removeAll()
    }

    func pop() -> T {
        return queue.removeFirst()
    }

    var hasItems: Bool {
        return queue.count > 0
    }
}

extension TreeNode {
    public func traverseInOrder(process: TreeNode?) {
        left?.traverseInOrder(process: process)
        // process(value)
        right?.traverseInOrder(process: process)
    }
}

//
//    public func traversePreOrder(process: (T) -> Void) {
//        process(value)
//        left?.traversePreOrder(process: process)
//        right?.traversePreOrder(process: process)
//    }
//
//    public func traversePostOrder(process: (T) -> Void) {
//        left?.traversePostOrder(process: process)
//        right?.traversePostOrder(process: process)
//        process(value)
//    }
// }
