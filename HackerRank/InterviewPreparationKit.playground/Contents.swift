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

/*
 * Complete the 'countingValleys' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER steps
 *  2. STRING path
 */

func countingValleys(steps: Int, path: String) -> Int {
    var valley = 0
    var level = 0
    for step in path {
        if step == "U" {
            level += 1
            if level == 0 {
                valley += 1
            }
        } else {
            level -= 1
        }
    }
    return valley
}

//countingValleys(steps: 8, path: "DDUUDDUDUUUD")


// Complete the repeatedString function below.
func repeatedString(s: String, n: Int) -> Int {
    
    func count(of char: String.Element, in string: String) -> Int {
        var count = 0
        for character in string {
            if character == char {
                count += 1
            }
        }
        return count
    }
    
    var repeated = count(of: "a", in: s)
        
    repeated = (n / s.count) * repeated
    let range = s.startIndex..<s.index(s.startIndex, offsetBy: n % s.count)
    repeated += count(of: "a", in: String(s[range]))
    
    return repeated
}

//repeatedString(s: "aba", n: 10)


// Complete the hourglassSum function below.
func hourglassSum(arr: [[Int]]) -> Int {
    
    func anHourGlassSum(for row: Int, column: Int) -> Int {
        var sum = 0
        sum += arr[row][column]
        sum += arr[row][column+1]
        sum += arr[row][column+2]
        sum += arr[row+1][column+1]
        sum += arr[row+2][column]
        sum += arr[row+2][column+1]
        sum += arr[row+2][column+2]
        print(sum)
        return sum
    }
    
    var sum = -1000000
    
    for row in 0..<arr.count-2 {
        for column in 0..<arr.count-2 {
            sum = max(sum, anHourGlassSum(for: row, column: column))
        }
    }

    return sum
}

//hourglassSum(arr: [[1, 1, 1, 0, 0, 0,], [0, 1, 0, 0, 0, 0], [1, 1, 1, 0, 0, 0], [0,0, 2, 4, 4, 0], [0, 0, 0, 2, 0, 0], [0, 0, 1, 2, 4, 0]])



// Complete the rotLeft function below.

func rotLeft(a: [Int], d: Int) -> [Int] {
    let d = d % a.count
    return a.suffix(a.count-d) + a.prefix(d)
}

//rotLeft(a: [1,2,3,4,5], d: 3)



// Complete the minimumBribes function below.
func minimumBribes(q: [Int]) -> Void {

    var bribes = 0
    for i in 0..<q.count {
        let tag = q[i]
        let queuePosition = i+1
        if tag > queuePosition {
            let currentBribe = tag - queuePosition
            if currentBribe > 2 {
                print("Too chaotic")
                return
            }
            bribes += currentBribe
        }
    }
    print(bribes)
}

minimumBribes(q: <#T##[Int]#>)
