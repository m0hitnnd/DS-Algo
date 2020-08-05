import UIKit


/*
 Return the root node of a binary search tree that matches the given preorder traversal.

 (Recall that a binary search tree is a binary tree where for every node, any descendant of node.left has a value < node.val, and any descendant of node.right has a value > node.val.  Also recall that a preorder traversal displays the value of the node first, then traverses node.left, then traverses node.right.)

 It's guaranteed that for the given test cases there is always possible to find a binary search tree with the given requirements.

 Example 1:

 Input: [8,5,1,7,10,12]
 Output: [8,5,10,1,7,null,12]

  

 Constraints:

 1 <= preorder.length <= 100
 1 <= preorder[i] <= 10^8
 The values of preorder are distinct.
 */


 // Definition for a binary tree node.
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
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        let root = TreeNode(preorder[0], nil, nil)
        return bstFromPreorderRecursively(preorder, index: 1, root: root)
    }
    
    func bstFromPreorderRecursively(_ preOrder: [Int], index: Int, root: TreeNode?) -> TreeNode? {
        guard let rootNode = root else { return nil }
        guard index < preOrder.count else { return rootNode }
        
        let val = preOrder[index]
        let newIndex = index + 1
        let newNode = TreeNode(val, nil, nil)
        
        if val < rootNode.val {
            rootNode.left = newNode
            bstFromPreorderRecursively(preOrder, index: newIndex, root: newNode)
        } else {
            rootNode.right = newNode
            bstFromPreorderRecursively(preOrder, index: newIndex, root: newNode)
        }
    }
}
