import UIKit

var str = "Hello, playground"

func maxMin(k: Int, arr: [Int]) -> Int {
    let sortedArr = arr.sorted()
    var unfairness = sortedArr.last!
    for i in 0..<sortedArr.count-(k-1) {
        let maxNum = sortedArr[i+(k-1)]
        let minNum = sortedArr[i]
        unfairness = min(unfairness, maxNum-minNum)
    }
    return unfairness
}

maxMin(k: 2, arr: [1,4,7,2])
maxMin(k: 3, arr: [10,
                   100,
                   300,
                   200,
                   1000,
                   20,
                   30])


