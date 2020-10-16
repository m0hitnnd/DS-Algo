import UIKit


  //Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
 
class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil, q == nil {
            return true
        }
        
        if p != nil, q == nil {
            return false
        }
        
        if q != nil, p == nil {
            return false
        }
        
        if p?.val == q?.val {
            return (isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right))
        }
        return false
    }
}

let sol = Solution()
let p = TreeNode(1, TreeNode(2), TreeNode(3))
let q = TreeNode(1, TreeNode(2), TreeNode(3))
sol.isSameTree(p, q)

//   1   1
//  /     \
// 2       2
let p2 = TreeNode.init(1, TreeNode.init(2), nil)
let q2 = TreeNode.init(1, nil, TreeNode.init(2))
sol.isSameTree(p2, q2)


let p3 = TreeNode.init(1, TreeNode.init(2), nil)
let q3 = TreeNode.init(1, nil, TreeNode.init(2))
sol.isSameTree(p3, q3)
