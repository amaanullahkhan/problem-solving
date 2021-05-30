import UIKit

var str = "Hello, playground"

func luckBalance(k: Int, contests: [[Int]]) -> Int {
    
    var importantContests = [Int]()
    var luck = 0
    for contest in contests {
        if contest.last! == 0 {
            luck += contest.first!
        } else {
            importantContests.append(contest.first!)
        }
    }
  
    if k >= importantContests.count {
        luck += importantContests.reduce(0, +)
    } else {
        importantContests = importantContests.sorted(by: >)
        luck += importantContests.prefix(k).reduce(0, +)
        luck -= importantContests.suffix(importantContests.count-k).reduce(0, +)
    }
    return luck
}

luckBalance(k: 3, contests: [[5, 1], [2, 1], [1, 1], [8, 1], [10, 0], [5, 0]])
