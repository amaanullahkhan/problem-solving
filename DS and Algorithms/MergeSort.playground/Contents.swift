import Foundation

func mergeSort(array: [Int]) -> [Int] {
    guard  array.count > 1 else {
        return array
    }
    let mid = array.count / 2
    let left = mergeSort(array: Array(array[0..<mid]))
    let right = mergeSort(array: Array(array[mid...]))
    return merge(left: left, right: right)
}

func merge(left: [Int], right: [Int]) -> [Int] {
    
    var result: [Int] = []
    result.reserveCapacity(left.count + right.count)
    
    var leftIndex = 0
    var rightIndex = 0
    
    while leftIndex < left.count && rightIndex < left.count {
        if left[leftIndex] < right[rightIndex] {
            result.append(left[leftIndex])
            leftIndex += 1
        } else {
            result.append(right[rightIndex])
            rightIndex += 1
        }
    }
    
    while leftIndex < left.count {
        result.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        result.append(right[rightIndex])
        rightIndex += 1
    }
    
    return result
}

mergeSort(array: [2,2,2,1,5,4,9])
