import UIKit

/*
 Given a non-negative integer x, compute and return the square root of x.

 Since the return type is an integer, the decimal digits are truncated, and only the integer part of the result is returned.

  

 Example 1:

 Input: x = 4
 Output: 2
 Example 2:

 Input: x = 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since the decimal part is truncated, 2 is returned.
  

 Constraints:

 0 <= x <= 231 - 1

 */

class Solution {
    func mySqrt(_ x: Int) -> Int {
        if x == 0 { return 0 }
        if x == 1 || x == 2 || x == 3 { return 1 }
        var left = 2
        var right = x/2
        
        while left <= right {
            let mid = ((right - left) / 2) + left
            let calculatedx = mid * mid
            if calculatedx == x {
                return mid
            } else if calculatedx > x {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return right
    }
}

let sol = Solution()
sol.mySqrt(8)
sol.mySqrt(4)
sol.mySqrt(10)
sol.mySqrt(16)
sol.mySqrt(64)
sol.mySqrt(1000000000)
sol.mySqrt(5)
