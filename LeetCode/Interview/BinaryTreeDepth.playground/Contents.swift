import UIKit

/*
 Given the root of a binary tree, return its maximum depth.

 A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

  

 Example 1:

 Input: root = [3,9,20,null,null,15,7]
 Output: 3
 Example 2:

 Input: root = [1,null,2]
 Output: 2
 Example 3:

 Input: root = []
 Output: 0
 Example 4:

 Input: root = [0]
 Output: 1
 
 Constraints:

 The number of nodes in the tree is in the range [0, 104].
 -100 <= Node.val <= 100

 */


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
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let currentNode = root else {
            return 0
        }
        let leftSubtreeDepth = maxDepth(currentNode.left)
        let rightSubtreeDepth = maxDepth(currentNode.right)
        return max(leftSubtreeDepth, rightSubtreeDepth) + 1
    }
}

///     2
///   3     1
///  4  5  3  2
///        1

let sol = Solution()
sol.maxDepth(
    TreeNode(2, TreeNode(3, TreeNode(4, nil, nil), TreeNode(5, nil, nil)), TreeNode(1, TreeNode.init(3, nil, nil), TreeNode.init(2, nil, TreeNode.init(1, nil, nil))))
)


///  nil
let sol2 = Solution()
sol.maxDepth(nil)

///  2
let sol3 = Solution()
sol3.maxDepth(TreeNode(2, nil, nil))

///  1
///   2
let sol4 = Solution()
sol4.maxDepth(TreeNode(1, nil, TreeNode(2, nil, nil)))
