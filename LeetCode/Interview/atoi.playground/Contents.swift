import UIKit

/*
 Implement atoi which converts a string to an integer.
 
 The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.
 
 The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.
 
 If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.
 
 If no valid conversion could be performed, a zero value is returned.
 
 Note:
 
 Only the space character ' ' is considered as whitespace character.
 Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. If the numerical value is out of the range of representable values, INT_MAX (231 − 1) or INT_MIN (−231) is returned.
 
 Example 1:
 
 Input: "42"
 Output: 42
 Example 2:
 
 Input: "   -42"
 Output: -42
 Explanation: The first non-whitespace character is '-', which is the minus sign.
 Then take as many numerical digits as possible, which gets 42.
 Example 3:
 
 Input: "4193 with words"
 Output: 4193
 Explanation: Conversion stops at digit '3' as the next character is not a numerical digit.
 Example 4:
 
 Input: "words and 987"
 Output: 0
 Explanation: The first non-whitespace character is 'w', which is not a numerical
 digit or a +/- sign. Therefore no valid conversion could be performed.
 Example 5:
 
 Input: "-91283472332"
 Output: -2147483648
 Explanation: The number "-91283472332" is out of the range of a 32-bit signed integer.
 Thefore INT_MIN (−231) is returned.
 */

class Solution {
    func myAtoi(_ str: String) -> Int {
        var num: Int = 0
        var numeralCharFound: Bool = false
        var isNegative: Bool? = nil
        
        for char in str {
            guard num < Int32.max else {
                num = abs((isNegative == false) ? Int(Int32.max) : Int(Int32.min))
                break
            }
            
            if char == " " {
                if  numeralCharFound == false, isNegative == nil {
                    continue
                } else {
                    break
                }
            }
            
            if char == "-" {
                if  numeralCharFound == false, isNegative == nil {
                    isNegative = true
                    continue
                } else {
                    break
                }
            }
            
            if char == "+" {
                if  numeralCharFound == false, isNegative == nil {
                    isNegative = false
                    continue
                } else {
                    break
                }
            }
            
            guard let intChar = char.wholeNumberValue else {
                break
            }
            numeralCharFound = true
            num = num * 10 + intChar
        }
        num = (isNegative ?? false) ? (0 - num) : num
        num  = num < 0 ? max(num, Int(Int32.min)) : min(num, Int(Int32.max))
        return num
    }
}

let sol = Solution()
sol.myAtoi("42")
sol.myAtoi("-42")
sol.myAtoi("   -42")
sol.myAtoi("   +42")
sol.myAtoi("   -0")
sol.myAtoi("4193 with words")
sol.myAtoi("words and 987")
sol.myAtoi("-91283472332")
sol.myAtoi("4  24")
sol.myAtoi("+-2")
sol.myAtoi("-+4")
sol.myAtoi("-4+2")
sol.myAtoi("4+2")
sol.myAtoi("   +0 123")
print(Int32.max)
print(Int.max)
sol.myAtoi("20000000000000000000")
sol.myAtoi("-20000000000000000000")
sol.myAtoi("9223372036854775807")
sol.myAtoi("-   234")

