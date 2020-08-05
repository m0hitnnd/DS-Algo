import UIKit

/*
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 Example:

 Given nums = [2, 7, 11, 15], target = 9,

 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 */


class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var occurence: [Int: Int] = [:]
        
        for (index, num) in nums.enumerated() {
            let otherNum = target - num
            if occurence.contains(where: { (key, _) -> Bool in
                key == otherNum
            }) {
                let occurenceIndex = occurence[otherNum] ?? 0
                return [index, occurenceIndex]
            } else {
                occurence[num] = index
            }
        }
        return []
    }
}

let sol = Solution()
sol.twoSum([2, 7, 11, 15], 9)
sol.twoSum([-2, 10, 1, 2], 8)
sol.twoSum([3, 2, 3], 6)
sol.twoSum([3,2,4], 6)
