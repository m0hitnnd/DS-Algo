import UIKit

/*
 Given a string, find the length of the longest substring without repeating characters.

 Example 1:

 Input: "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:

 Input: "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
              Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */


class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var charactersHash: [Character: Int] = [:]
        var windowIntialIndex = 0
        var maxLength = 0
        for (index, char) in s.enumerated() {
            if charactersHash[char] == nil || charactersHash[char]! < windowIntialIndex {
                charactersHash[char] = index
            } else {
                maxLength = max(maxLength, (index - windowIntialIndex))
                windowIntialIndex = charactersHash[char]! + 1
                charactersHash[char] = index
            }
        }
        maxLength = max(maxLength, (s.count - windowIntialIndex))
        return maxLength
    }
}

let sol = Solution()
sol.lengthOfLongestSubstring("dvdf")
sol.lengthOfLongestSubstring("abcabcbb")
sol.lengthOfLongestSubstring("bbbbb")
sol.lengthOfLongestSubstring("pwwkew")
sol.lengthOfLongestSubstring("abba")
