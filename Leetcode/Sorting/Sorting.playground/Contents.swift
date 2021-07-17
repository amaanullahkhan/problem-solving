import UIKit

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    
    var j = 0
    var k = 0
    let nums3 = nums1
    
    for i in 0..<nums1.count {
        guard j<nums2.count else {
            nums1[i] = nums3[k]
            k+=1
            continue
        }
        if nums3[k] < nums2[j] && k < m {
            nums1[i] = nums3[k]
            k += 1
        } else {
            nums1[i] = nums2[j]
            j += 1
        }
    }
}

var nums1 = [1,2,3,0,0,0]
var nums2 = [2,5,6]
merge(&nums1, 3, nums2, 3)
nums1

