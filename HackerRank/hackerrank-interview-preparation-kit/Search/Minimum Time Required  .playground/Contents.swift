import UIKit

// Using Binary Search

func minTime(machines: [Int], goal: Int) -> Int {
    let machinesSorted = machines.sorted()
    let slowest = machinesSorted.last!
    let fastest = machinesSorted.first!
    var maxDays = slowest * goal / machines.count
    var minDays = fastest * goal / machines.count
    var result = 0
    while minDays < maxDays {
        let mid = (minDays + maxDays) / 2
        var unit = 0
        for machine in machinesSorted {
            unit += mid / machine
        }
        if unit < goal {
            minDays = mid + 1
        } else {
            maxDays = mid
            result = mid
        }
    }
    return result
}

minTime(machines: [2,3,2], goal: 10)
minTime(machines: [2,3], goal: 5)
minTime(machines: [1,3,4], goal: 10)
minTime(machines: [4,5,6], goal: 12)

