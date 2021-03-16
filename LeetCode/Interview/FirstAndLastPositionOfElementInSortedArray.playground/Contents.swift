import UIKit

/*
 Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.

 If target is not found in the array, return [-1, -1].

 Follow up: Could you write an algorithm with O(log n) runtime complexity?

 Example 1:

 Input: nums = [5,7,7,8,8,10], target = 8
 Output: [3,4]
 Example 2:

 Input: nums = [5,7,7,8,8,10], target = 6
 Output: [-1,-1]
 Example 3:

 Input: nums = [], target = 0
 Output: [-1,-1]
  

 Constraints:

 0 <= nums.length <= 105
 -109 <= nums[i] <= 109
 nums is a non-decreasing array.
 -109 <= target <= 109
 */

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
     
        return binarySearch(nums: nums, start: 0, end: nums.count - 1, target: target)
    }
    
    private func binarySearch(nums: [Int], start: Int, end: Int, target: Int) -> [Int] {
        
        guard start <= end else { return [-1, -1] }
        
        let mid  = start + (end - start / 2)
        
        if nums[mid] < target {
            return binarySearch(nums: nums, start: mid + 1, end: end, target: target)
        } else if nums[mid] > target {
            return binarySearch(nums: nums, start: start, end: mid - 1, target: target)
        } else {
            let leftMostIndex = findLeftMostIndex(nums: nums, start: mid, target: target)
            let rightMostIndex = findrightMostIndex(nums: nums, start: mid, target: target)
            return [leftMostIndex, rightMostIndex]
        }
    }
    
    private func findLeftMostIndex(nums: [Int], start: Int, target: Int) -> Int {
        var index = start - 1
        while index >= 0, nums[index] == target {
                index -= 1
        }
        return index + 1
    }
    
    private func findrightMostIndex(nums: [Int], start: Int, target: Int) -> Int {
        var index = start + 1
        while index <= (nums.count - 1), nums[index] == target {
                index += 1
        }
        return index - 1
    }
}

let sol = Solution()
sol.searchRange([5,7,7,8,8,10], 8)
sol.searchRange([5,7,7,8,8,10], 6)
sol.searchRange([5,7,8,8,8,10], 8)
sol.searchRange([], 0)

