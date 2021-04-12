import UIKit

var str = "Hello, playground"

var array = [1,2,3,4,5]
var tuple = array.map({ ($0, $0) })
var dict = Dictionary(uniqueKeysWithValues: tuple)

func reconcileHelper(_ a: [Int], _ b: [Int]) -> String {
    
    let aDict: [Int: Int] = Dictionary(uniqueKeysWithValues: a.map{ ($0, $0) })
    let bDict: [Int: Int] = Dictionary(uniqueKeysWithValues: b.map{ ($0, $0) })
    
    var aUniqueSorted: [Int] = []
    var bUniqueSorted: [Int] = []
        
    for aElement in a where bDict[aElement] == nil {
        let index = aUniqueSorted.insertionIndex(of: aElement)
        aUniqueSorted.insert(aElement, at: index)
    }
    
    for bElement in b where aDict[bElement] == nil {
        let index = bUniqueSorted.insertionIndex(of: bElement)
        bUniqueSorted.insert(bElement, at: index)
    }

    return "Numbers in array a that aren't in array b:\n\(aUniqueSorted)\n\nNumbers in array b that aren't in array a:\n\(bUniqueSorted)\n"
}

extension RandomAccessCollection where Element : Comparable {
    func insertionIndex(of value: Element) -> Index {
        var slice : SubSequence = self[...]

        while !slice.isEmpty {
            let middle = slice.index(slice.startIndex, offsetBy: slice.count / 2)
            if value < slice[middle] {
                slice = slice[..<middle]
            } else {
                slice = slice[index(after: middle)...]
            }
        }
        return slice.startIndex
    }
}

print(reconcileHelper([5, 3, 4], [4, 3, 10, 6]))
