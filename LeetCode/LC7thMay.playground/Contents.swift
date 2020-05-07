import UIKit


/*
 In a binary tree, the root node is at depth 0, and children of each depth k node are at depth k+1.

 Two nodes of a binary tree are cousins if they have the same depth, but have different parents.

 We are given the root of a binary tree with unique values, and the values x and y of two different nodes in the tree.

 Return true if and only if the nodes corresponding to the values x and y are cousins.

  

 Example 1:


 Input: root = [1,2,3,4], x = 4, y = 3
 Output: false
 Example 2:


 Input: root = [1,2,3,null,4,null,5], x = 5, y = 4
 Output: true
 Example 3:



 Input: root = [1,2,3,null,4], x = 2, y = 3
 Output: false
  

 Note:

 The number of nodes in the tree will be between 2 and 100.
 Each node has a unique integer value from 1 to 100.

 */

/**
 * Definition for a binary tree node.

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
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        guard let treeRoot = root else { return false }
        
        let xLevelWithParentNode = level(for: x, root: treeRoot, parent: nil, lev: 1)
        let yLevelWithParentNode = level(for: y, root: treeRoot, parent: nil, lev: 1)
        
        guard xLevelWithParentNode.level == yLevelWithParentNode.level else { return false }
        
        guard xLevelWithParentNode.parentNode?.val != yLevelWithParentNode.parentNode?.val else {
            return false
        }
        return true
    }
    
    private func level(for x: Int, root: TreeNode?, parent: TreeNode?, lev: Int) -> (parentNode: TreeNode?, level: Int) {
        guard let rootNode = root else { return (parentNode: nil, level: 0) }
        
        guard rootNode.val != x else { return (parentNode: parent, level: lev) }
        
        let leftTreeVal = level(for: x, root: rootNode.left, parent: rootNode, lev: lev + 1)
        if leftTreeVal.level != 0 {
            return leftTreeVal
        }
        
        return level(for: x, root: rootNode.right, parent: rootNode, lev: lev + 1)
    }
}
