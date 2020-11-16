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
    
    func printArrayInVertical(_ arr: [[Int]]) {
        for i in 0..<arr.count {
            print("\(arr[i]) \n")
        }
        print("\n\n")
    }
    
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else { return s }
        let stringArray = Array(s)
        var sol: [[Int]] = Array(repeating: Array(repeating: 0, count: s.count), count: s.count)
        let totalLength = s.count
        var maxLength = 1
        var startIndex = 0
                
        for i in 0..<totalLength {
            sol[i][i] = 1
        }
        for i in 0..<totalLength - 1 {
            if stringArray[i] == stringArray[i+1] {
                sol[i][i+1] = 1
                startIndex = i
                maxLength = 2
            }
        }

        for i in stride(from: 3, through: totalLength, by: 1) {
            for j in 0..<totalLength - i + 1 {
                let lengthWiseEndIndex = j + i - 1
                guard stringArray[j] == stringArray[lengthWiseEndIndex] else {
                    sol[j][lengthWiseEndIndex] = 0
                    continue
                }
                if sol[j + 1][lengthWiseEndIndex - 1] == 1 {
                    sol[j][lengthWiseEndIndex] = 1
                    
                    if i > maxLength {
                        maxLength = i
                        startIndex = j
                    }
                }
            }
        }
        let longestPalArray = stringArray[startIndex..<(startIndex + maxLength)]
        return String(longestPalArray)
    }
}

let sol = Solution()
print(sol.longestPalindrome("cbbd"))
print(sol.longestPalindrome("aabbaa"))
print(sol.longestPalindrome("bb"))
print(sol.longestPalindrome("abcd"))
print(sol.longestPalindrome("babad"))
print(sol.longestPalindrome("ac"))


