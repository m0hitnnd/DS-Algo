import UIKit

/*
 Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.

 You may assume that the array is non-empty and the majority element always exist in the array.

 Example 1:

 Input: [3,2,3]
 Output: 3
 Example 2:

 Input: [2,2,1,1,1,2,2]
 Output: 2
 */


class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var numHash: [Int: Int] = [:]
        for num in nums {
            numHash[num] = (numHash[num] ?? 0) + 1
        }
        
        for num in nums {
            if (numHash[num] ?? 0) > (nums.count / 2) {
                return num
            }
        }
        return -1
    }
}

let solution = Solution()
solution.majorityElement([3,2,3])
solution.majorityElement([2,2,1,1,1,2,2])
