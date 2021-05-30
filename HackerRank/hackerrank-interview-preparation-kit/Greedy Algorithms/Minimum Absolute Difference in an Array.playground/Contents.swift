import UIKit

var str = "Hello, playground"

func minimumAbsoluteDifference(arr: [Int]) -> Int {
    let sorted = arr.sorted()
    var diff = abs(arr[0]-arr[1])
    for i in 1..<sorted.count-1 {
        diff = min(diff, abs(sorted[i]-sorted[i+1]))
    }
    return diff
}


//var value = Int.max
//    let list = arr.sorted()
//    for i in 0..<arr.count-1 {
//        value = min( value, abs( list[i] - list[i+1] ))
//    }
//    return value

minimumAbsoluteDifference(arr: [-2,2,4])
minimumAbsoluteDifference(arr: [3,-7,0])
minimumAbsoluteDifference(arr: [-59, -36, -13, 1, -53, -92, -2, -96, -54, 75])
minimumAbsoluteDifference(arr: [1, -3, 71, 68, 17])
