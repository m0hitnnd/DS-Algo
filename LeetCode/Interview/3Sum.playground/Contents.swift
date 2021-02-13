import UIKit

/*
 Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
 
 Notice that the solution set must not contain duplicate triplets.
 
 
 
 Example 1:
 
 Input: nums = [-1,0,1,2,-1,-4]
 Output: [[-1,-1,2],[-1,0,1]]
 Example 2:
 
 Input: nums = []
 Output: []
 Example 3:
 
 Input: nums = [0]
 Output: []
 
 
 Constraints:
 
 0 <= nums.length <= 3000
 -105 <= nums[i] <= 105
 */

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        let sortedNum = nums.sorted()
        for i in 0..<sortedNum.count {
            if i == 0 || sortedNum[i] != sortedNum[i - 1] {
                twoSum(nums: sortedNum, targetIndex: i, res: &result)
            }
        }
        return result
    }
    
    // x + y = -z
    func twoSum(nums: [Int], targetIndex: Int, res: inout [[Int]]) {
        var minValuePointer = targetIndex + 1
        var maxValuePointer = nums.count - 1
        let targetVal = -(nums[targetIndex])

        while minValuePointer < maxValuePointer {
            let minVal = nums[minValuePointer]
            let maxVal = nums[maxValuePointer]
            let totalSum = minVal + maxVal
            if totalSum > targetVal {
                maxValuePointer -= 1
            } else if totalSum < targetVal {
                minValuePointer += 1
            } else {
                res.append([-targetVal, minVal, maxVal])
                minValuePointer += 1
                maxValuePointer -= 1
                while minValuePointer < maxValuePointer, nums[minValuePointer] == nums[minValuePointer - 1] {
                    minValuePointer += 1
                }
            }
        }
    }
}

let sol = Solution()
sol.threeSum([-1,0,1,2,-1,-4, 0, 1]) // -4, -1, -1, 0, 0 , 1, 1, 2
sol.threeSum([0, -1, 2, -3, 1])
sol.threeSum([])
sol.threeSum([0])
sol.threeSum([0,0,0])


