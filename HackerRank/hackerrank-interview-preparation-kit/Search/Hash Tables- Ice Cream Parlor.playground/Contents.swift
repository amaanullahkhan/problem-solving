import UIKit

var str = "Hello, playground"

func whatFlavors(cost: [Int], money: Int) -> Void {
    
    var costIndex: [Int: Int] = [:]
    for i in 0..<cost.count {
        let aCost = cost[i]
        if let index2 = costIndex[money-aCost] {
            print(index2+1, i+1)
            return
        } else {
            costIndex[aCost] = i
        }
    }
}

whatFlavors(cost: [2,1,3,5,6], money: 5)
whatFlavors(cost: [1, 4, 5, 3, 2], money: 4)
whatFlavors(cost: [2, 2, 4, 3], money: 4)

