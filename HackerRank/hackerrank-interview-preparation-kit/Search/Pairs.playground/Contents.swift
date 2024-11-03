import UIKit

func pairs(k: Int, arr: [Int]) -> Int {
    var pairs: Set<Int> = Set()
    var count = 0
    for num in arr.sorted() {
        if pairs.contains(num-k) {
            count += 1
        }
        pairs.insert(num)
    }
    return count
}

pairs(k: 2, arr: [1,5,3,4,2])
