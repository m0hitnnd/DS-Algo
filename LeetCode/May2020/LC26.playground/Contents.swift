import UIKit


/*
 Given a binary array, find the maximum length of a contiguous subarray with equal number of 0 and 1.

 Example 1:

 Input: [0,1]
 Output: 2
 Explanation: [0, 1] is the longest contiguous subarray with equal number of 0 and 1.
 Example 2:

 Input: [0,1,0]
 Output: 2
 Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.
 Note: The length of the given binary array will not exceed 50,000.
 */

class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        var sumFirstIndexHash: [Int: Int] = [:]
        var maxLength = 0
        var value = 0
        for i in 0..<nums.count {
            value = value + (nums[i] == 0 ? -1 : 1)
            
            let firstTimeOccurrenceSumIndex = sumFirstIndexHash[value]
            if firstTimeOccurrenceSumIndex == nil {
                sumFirstIndexHash[value] = i
            }
            
            if value == 0 {
                maxLength = max(maxLength, i + 1)
            } else {
                maxLength = max(maxLength, i - (firstTimeOccurrenceSumIndex ?? i))
            }
        }
      
        return maxLength
    }
}

let sol = Solution()
print(sol.findMaxLength([0,1,0,0,1,1,0,0,0,0,0,1,1,1,1]))
print(sol.findMaxLength([0,1,0,0,1,0,0,0,0,0,1,1,1,1]))
print(sol.findMaxLength([0,1]))
print(sol.findMaxLength([0,1,0]))
print(sol.findMaxLength([0]))
print(sol.findMaxLength([1]))
print(sol.findMaxLength([]))

