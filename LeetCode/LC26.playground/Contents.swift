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
        let length = nums.count
        var sumValues: [[Int]] = Array(repeating: [], count: length)
        var maxLength = 0
        
        var i = 0
        var j = 0
        while i <= (length - 1) {
            j = 0
            while j <= i {
                let currentVal = (nums[i] == 0 ? -1 : 1)
                if j == i {
                    sumValues[i].insert(currentVal, at: j)
                } else {
                    sumValues[i].insert(sumValues[i-1][j] + currentVal, at: j)
                }
                if sumValues[i][j] == 0 {
                    maxLength = max(maxLength, (i - j + 1))
                }
                j += 1
            }
            i += 1
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

