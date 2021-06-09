import UIKit

var str = "Hello, playground"

// Complete the triplets function below.
func triplets(a: [Int], b: [Int], c: [Int]) -> Int {
    
    var count = 0
    let aSorted = Array(Set(a)).sorted()
    let bSorted = Array(Set(b)).sorted()
    let cSorted = Array(Set(c)).sorted()
    
    var aValid = 0
    var cValid = 0
    
    for q in bSorted {
  
        for p in aValid..<aSorted.count {
            if q >= aSorted[p] {
                aValid += 1
            } else {
                break
            }
        }
        for r in cValid..<cSorted.count {
            if q >= cSorted[r] {
                cValid += 1
            }
            else {
                break
            }
        }
        count += aValid * cValid
    }

    return count
}

triplets(a: [3,5,7], b: [3,6], c: [4,6,9])
triplets(a: [1,3,5], b: [2,3], c: [1,2,3])
triplets(a: [1,4,5], b: [2,3,3], c: [1,2,3])
triplets(a: [1,3,5,7], b: [5,7,9], c: [7, 9, 11, 13])
