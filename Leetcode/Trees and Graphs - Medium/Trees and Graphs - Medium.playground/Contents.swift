import UIKit

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

//Given the root of a binary tree, return the inorder traversal of its nodes' values.
//
//Example 1:
//
//
//Input: root = [1,null,2,3]
//Output: [1,3,2]
//Example 2:
//
//Input: root = []
//Output: []
//Example 3:
//
//Input: root = [1]
//Output: [1]
//Example 4:
//
//
//Input: root = [1,2]
//Output: [2,1]
//Example 5:
//
//
//Input: root = [1,null,2]
//Output: [1,2]

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var stack: [TreeNode] = []
    var list: [Int] = []
    var head = root
    while head != nil || !stack.isEmpty {
        while head != nil {
            stack.append(head!)
            head = head?.left
        }
        head = stack.popLast()
        list.append(head!.val)
        head = head?.right
    }
    return list
}

inorderTraversal(TreeNode(1, nil, TreeNode(2, TreeNode(3), nil)))



class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        
    }
}


