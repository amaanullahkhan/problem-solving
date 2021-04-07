import UIKit


func maxSubArraySum(_ arr: [Int]) -> Int {
    
    var maxSum = 0
    var currentMaxSum = 0
    for i in 0..<arr.count {
        currentMaxSum = max(arr[i], currentMaxSum + arr[i])
        maxSum = max(maxSum, currentMaxSum)
    }
    return maxSum
}

func kConcatenationMaxSum(_ arr: [Int], _ k: Int) -> Int {
    let arrSumOneTime = maxSubArraySum(arr)
    let arrSumKTimes: Int64 = Int64(arrSumOneTime) * Int64(k)
    return Int(arrSumKTimes)
}

kConcatenationMaxSum([1,-2,1], 5)


// [1,-2,1] [1,-2,1] [1,-2,1] [1,-2,1] [1,-2,1]
