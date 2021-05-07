import UIKit

func countingSort(_ input: [Int]) -> [Int] {
    
    var output: [Int] = input
    
    // find max element in array
    var max = 0
    for element in input {
        if element > max {
            max = element
        }
    }
    
    // init array of size max + 1 with zeros
    var counts: [Int] = [Int](repeatElement(0, count: max+1))
    
    
    // store count of each element from input array
    for element in input {
        counts[element] += 1
    }
    
    // store the cumulative sum in each index of the previous indexes
    for i in 1..<counts.count {
        counts[i] += counts[i-1]
    }
    
    for i in 0..<input.count {
        output[counts[input[i]]-1] = input[i]
        counts[input[i]] -= 1
    }
    
    return output
}

countingSort([4,2,2,8,3,3,1])
