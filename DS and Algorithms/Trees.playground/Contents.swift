
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

func inorderTraversal(node: TreeNode?) {
    var head = node
    var stack: [TreeNode] = []
    var inorder: [Int] = []
    while head != nil || !stack.isEmpty {
        while head != nil  {
            stack.append(head!)
            head = head!.left
        }
        head = stack.removeLast()
        inorder.append(head!.val)
        head = head!.right
    }
    print(inorder)
}

func outOrderTraversal(node: TreeNode?) {
    var head = node
    var stack: [TreeNode] = []
    var inorder: [Int] = []
    while head != nil || !stack.isEmpty {
        while head != nil  {
            stack.append(head!)
            head = head!.right
        }
        head = stack.removeLast()
        inorder.append(head!.val)
        head = head!.left
    }
    print(inorder)
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

let node1 = TreeNode(val: 2, left: TreeNode(val: 1), right: TreeNode(val: 3))
inorderTraversal(node: node1)
outOrderTraversal(node: node1)

//let node1 = TreeNode(val: 1, left: TreeNode(val: 2, left: TreeNode(val: 3), right: TreeNode(val: 4)), right: TreeNode(val: 2, left: TreeNode(val: 4), right: TreeNode(val: 3)))
//inorderTraversal(node: node1)
