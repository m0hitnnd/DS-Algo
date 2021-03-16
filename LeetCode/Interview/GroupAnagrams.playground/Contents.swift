import UIKit

/*
 Given an array of strings strs, group the anagrams together. You can return the answer in any order.

 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

  

 Example 1:
                 e-1
                 a-1
                 t-1
 Input: strs = ["eat","tea","tan","ate","nat","bat"]
 Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
 Example 2:

 Input: strs = [""]
 Output: [[""]]
 Example 3:

 Input: strs = ["a"]
 Output: [["a"]]
  

 Constraints:

 1 <= strs.length <= 104
 0 <= strs[i].length <= 100
 strs[i] consists of lower-case English letters.
 */


// O(nmlogm)
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var hashStringToAnagramsMap: [String: [String]] = [:]
        
        for str in strs {
            let sortedStr = String(str.sorted())
            if hashStringToAnagramsMap[sortedStr] != nil {
                hashStringToAnagramsMap[sortedStr]?.append(str)
            } else {
                hashStringToAnagramsMap[sortedStr] = [str]
            }
        }
        return Array(hashStringToAnagramsMap.values)
    }
}

let sol = Solution.init()
print(sol.groupAnagrams(["eat","tea","tan","ate","nat","bat"]))
print(sol.groupAnagrams([""]))
print(sol.groupAnagrams(["a"]))
