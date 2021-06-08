import UIKit


func pairs(k: Int, arr: [Int]) -> Int {
    
    var count = 0
    let arrSorted = arr.sorted()
    var pairs: [Int: Int] = [:]
    for num in arrSorted {
        if pairs[num-k] != nil {
            count += 1
        }
        pairs[num] = num
    }
    return count
}

pairs(k: 1, arr: [1, 2, 3, 4])
pairs(k: 2, arr: [1, 5, 3, 4, 2])
