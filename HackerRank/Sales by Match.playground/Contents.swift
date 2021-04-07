import UIKit

func sockMerchant(n: Int, ar: [Int]) -> Int {
    
    var distinctSocks: [Int: Int] = [:]
    for element in ar {
        distinctSocks[element] = (distinctSocks[element] ?? 0) + 1
    }
    return distinctSocks.reduce(0) { (result, dict) -> Int in
        return result + (dict.value/2)
    }
    
}
