import UIKit

/*
 Given a string s, return the longest palindromic substring in s.

 Example 1:

 Input: s = "babad"
 Output: "bab"
 Note: "aba" is also a valid answer.
 Example 2:

 Input: s = "cbbd"
 Output: "bb"
 Example 3:

 Input: s = "a"
 Output: "a"
 Example 4:

 Input: s = "ac"
 Output: "a"
  

 Constraints:

 1 <= s.length <= 1000
 s consist of only digits and English letters (lower-case and/or upper-case),
 */

class Solution {
    func longestPalindrome(_ s: String) -> String {
        let stringArray = Array(s)
        var sol: [[Int]] = Array(repeating: Array(repeating: 0, count: s.count), count: s.count)
        var longestPal: String = ""
        let totalLength = s.count
        
        for i in 0..<totalLength {
            sol[i][i] = 1
        }
        print(sol)
        
        for i in 0..<totalLength - 1 {
            if stringArray[i] == stringArray[i+1] {
                sol[i][i+1] = 1
            }
        }
        print(sol)
        
        for i in 3..<totalLength + 1 {
            for j in 0..<totalLength - i + 1 {
                let lengthWiseEndIndex = j + i - 1
                guard stringArray[j] == stringArray[lengthWiseEndIndex] else {
                    sol[j][lengthWiseEndIndex] = 0
                    continue
                }
                if sol[j + 1][lengthWiseEndIndex - 1] == 1 {
                    sol[j][lengthWiseEndIndex] = 1
                }
            }
        }
        print(sol)
        return longestPal
    }
}

let sol = Solution()
sol.longestPalindrome("aabbaa")
