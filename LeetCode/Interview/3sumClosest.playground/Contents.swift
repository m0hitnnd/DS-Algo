import UIKit

/*
 Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.

  

 Example 1:

 Input: nums = [-1,2,1,-4], target = 1
 Output: 2
 Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
  

 Constraints:

 3 <= nums.length <= 10^3
 -10^3 <= nums[i] <= 10^3
 -10^4 <= target <= 10^4
 */

class Solution {
    
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let sortedNum = nums.sorted()
        var closest: Int = 10000
        for i in 0..<sortedNum.count {
            if i == 0 || sortedNum[i-1] != sortedNum[i] {
                print("first for loop \(i)")
                twoSum(sortedNum, zIndex: i, threeSumTargetValue: target, closest: &closest)
            }
        }
        return closest
    }
    
    func twoSum(_ nums: [Int], zIndex: Int, threeSumTargetValue: Int , closest: inout Int) {
        
        var minValuePointer: Int = zIndex + 1
        var maxValuePointer: Int = nums.count - 1
        let twoSumTargetValue = threeSumTargetValue - nums[zIndex] // -101
        print("twoSumTargetValue \(twoSumTargetValue)")
        
        while minValuePointer < maxValuePointer {
            let minValue = nums[minValuePointer] // 1
            let maxValue = nums[maxValuePointer] // 1
            let twoSumFound = minValue + maxValue // 2
            
            print("minValue \(minValue)")
            print("maxValue \(maxValue)")
            print("twoSumFound \(twoSumFound)")
            
            if twoSumFound < twoSumTargetValue {
                minValuePointer += 1
                let diff = twoSumTargetValue - twoSumFound
                if diff < abs(closest - threeSumTargetValue)  {
                    closest = twoSumFound + nums[zIndex]
                    print("closest - \(closest)")
                }
            } else if twoSumFound > twoSumTargetValue {
                maxValuePointer -= 1
                let diff = twoSumFound - twoSumTargetValue // 103
                print("diff - \(diff)")
                print("closest - \(closest - threeSumTargetValue)")
                if diff < abs(closest - threeSumTargetValue)  {
                    closest = twoSumFound + nums[zIndex] // 3
                    print("closest - \(closest)")
                }
            } else {
                closest = twoSumFound + nums[zIndex]
                print("closest - \(closest)")
                return
            }
        }
    }
}

let sol = Solution()
//sol.threeSumClosest([-1, 2, 1, -4], 1)
//sol.threeSumClosest([1,1,-1], 1)
sol.threeSumClosest([1,1,1,1], -100)

/*
 x + y + z = t
 x + y = t - z as k
 x + y = k
 -4 -1 1 2
 -1 1 1
 
 */
