import UIKit

func getMinimumCost(k: Int, c: [Int]) -> Int {
    var cost = 0
    let flowers = c.sorted(by: >)
    for i in 0..<flowers.count {
        cost += (i/k + 1) * flowers[i] // (previous purchase + 1) * original price
    }
    return cost
}

getMinimumCost(k: 3, c: [1,2,3,4])
getMinimumCost(k: 3, c: [2,5,6])
getMinimumCost(k: 2, c: [2,5,6])
getMinimumCost(k: 3, c: [1, 3, 5, 7, 9])
