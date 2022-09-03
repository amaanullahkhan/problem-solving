import UIKit


class Solution {
    func buddyStrings(_ s: String, _ goal: String) -> Bool {
        var s = s.map({ String($0) })
        var goal = s.map({ String($0) })

        var i: Int?
        var j: Int?
        for k in 0..<s.count {
            if s[k] == goal[k] {
                if i == nil {
                    i = k
                } else if j == nil {
                    j = k
                } else {
                    return false
                }
            }
        }
        
        i = i ?? 0
        j = j ?? 1
        
        return s[i!] == goal[j!] && s[j!] == goal[i!]
    }
}


func climbStairs(_ n: Int) -> Int {
    var cache: [Int: Int] = [:]
    func climbStairs(_ n: Int, _ cache: inout [Int:Int]) -> Int {
         if n == 1 || n == 2 {
            return n
        }
        var result = cache[n]
        if result == nil {
            result = climbStairs(n-1, &cache) + climbStairs(n-2, &cache)
            cache[n] = result
        }
        return result!
    }
    return climbStairs(n, &cache)
}

func maxSubArray(_ nums: [Int]) -> Int {
    var maximum = Int.min
    var currentMax = nums[0]
    for i in 1..<nums.count {
        currentMax = max(nums[i], currentMax+nums[i])
        maximum = max(maximum, currentMax)
    }
    return maximum
}


class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        
    }
}

maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
climbStairs(5)




