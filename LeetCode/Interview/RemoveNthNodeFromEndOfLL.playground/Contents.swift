import UIKit

/*
 Given the head of a linked list, remove the nth node from the end of the list and return its head.

 Follow up: Could you do this in one pass?

 Input: head = [1,2,3,4,5], n = 2
 Output: [1,2,3,5]
 
 Input: head = [1], n = 1
 Output: []
 
 Input: head = [1,2], n = 1
 Output: [1]
 
Constraints:

The number of nodes in the list is sz.
1 <= sz <= 30
0 <= Node.val <= 100
1 <= n <= sz
 */



public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
}

func printLL(_ head: ListNode?) {
    var head = head
    while head != nil {
        print("\(head?.val) -> ")
        head = head?.next
    }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var head = head
        let totalCount = updateHeadPostRemoving(&head, n)
        if totalCount == n {
            head = head?.next
        }
        printLL(head)
        return head
    }
    
    private func updateHeadPostRemoving(_ head: inout ListNode?, _ n: Int) -> Int {
        guard let head = head else { return 0 }
        
        var nextElement = head.next
        let count = updateHeadPostRemoving(&nextElement, n) + 1
        
        if count == n + 1 {
            let nodeToBeDeleted = head.next
            head.next = nodeToBeDeleted?.next
            nodeToBeDeleted?.next = nil
        }
        return count
    }
}

let sol = Solution.init()
sol.removeNthFromEnd(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, nil))))), 2)

sol.removeNthFromEnd(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, nil))))), 5)

