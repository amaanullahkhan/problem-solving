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
//func minimumBribes(q: [Int]) -> Void {
//    var bribes = 0
//    for i in 0..<q.count {
//        let tag = q[i]
//        let queuePosition = i+1
//        // check if a person gave bribe more than two times
//        if tag - queuePosition > 2 {
//            print("Too chaotic")
//            return
//        }
//        // count tags which are in front of each tag and have higher value (count how many times a person is bribed)
//        for frontPosition in 0...max(i-1, 0) { //
//            if q[frontPosition] > tag {
//                bribes += 1
//            }
//        }
//    }
//    print(bribes)
//}

func minimumBribes(q: [Int]) -> Void {
    var bribes = 0
    for i in 0..<q.count {
        // check if a person gave bribe more than two times
        if q[i] - (i+1) > 2 {
            print("Too chaotic")
            return
        }
        // count tags which are in front of each tag and have higher value (count how many times a person is bribed)
        let startIndex = q[i] - 2 <= 0 ? 0 : q[i] - 2
        if startIndex < i {
            for iterator in startIndex..<i {
                if q[iterator] > q[i] {
                    bribes += 1
                }
            }
        }
    }
    print(bribes)
}
//minimumBribes(q: [1, 2, 5, 3, 7, 8, 6, 4])


// Complete the minimumSwaps function below.
//func minimumSwaps(arr: [Int]) -> Int {
//    var swaps = 0
//    var array = arr
//    var dict = Dictionary(uniqueKeysWithValues: array.enumerated().map({($0.1, $0.0+1)}))
//    for i in 0..<array.count {
//        if array[i] != i+1 {
//
//            let item = array[i]
//            let shouldBeItem = i+1
//
//            let j = dict[shouldBeItem]! - 1
//            print("\(i), \(j)")
//            print(array)
//            array.swapAt(i, j)
//
//            let d = dict[item]!
//            dict[item] = dict[shouldBeItem]
//            dict[shouldBeItem] = d
//
//            swaps += 1
//        }
//    }
//    return swaps
//}
func minimumSwaps(arr: [Int]) -> Int {
    var swaps = 0
    var array = arr
    for i in 0..<array.count {
        if array[i] != i+1 {
            var j = i
            while array[j] != i+1 {
                j += 1
            }
            array.swapAt(i, j)
            swaps += 1
        }
    }
    return swaps
}
//minimumSwaps(arr: [1,3,5,2,4,6,7])


// Complete the arrayManipulation function below.
func arrayManipulation(n: Int, queries: [[Int]]) -> Int {
    var array = Array(repeating: 0, count: n+1)
    for query in queries {
        let a = query[0]-1
        let b = query[1]-1
        array[a] += query[2]
        array[b+1] -= query[2]
    }
    var sum = 0
    var maximum = 0
    for element in array {
        sum += element
        maximum = max(sum, maximum)
    }
    return maximum
}

//arrayManipulation(n: 5, queries: [[1,2,100],[2,5,100],[3,4,100]])


/*
 * Complete the 'maxElement' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER n
 *  2. INTEGER maxSum
 *  3. INTEGER k
 */

func maxElement(n: Int, maxSum: Int, k: Int) -> Int {
    var integers = Array(repeating: maxSum/n, count: n)
    var dist = maxSum%n
    var kDiff = 0
    while dist > 0 {
        integers[k-kDiff] += 1
        dist -= 1
        kDiff += 1
    }
    integers
    return integers[k]
}

//maxElement(n: 3, maxSum: 7, k: 1)
//maxElement(n: 4, maxSum: 6, k: 2)


// Complete the checkMagazine function below.
func checkMagazine(magazine: [String], note: [String]) -> Void {
    
    var magazineDict: [String: Int] = [:]
    magazine.forEach { (word) in
        magazineDict[word] = (magazineDict[word] ?? 0) + 1
    }
    
    for word in note {
        if magazineDict[word] == nil || magazineDict[word]! == 0 {
            print("No")
            return
        }
        magazineDict[word] = magazineDict[word]! - 1
    }
    
    print("Yes")
    
}

//checkMagazine(magazine: ["ive", "got", "a", "lovely", "bunch", "of", "coconuts"], note: ["ive", "got", "some", "coconuts"])


// Complete the twoStrings function below.
func twoStrings(s1: String, s2: String) -> String {
    return Set(s1).intersection(Set(s2)).count > 0 ? "YES" : "NO"
}

//twoStrings(s1: "and", s2: "art")
//twoStrings(s1: "be", s2: "cat")


//abba

// Complete the sherlockAndAnagrams function below.
func sherlockAndAnagrams(s: String) -> Int {
    
    var substrings: [[Character]] = []
    var anagrams = 0
    
    for i in 0..<s.count {
        let start = s.index(s.startIndex, offsetBy: i)
        for j in (i)..<s.count {
            let end = s.index(s.startIndex, offsetBy: j)
            let substring = s[start...end].sorted()
            for sub in substrings {
                if sub == substring {
                    anagrams += 1
                }
            }
            substrings.append(substring)
        }
    }
    
    return anagrams

}

//print(sherlockAndAnagrams(s: "cdcd"))

// 1 3 9 9 27 81
// Complete the countTriplets function below.
func countTriplets(arr: [Int], r: Int) -> Int {
    
    var triplets = 0
    var dict: [Int: [Int]] = [:]
    
    arr.enumerated().forEach { (index, element) in
        var indexes: [Int] = dict[element] ?? []
        indexes.append(index)
        dict[element] = indexes
    }
    
    arr.enumerated().forEach { (i, element) in
        let secondMultiple = element * r
        guard
            let secondMultipleIndexes = dict[secondMultiple] else { return }
        let thirdMultiple = secondMultiple * r
        guard
            let thirdMultipleIndexes = dict[thirdMultiple] else {return}
        for j in secondMultipleIndexes.lazy.reversed() {
            guard i < j else {break}
            for k in thirdMultipleIndexes.lazy.reversed() {
                guard j < k else {break}
                triplets += 1
            }
        }
    }
    
    return triplets
}

//countTriplets(arr: [1, 3, 9, 9, 27, 81], r: 3)
//countTriplets(arr: [1, 5, 5, 25, 125], r: 5)
//countTriplets(arr: [1, 2, 2, 4], r: 2)

func freqQuery(queries: [[Int]]) -> [Int] {
    var valueFrequency: [Int: Int] = [:] // value: frequency
    var frequencyOfFrequency: [Int: Int] = [:] //  valueFrequency: frequencyOfValueFrequency
    var result: [Int] = []
    for query in queries {
        let operation = query[0]
        let value = query[1]
        switch operation {
        case 1:
            
            let oldFrequency = valueFrequency[value, default: 0]
            let newFrequency = oldFrequency + 1
            
            valueFrequency[value] = newFrequency
            frequencyOfFrequency[oldFrequency] = frequencyOfFrequency[oldFrequency, default: 0] - 1
            frequencyOfFrequency[newFrequency] = frequencyOfFrequency[newFrequency, default: 0] + 1
    
        case 2:
            if let oldFrequency = valueFrequency[value], oldFrequency > 0 {
                let oldFrequency = valueFrequency[value, default: 0]
                let newFrequency = oldFrequency - 1
                
                valueFrequency[value] = newFrequency
                frequencyOfFrequency[oldFrequency] = frequencyOfFrequency[oldFrequency, default: 0] - 1
                frequencyOfFrequency[newFrequency] = frequencyOfFrequency[newFrequency, default: 0] + 1
            }
        case 3:
            frequencyOfFrequency[value, default: 0] > 0 ? result.append(1) : result.append(0)
        default:
            break
        }
    }
    return result
}


//freqQuery(queries: [[1,1],[2,1],[1,1],[1,1],[3,2],[1,1],[3,3]])


func countSwaps(a: [Int]) -> Void {
    var a = a
    var totalSwaps = 0
    for _ in 0..<a.count {
        var swaps = 0
        for j in 0..<a.count-1 {
            // Swap adjacent elements if they are in decreasing order
            if (a[j] > a[j + 1]) {
                a.swapAt(j, j+1)
                swaps += 1
            }
        }
        totalSwaps += swaps
        if swaps == 0 {
            break
        }
    }
    print("Array is sorted in \(totalSwaps) swaps.")
    print("First Element: \(a.first!)")
    print("Last Element: \(a.last!)")
}

//countSwaps(a: [1,2,3])

func maximumToys(prices: [Int], k: Int) -> Int {
    
    var maxToys = 0
    var amountRemaining = k
    for price in prices.sorted()  {
        guard amountRemaining >= price else {
            break
        }
        amountRemaining -= price
        maxToys += 1
    }
    return maxToys
}
//maximumToys(prices: [1,2,3,4], k: 7)


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

//countingSort([4,2,2,8,3,3,1])

func activityNotifications(expenditure: [Int], d: Int) -> Int {
    
    let pos1 = Int(ceil(Double(d)/2.0))
    let pos2 = Int(floor(Double(d)/2.0)+1)
        
    var trailingExpenditures = [Int](repeating: 0, count: 201)
    
    for exp in expenditure[..<d] {
        trailingExpenditures[exp] += 1
    }
    
    func median() -> Double {
        var cumulativeSum = 0
        var median1 = 0
        var median2 = 0
        for (exp, count) in trailingExpenditures.enumerated() {
            cumulativeSum += count
            if cumulativeSum >= pos1 && median1 == 0 {
                median1 = exp
            }
            if cumulativeSum >= pos2 {
                median2 = exp
                break
            }
        }
        return Double(median1 + median2) / 2.0
    }
    
    var notificationsCount = 0
    for (day, exp) in expenditure[d...].enumerated() {
        if Double(exp) >= 2.0 * median() {
            notificationsCount += 1
        }
        trailingExpenditures[exp] += 1
        trailingExpenditures[expenditure[day]] -= 1
    }
    return notificationsCount
}

//activityNotifications(expenditure: [10, 20, 30, 40, 50], d: 3)
//activityNotifications(expenditure: [2, 3, 4, 2, 3, 6, 8, 4, 5], d: 5)
//activityNotifications(expenditure: [1, 2, 3, 4, 4], d: 4)

