import UIKit

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

