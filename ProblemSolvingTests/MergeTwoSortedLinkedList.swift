//
//  MergeTwoSortedLinkedList.swift
//  ProblemSolvingTests
//
//  Created by abuzeid on 5/1/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import XCTest
  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
  }


 class MergeSolution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil || l2 == nil  {
            return l1 == nil ? l2 : l1
        }
        var currentNodeA:ListNode? = l1!
        var currentNodeB:ListNode? = l2!
        var head:ListNode?
        var last:ListNode?
        while currentNodeA?.next != nil || currentNodeB?.next != nil{
            guard let valueA = currentNodeA?.val, let valueB = currentNodeB?.val else{
                break
            }
            
            if valueA == valueB{
                insert(node: &currentNodeA!, head: &head, last: &last)
                insert(node: &currentNodeB!, head: &head, last: &last)
            }else if valueA < valueB{
                insert(node: &currentNodeA!, head: &head, last: &last)

            }else{
                insert(node: &currentNodeB!, head: &head, last: &last)

            }
            
        }
        return nil
    }
    func insert( node:inout ListNode,head:inout ListNode?,last:inout ListNode?){
        if head == nil{
            head = node
            last = node
        }else {
            last?.next = node
            last = node
        }
    }
}


class MergeTwoSortedLinkedList: XCTestCase {

 
    func testExample() {
        let l1  = ListNode(22)
        let l2  = ListNode(24)
        let l3  = ListNode(25)
         l1.next = l2
        l2.next = l3
        
        let l21  = ListNode(21)
        let l22  = ListNode(23)
        let l23  = ListNode(26)
        l21.next = l22
        l22.next = l23
        
        let b = MergeSolution().mergeTwoLists(l1, l21)
        XCTAssertEqual(b!.val, l21.val)
        XCTAssertEqual(b!.next!.val, l1.val)
    }
    func testInsertionLogic() {
        var l1  = ListNode(22)
        var l2  = ListNode(24)
        var l3  = ListNode(25)
        l1.next = l2
        l2.next = l3
     
        var head:ListNode?
        var last:ListNode?
        let sol = MergeSolution()
        sol.insert(node: &l1, head: &head, last: &last)
        XCTAssertEqual(head!.val, l1.val)
        XCTAssertEqual(last!.val, l1.val)

         sol.insert(node: &l2, head: &head, last: &last)
         XCTAssertEqual(head!.val, l1.val)
         XCTAssertEqual(last!.val, l2.val)
        sol.insert(node: &l3, head: &head, last: &last)
        XCTAssertEqual(last!.val, l3.val)
    }
    
    func testPerformanceExample() {
        self.measure {
        }
    }

}
