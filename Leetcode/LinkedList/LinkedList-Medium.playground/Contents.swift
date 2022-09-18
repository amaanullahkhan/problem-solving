import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

//Given the head of a singly linked list, return true if it is a palindrome or false otherwise.
//
//Constraints:
//
//The number of nodes in the list is in the range [1, 105].
//0 <= Node.val <= 9
//
//
//Follow up: Could you do it in O(n) time and O(1) space?



func isPalindrome(_ head: ListNode?) -> Bool {
    
    var previous: ListNode? = nil
    var current = head
    var fast = head
    
    // Reverse first half of the list
    while fast?.next != nil {
        
        fast = fast?.next?.next // iterate by 2
        
        // reverse (iterate by 2 will result in reversing only first half of the list)
        let next = current?.next
        current?.next = previous
        previous = current
        current = next
    }
    
    if fast != nil { // if nodes' count is odd
        current = current?.next // ignore middle one
    }
    
    // check if reversed first half and second half have same values
    var reversed = previous
    while current != nil && reversed != nil {
        guard current?.val == reversed?.val else { return false}
        current = current?.next
        reversed = reversed?.next
    }
    return true
}

var head: ListNode? = ListNode(1, ListNode(2, ListNode(2, ListNode(1))))
isPalindrome(head)

//var head: ListNode? = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
//head = isPalindrome(head)
//
//while head != nil {
//    print(head?.val)
//    head = head?.next
//}


/*
Given the heads of two singly linked-lists headA and headB, return the node at which the two lists intersect. If the two linked lists have no intersection at all, return null.

For example, the following two linked lists begin to intersect at node c1:


The test cases are generated such that there are no cycles anywhere in the entire linked structure.

Note that the linked lists must retain their original structure after the function returns.

Custom Judge:

The inputs to the judge are given as follows (your program is not given these inputs):

intersectVal - The value of the node where the intersection occurs. This is 0 if there is no intersected node.
listA - The first linked list.
listB - The second linked list.
skipA - The number of nodes to skip ahead in listA (starting from the head) to get to the intersected node.
skipB - The number of nodes to skip ahead in listB (starting from the head) to get to the intersected node.
The judge will then create the linked structure based on these inputs and pass the two heads, headA and headB to your program. If you correctly return the intersected node, then your solution will be accepted.

 

Example 1:


Input: intersectVal = 8, listA = [4,1,8,4,5], listB = [5,6,1,8,4,5], skipA = 2, skipB = 3
Output: Intersected at '8'
Explanation: The intersected node's value is 8 (note that this must not be 0 if the two lists intersect).
From the head of A, it reads as [4,1,8,4,5]. From the head of B, it reads as [5,6,1,8,4,5]. There are 2 nodes before the intersected node in A; There are 3 nodes before the intersected node in B.
Example 2:


Input: intersectVal = 2, listA = [1,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1
Output: Intersected at '2'
Explanation: The intersected node's value is 2 (note that this must not be 0 if the two lists intersect).
From the head of A, it reads as [1,9,1,2,4]. From the head of B, it reads as [3,2,4]. There are 3 nodes before the intersected node in A; There are 1 node before the intersected node in B.
Example 3:


Input: intersectVal = 0, listA = [2,6,4], listB = [1,5], skipA = 3, skipB = 2
Output: No intersection
Explanation: From the head of A, it reads as [2,6,4]. From the head of B, it reads as [1,5]. Since the two lists do not intersect, intersectVal must be 0, while skipA and skipB can be arbitrary values.
Explanation: The two lists do not intersect, so return null.
 

Constraints:

The number of nodes of listA is in the m.
The number of nodes of listB is in the n.
0 <= m, n <= 3 * 104
1 <= Node.val <= 105
0 <= skipA <= m
0 <= skipB <= n
intersectVal is 0 if listA and listB do not intersect.
intersectVal == listA[skipA] == listB[skipB] if listA and listB intersect.
 

Follow up: Could you write a solution that runs in O(n) time and use only O(1) memory?
*/

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        
        guard headA != nil || headB != nil else {return nil}
        
        var a = headA
        var b = headB
        
        while a !== b {
            a = a == nil ? headB : a!.next
            b = b == nil ? headA : b!.next
        }
        return a
    }
}


//https://leetcode.com/explore/interview/card/top-interview-questions-medium/107/linked-list/784/
//Given the head of a singly linked list, group all the nodes with odd indices together followed by the nodes with even indices, and return the reordered list.
//
//The first node is considered odd, and the second node is even, and so on.
//
//Note that the relative order inside both the even and odd groups should remain as it was in the input.
//
//You must solve the problem in O(1) extra space complexity and O(n) time complexity.
//
//
//
//Example 1:
//
//
//Input: head = [1,2,3,4,5]
//Output: [1,3,5,2,4]
//Example 2:
//
//
//Input: head = [2,1,3,5,6,4,7]
//Output: [2,3,6,7,1,5,4]
//
//
//Constraints:
//
//n == number of nodes in the linked list
//0 <= n <= 104
//-106 <= Node.val <= 106

func oddEvenList(_ head: ListNode?) -> ListNode? {
    
    guard head?.next != nil else { return head }

    var oddHead = head
    var evenHead = head?.next
    
    var odd = oddHead
    var even = evenHead
        
    while odd?.next != nil || even?.next != nil {
        odd?.next = odd?.next?.next
        even?.next = even?.next?.next
        odd = odd?.next
        even = even?.next
        
    }
    odd?.next = even
    return oddHead
}



//https://leetcode.com/explore/interview/card/top-interview-questions-medium/107/linked-list/783/

//You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
//
//You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//
//
//
//Example 1:
//
//Input: l1 = [2,4,3], l2 = [5,6,4]
//Output: [7,0,8]
//Explanation: 342 + 465 = 807.
//Example 2:
//
//Input: l1 = [0], l2 = [0]
//Output: [0]
//Example 3:
//
//Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
//Output: [8,9,9,9,0,0,0,1]
 
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    var carry = 0
    let sum = ListNode()
    
    var l1Next = l1
    var l2Next = l2
    var sumCurrent = sum
    
    while l1Next != nil || l2Next != nil {

        let sum = (l1Next?.val ?? 0) + (l2Next?.val ?? 0) + carry
        carry = sum / 10

        sumCurrent.next = ListNode(sum % 10)

        l1Next = l1Next?.next
        l2Next = l2Next?.next
        sumCurrent = sumCurrent.next!
    }
    
    if carry != 0 {
        sumCurrent.next = ListNode(carry)
    }
    
    return sum.next
    
}
var l1 = ListNode(2, ListNode(4, ListNode(3)))
var l2 = ListNode(5, ListNode(6, ListNode(4)))
addTwoNumbers(l1, l2)


