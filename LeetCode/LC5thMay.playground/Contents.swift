import UIKit

/*
 Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.

 Examples:

 s = "leetcode"
 return 0.

 s = "loveleetcode",
 return 2.
 Note: You may assume the string contain only lowercase letters.
 */

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var charHash: [Character: Int] = [:]
        let charactersArray = Array<Character>(s)
        for char in charactersArray {
            charHash[char] = (charHash[char] ?? 0) + 1
        }
        
        for (index, char) in charactersArray.enumerated() {
            if charHash[char] == 1 {
                return index
            }
        }
        return -1
    }
}

let sol = Solution()
sol.firstUniqChar("leetcode")
sol.firstUniqChar("loveleetcode")
sol.firstUniqChar("")
