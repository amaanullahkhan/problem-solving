import UIKit


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
 

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var aSet = Set<Int>()
        
        var currentA = headA
        while currentA != nil {
            aSet.insert(ObjectIdentifier(currentA!).hashValue)
            currentA = currentA!.next
        }
        
        var currentB = headB
        while currentB != nil {
            if aSet.contains(ObjectIdentifier(currentB!).hashValue) {
                return currentB
            }
            currentB = currentB!.next
        }
        
        return nil
        
    }
}
