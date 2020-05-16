import UIKit

/*
 Given a singly linked list, group all odd nodes together followed by the even nodes. Please note here we are talking about the node number and not the value in the nodes.

 You should try to do it in place. The program should run in O(1) space complexity and O(nodes) time complexity.

 Example 1:

 Input: 1->2->3->4->5->NULL
 Output: 1->3->5->2->4->NULL
 Example 2:

 Input: 2->1->3->5->6->4->7->NULL
 Output: 2->3->6->7->1->5->4->NULL
 Note:

 The relative order inside both the even and odd groups should remain as it was in the input.
 The first node is considered odd, the second node even and so on ...
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        guard let llhead = head else { return nil }
        var oddNode: ListNode? = llhead
        var evenNode: ListNode? = llhead.next
        
        while evenNode != nil, evenNode?.next != nil {
            let temp = oddNode?.next
            oddNode?.next = evenNode?.next
            evenNode?.next = evenNode?.next?.next
            oddNode?.next?.next = temp
            oddNode = oddNode?.next
            evenNode = evenNode?.next
        }
        return llhead
    }
}

func printLL(_ head: ListNode?) {
    var temp = head
    while temp != nil {
        print(temp?.val)
        temp = temp?.next
    }
}
let sol = Solution()
let list = sol.oddEvenList(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, nil))))))
printLL(list)

// 2->1->3->5->6->4->7->NULL
let list2 = sol.oddEvenList(ListNode(2, ListNode(1, ListNode(3, ListNode(5, ListNode(6, ListNode(4, ListNode(7, nil))))))))
printLL(list2)

let list3 = sol.oddEvenList(ListNode(1, ListNode(2, nil)))
printLL(list3)

let list4 = sol.oddEvenList(ListNode(1, nil))
printLL(list4)
