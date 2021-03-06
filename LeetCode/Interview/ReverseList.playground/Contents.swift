import UIKit

/*
 Reverse a singly linked list.
 
 Example:
 
 Input: 1->2->3->4->5->NULL
 Output: 5->4->3->2->1->NULL
 Follow up:
 
 A linked list can be reversed either iteratively or recursively. Could you implement both?
 */



public class ListNode: CustomDebugStringConvertible {
    public var debugDescription: String {
        var temp: ListNode? = self
        var desc = ""
        while temp != nil {
            guard let val = temp?.val else { continue }
            desc.append("\(String(val)) -> ")
            temp = temp?.next
        }
        return desc
    }
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var current = head
        
        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        return prev
    }
    
    func reverseListRecursively(_ head: ListNode?) -> ListNode? {
        return recursiveReverse(nil, current: head)
    }
    
    private func recursiveReverse(_ prev: ListNode?, current: ListNode?) -> ListNode? {
        guard current != nil else {
            return prev
        }
        let next = current?.next
        current?.next = prev
        return recursiveReverse(current, current: next)
    }
}

let sol = Solution()
print(sol.reverseList(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, nil)))))) as Any)
print(sol.reverseList(ListNode(1, nil)) as Any)
print(sol.reverseList(nil) as Any)
print(sol.reverseList(ListNode(5, ListNode(4, ListNode(3, ListNode(2, ListNode(1, nil)))))) as Any)
print(sol.reverseList(ListNode(4, ListNode(3, ListNode(2, ListNode(1, nil))))) as Any)
print("\n\nRecursive ><><><><><><><><><><><><><><><><\n\n")
print(sol.reverseListRecursively(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, nil)))))) as Any)
print(sol.reverseListRecursively(ListNode(1, nil)) as Any)
print(sol.reverseListRecursively(nil) as Any)
print(sol.reverseListRecursively(ListNode(5, ListNode(4, ListNode(3, ListNode(2, ListNode(1, nil)))))) as Any)
print(sol.reverseListRecursively(ListNode(4, ListNode(3, ListNode(2, ListNode(1, nil))))) as Any)


