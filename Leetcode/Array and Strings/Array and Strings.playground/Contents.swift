import UIKit

/*
 You are given an integer array prices where prices[i] is the price of a given stock on the ith day.

 On each day, you may decide to buy and/or sell the stock. You can only hold at most one share of the stock at any time. However, you can buy it then immediately sell it on the same day.

 Find and return the maximum profit you can achieve.
 */

func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        var currentProfit = 0
        var boughtIndex = 0
        for currentIndex in 1..<prices.count {
            let profit = prices[currentIndex] - prices[boughtIndex]
            if profit < currentProfit {
                maxProfit += currentProfit
                currentProfit = 0
                boughtIndex = currentIndex
            } else {
                currentProfit = profit
            }
        }
        if currentProfit > 0 {
            maxProfit += currentProfit
        }
        return maxProfit
}
maxProfit([7,1,5,3,6,4])
maxProfit([1,2,3,4,5])
maxProfit([7,6,4,3,1])

/*
 Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same. Then return the number of unique elements in nums.

 Consider the number of unique elements of nums to be k, to get accepted, you need to do the following things:

 Change the array nums such that the first k elements of nums contain the unique elements in the order they were present in nums initially. The remaining elements of nums are not important as well as the size of nums.
 Return k.
 */

func removeDuplicates(_ nums: inout [Int]) -> Int {
    var uniqueIndex = 0
    for i in 1..<nums.count {
        if nums[uniqueIndex] == nums[i] {
            continue
        }
        else {
            uniqueIndex += 1
            nums[uniqueIndex] = nums[i]
        }
    }
    var uniqueLength = uniqueIndex+1
    return uniqueLength
}

var array = [0,0,1,1,1,2,2,3,3,4]
removeDuplicates(&array)
array

/*
 Implement the myAtoi(string s) function, which converts a string to a 32-bit signed integer (similar to C/C++'s atoi function).

 The algorithm for myAtoi(string s) is as follows:

 Read in and ignore any leading whitespace.
 Check if the next character (if not already at the end of the string) is '-' or '+'. Read this character in if it is either. This determines if the final result is negative or positive respectively. Assume the result is positive if neither is present.
 Read in next the characters until the next non-digit character or the end of the input is reached. The rest of the string is ignored.
 Convert these digits into an integer (i.e. "123" -> 123, "0032" -> 32). If no digits were read, then the integer is 0. Change the sign as necessary (from step 2).
 If the integer is out of the 32-bit signed integer range [-231, 231 - 1], then clamp the integer so that it remains in the range. Specifically, integers less than -231 should be clamped to -231, and integers greater than 231 - 1 should be clamped to 231 - 1.
 Return the integer as the final result.
 Note:

 Only the space character ' ' is considered a whitespace character.
 Do not ignore any characters other than the leading whitespace or the rest of the string after the digits.
 
 */


func myAtoi(_ s: String) -> Int {
    
    let numbers = "0123456789"
    let characters = [Character](s)
    
    guard !characters.isEmpty else { return 0 }
    
    var index = 0
    while index < characters.count && characters[index] == " " {
        index += 1
    }
    
    var isNegative = false
    if index < characters.count && (characters[index] == "+" || characters[index] == "-") {
        isNegative = characters[index] == "-"
        index += 1
    }
    
    var total: Double = 0
    while index < characters.count, numbers.contains(characters[index]), let number = Int(String(characters[index])) {
        total *= 10
        total += Double(number)
        index += 1
    }
    if isNegative && total > pow(2.0, 31.0) {
        total = pow(2.0, 31.0)
    } else if !isNegative && total > pow(2.0, 31.0)-1 {
        total = pow(2.0, 31.0) - 1
    }
    return isNegative ? -Int(total) : Int(total)
}

myAtoi("5767")
myAtoi("+5767")
myAtoi("    -45677 afdadsfasdf")
myAtoi("asdfsdaf adfs 123")
myAtoi("-2000000000000000000000000")

//Given an integer array nums, return true if there exists a triple of indices (i, j, k) such that i < j < k and nums[i] < nums[j] < nums[k]. If no such indices exists, return false.
//
//
//
//Example 1:
//
//Input: nums = [1,2,3,4,5]
//Output: true
//Explanation: Any triplet where i < j < k is valid.
//Example 2:
//
//Input: nums = [5,4,3,2,1]
//Output: false
//Explanation: No triplet exists.
//Example 3:
//
//Input: nums = [2,1,5,0,4,6]
//Output: true
//Explanation: The triplet (3, 4, 5) is valid because nums[3] == 0 < nums[4] == 4 < nums[5] == 6.

class Solution {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        false
    }
}

//Given a string s, return the longest palindromic substring in s.
//
//
//
//Example 1:
//
//Input: s = "babad"
//Output: "bab"
//Note: "aba" is also a valid answer.
//Example 2:
//
//Input: s = "cbbd"
//Output: "bb"
//Example 3:
//
//Input: s = "a"
//Output: "a"
//Example 4:
//
//Input: s = "ac"
//Output: "a"

func longestPalindrome(_ s: String) -> String {
    let s = s.map({ String($0) })
    var positions: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: s.count), count: s.count)
    var start = 0
    var end = 0
    for j in 1..<s.count {
        for i in 0..<j {
            if j-i <= 2 && s[j] == s[i] || positions[i+1][j-1] && s[j] == s[i] {
                positions[i][j] = true
                if j-i > end-start {
                    start = i
                    end = j
                }
            }
        }
    }
    return s[start...end].joined()
}

longestPalindrome("babad")
longestPalindrome("cbbd")
longestPalindrome("a")
longestPalindrome("ac")
longestPalindrome("ccc")
longestPalindrome("cccc")



//Longest Substring Without Repeating Characters
//
//Solution
//Given a string s, find the length of the longest substring without repeating characters.
//
//
//
//Example 1:
//
//Input: s = "abcabcbb"
//Output: 3
//Explanation: The answer is "abc", with the length of 3.
//Example 2:
//
//Input: s = "bbbbb"
//Output: 1
//Explanation: The answer is "b", with the length of 1.
//Example 3:
//
//Input: s = "pwwkew"
//Output: 3
//Explanation: The answer is "wke", with the length of 3.
//Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
//Example 4:
//
//Input: s = ""
//Output: 0

func lengthOfLongestSubstring(_ s: String) -> Int {
    guard !s.isEmpty else {return 0}
    var unique = [Character]()
    var longest = unique.count
    for char in s {
        if unique.contains(char) {
            longest = max(unique.count, longest)
            unique.removeSubrange(0...unique.firstIndex(of: char)!)
        }
        unique.append(char)
    }
    longest = max(unique.count, longest)
    return longest
}

lengthOfLongestSubstring("abcabcbb")
lengthOfLongestSubstring("bbbbb")
lengthOfLongestSubstring("pwwkew")
lengthOfLongestSubstring("au")
lengthOfLongestSubstring("")
lengthOfLongestSubstring(" ")
lengthOfLongestSubstring("dvdf")

//Group Anagrams
//
//Given an array of strings strs, group the anagrams together. You can return the answer in any order.
//
//An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
//
//
//
//Example 1:
//
//Input: strs = ["eat","tea","tan","ate","nat","bat"]
//Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
//Example 2:
//
//Input: strs = [""]
//Output: [[""]]
//Example 3:
//
//Input: strs = ["a"]
//Output: [["a"]]

func groupAnagrams(_ strs: [String]) -> [[String]] {
    var groups: [[Character]: [String]] = [:]
    for str in strs {
        groups[str.sorted(), default: [String]()].append(str)
    }
    return Array(groups.values)
}

groupAnagrams(["eat","tea","tan","ate","nat","bat"])




//Given an m x n integer matrix matrix, if an element is 0, set its entire row and column to 0's, and return the matrix.
//
//You must do it in place.

//Input: matrix = [[1,1,1],[1,0,1],[1,1,1]]
//Output: [[1,0,1],[0,0,0],[1,0,1]]

//Input: matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
//Output: [[0,0,0,0],[0,4,5,0],[0,3,1,0]]

func setZeroes(_ matrix: inout [[Int]]) {
    
    var colums = Set<Int>()
    var rows = Set<Int>()
    
    for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
            if matrix[i][j] == 0 {
                colums.insert(j)
                rows.insert(i)
            }
        }
    }
    
    for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
            if rows.contains(i) || colums.contains(j) {
                matrix[i][j] = 0
            }
        }
    }
}

var matrix1 = [[1,1,1],[1,0,1],[1,1,1]]
var matrix2 = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
setZeroes(&matrix1)
setZeroes(&matrix2)




//Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.
//
//Notice that the solution set must not contain duplicate triplets.

func threeSum(_ nums: [Int]) -> [[Int]] {
    
    guard nums.count > 2 else {
        return []
    }
    
    var dict: [Int: Int] = [:]
    var solution = Set<[Int]>()
    
    for (index, num) in nums.enumerated() {
        dict[num] = index
    }
    
    guard dict.count > 2 else {return []}
    
    for i in 0..<nums.count-2 {
        for j in i+1..<nums.count-1 {
            if let k = dict[0 - nums[i] - nums[j]], k != i, k != j {
                let array = [nums[i], nums[j], nums[k]]
                solution.insert(array.sorted())
            }
        }
    }
    
    return Array(solution).reversed()
}

threeSum([-1,0,1,2,-1,-4])
threeSum([])
threeSum([0])
threeSum([1,2,-2,-1])

