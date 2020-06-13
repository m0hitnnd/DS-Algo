import UIKit

/*
 Given an array with n objects colored red, white or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white and blue.

 Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.

 Note: You are not suppose to use the library's sort function for this problem.

 Example:

 Input: [2,0,2,1,1,0]
 Output: [0,0,1,1,2,2]
 Follow up:

 A rather straight forward solution is a two-pass algorithm using counting sort.
 First, iterate the array counting number of 0's, 1's, and 2's, then overwrite array with total number of 0's, then 1's and followed by 2's.
 Could you come up with a one-pass algorithm using only constant space?
 */


class Solution {
    func sortColors(_ nums: inout [Int]) {
        var zeroIndex = 0
        var twoIndex = nums.count - 1
        var traversalIndex = 0
        
        while traversalIndex <= twoIndex {
            if nums[traversalIndex] == 0 {
                nums.swapAt(traversalIndex, zeroIndex)
                zeroIndex += 1
                traversalIndex += 1
                continue
            }
            
            if nums[traversalIndex] == 2 {
                nums.swapAt(traversalIndex, twoIndex)
                twoIndex -= 1
                continue
            }
            traversalIndex += 1
        }
    }
}

let sol = Solution()
var num1 = [1, 2, 0]
sol.sortColors(&num1)
print(num1)
