import UIKit

/*
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Example:
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.
 */


// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func printLL(_ ll: ListNode?) {
    var head = ll
    while head != nil {
        print("\(head!.val) ->")
        head = head?.next
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        return addTwoNumbersRecursively(l1, l2, 0)
    }
    
    func addTwoNumbersRecursively(_ l1: ListNode?, _ l2: ListNode?,_  carry: Int) -> ListNode? {
        
        if l1 == nil && l2 == nil {
            return carry != 0 ? ListNode(carry) : nil
        }
        
        let newValue = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
        let val = newValue >= 10 ? (newValue - 10) : newValue
        let newCarry = newValue >= 10 ? 1 : 0
        let newNode = ListNode(val)
        newNode.next = addTwoNumbersRecursively(l1?.next, l2?.next, newCarry)
        return newNode
    }
}
//
let sol = Solution()
//let l1 = ListNode(2, ListNode(4, ListNode(3, nil)))
//let l2 = ListNode(5, ListNode(6, ListNode(4, nil)))
//let ans = sol.addTwoNumbers(l1, l2)
//printLL(ans)
//
//let l3 = ListNode(5, nil)
//let l4 = ListNode(5, nil)
//let ans2 = sol.addTwoNumbers(l3, l4)
//printLL(ans2)

let l5 = ListNode(5, ListNode(9, nil))
let l6 = ListNode(5, nil)
let ans3 = sol.addTwoNumbers(l5, l6)
printLL(ans3)
