import Foundation


func getOnStatesCount(states: [Int]) -> Int {
    
    var count = 0
    var sorted: [Int] = []
    
    for (index, state) in states.enumerated() {
        
        sorted.append(state)
        sorted.sort()
        
        if sorted.count == sorted.last {
            count += 1
            print(index)
        }
    }
    return count
}

getOnStatesCount(states: [1,3,4,2,5])
