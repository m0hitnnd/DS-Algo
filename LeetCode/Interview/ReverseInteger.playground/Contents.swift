import UIKit

/*
 Given a 32-bit signed integer, reverse digits of an integer.

 Note:
 Assume we are dealing with an environment that could only store integers within the 32-bit signed integer range: [−2^31,  2^31 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.

  

 Example 1:

 Input: x = 123
 Output: 321
 Example 2:

 Input: x = -123
 Output: -321
 Example 3:

 Input: x = 120
 Output: 21
 Example 4:

 Input: x = 0
 Output: 0
  

 Constraints:

 -231 <= x <= 231 - 1
 */


class Solution {
    func reverse(_ x: Int) -> Int {
        var y = x
        var ans = 0
        while y != 0 {
            ans = ans * 10 + (y%10)
            if ans > Int32.max {
                return 0
            }
            if ans < Int32.min {
                return 0
            }
            y = y / 10
        }
        return ans
    }
}

let sol = Solution()
sol.reverse(123)
sol.reverse(-123)
sol.reverse(120)
sol.reverse(0)
print(Int32.max)
print(Int32.min)
sol.reverse(21474836478)
sol.reverse(-21474836487)
