import UIKit

/*
 Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.

 Follow up: The overall run time complexity should be O(log (m+n)).
 
 Example 1:

 Input: nums1 = [1,3], nums2 = [2]
 Output: 2.00000
 Explanation: merged array = [1,2,3] and median is 2.
 Example 2:

 Input: nums1 = [1,2], nums2 = [3,4]
 Output: 2.50000
 Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
 Example 3:

 Input: nums1 = [0,0], nums2 = [0,0]
 Output: 0.00000
 Example 4:

 Input: nums1 = [], nums2 = [1]
 Output: 1.00000
 Example 5:

 Input: nums1 = [2], nums2 = []
 Output: 2.00000
  

 Constraints:

 nums1.length == m
 nums2.length == n
 0 <= m <= 1000
 0 <= n <= 1000
 1 <= m + n <= 2000
 -106 <= nums1[i], nums2[i] <= 106

 */


// O((m+n)/2)

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let totalLength = nums1.count + nums2.count
        let medianIndex: Int = Int(ceil(Double(totalLength) / 2.0))
        
        var count = 0
        var nums1Index = 0
        var nums2Index = 0
        var ans: Double = 0
        while count != medianIndex {
            let valueAtNum1 = nums1.indices.contains(nums1Index) ? nums1[nums1Index] : Int.max
            let valueAtNum2 = nums2.indices.contains(nums2Index) ? nums2[nums2Index] : Int.max
            if count + 1 == medianIndex {
                if totalLength % 2 == 0 {
                    if valueAtNum1 <= valueAtNum2 {
                        if nums1.indices.contains(nums1Index + 1) {
                            let nextVal = valueAtNum2 <= nums1[nums1Index + 1] ? valueAtNum2 : nums1[nums1Index + 1]
                            ans = Double(valueAtNum1 + nextVal) / 2.0
                        } else {
                            ans = Double(valueAtNum1 + valueAtNum2) / 2.0
                        }
                    } else {
                        if nums2.indices.contains(nums2Index + 1) {
                            let nextVal = valueAtNum1 <= nums2[nums2Index + 1] ? valueAtNum1 : nums2[nums2Index + 1]
                            ans = Double(valueAtNum2 + nextVal) / 2.0
                        } else {
                            ans = Double(valueAtNum1 + valueAtNum2) / 2.0
                        }
                    }
                    
                } else {
                    ans = Double(min(valueAtNum1, valueAtNum2))
                }
            } else {
                if valueAtNum1 <= valueAtNum2 {
                    nums1Index += 1
                } else {
                    nums2Index += 1
                }
            }
            count += 1
        }
        return ans
    }
}

let sol = Solution()
print(sol.findMedianSortedArrays([1, 3], [2]))
print(sol.findMedianSortedArrays([1, 2], [3, 4]))
print(sol.findMedianSortedArrays([0, 0], [0, 0]))
print(sol.findMedianSortedArrays([], [1]))
print(sol.findMedianSortedArrays([2], []))
print(sol.findMedianSortedArrays([], [3, 5, 6]))
print(sol.findMedianSortedArrays([], [2, 3]))
print(sol.findMedianSortedArrays([2, 3], []))
print(sol.findMedianSortedArrays([2, 2, 2], [2, 2, 2, 2]))
print(sol.findMedianSortedArrays([2, 2, 2, 2], [2, 2, 2]))
print(sol.findMedianSortedArrays([1, 3], [2, 7]))






