
import Foundation
import UIKit
import SwiftUI
import Combine

class TreeNode {
    var val: Int = 0
    var left: TreeNode? = nil
    var right: TreeNode? = nil
    init(val: Int, left: TreeNode? = nil, right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var list: [Int] = []
    var stack: [TreeNode] = []
    var head = root
    while head != nil || !stack.isEmpty {
        while head != nil {
            stack.append(head!)
            head = head?.left
        }
        head = stack.removeLast()
        list.append(head!.val)
        head = head?.right
    }
    return list
}

func outOrderTraversal(_ root: TreeNode?) -> [Int] {
    var list: [Int] = []
    var stack: [TreeNode] = []
    var head = root
    while head != nil || !stack.isEmpty {
        while head != nil {
            stack.append(head!)
            head = head?.right
        }
        head = stack.removeLast()
        list.append(head!.val)
        head = head?.left
    }
    return list
}

func isValidBST(_ root: TreeNode?) -> Bool {
    var head = root
    var stack: [TreeNode] = []
    var inOrder: [Int] = []
    while head != nil || !stack.isEmpty {
        while head != nil {
            stack.append(head!)
            head = head?.left
        }
        head = stack.removeLast()
        if let previous = inOrder.last {
            if previous >= head!.val {return false}
        }
        inOrder.append(head!.val)
        head = head?.right
    }
    return true
}

func isSymmetric(_ root: TreeNode?) -> Bool {
    isMirror(root?.left, root?.right)
}

func isMirror(_ t1: TreeNode?, _ t2: TreeNode?) -> Bool {
    if t1 == nil && t2 == nil {return true}
    if t1 == nil || t2 == nil {return false}
    return t1!.val == t2!.val
        && isMirror(t1!.left, t2!.right)
        && isMirror(t1!.right, t2!.left)
}


class Solution {
    
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        
        func sortedArrayToBST(_ low: Int, _ high: Int) -> TreeNode? {
            if low > high { return nil }
            let mid = (high + low) / 2
            let node = TreeNode(val: nums[mid])
            node.left = sortedArrayToBST(low, mid-1)
            node.right = sortedArrayToBST(mid+1, high)
            return node
        }
        
        return sortedArrayToBST(0, nums.count-1)
    }
    
}



// In Order
let node1 = TreeNode(val: 2, left: TreeNode(val: 1), right: TreeNode(val: 3))
inorderTraversal(node1)


// Out Order
outOrderTraversal(node1)


// Symmetric
let symmetricTree = TreeNode(val: 1, left: TreeNode(val: 2, left: TreeNode(val: 3), right: TreeNode(val: 4)), right: TreeNode(val: 2, left: TreeNode(val: 4), right: TreeNode(val: 3)))
inorderTraversal(symmetricTree)
outOrderTraversal(symmetricTree)
isSymmetric(symmetricTree)


// Sorted array to Binary Search Tree
let bst = Solution().sortedArrayToBST([-10,-3,0,5,9])
inorderTraversal(bst)
