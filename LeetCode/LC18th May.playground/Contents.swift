import UIKit

/*
 Given two strings s1 and s2, write a function to return true if s2 contains the permutation of s1. In other words, one of the first string's permutations is the substring of the second string.
 
 
 
 Example 1:
 
 Input: s1 = "ab" s2 = "eidbaooo"
 Output: True
 Explanation: s2 contains one permutation of s1 ("ba").
 Example 2:
 
 Input:s1= "ab" s2 = "eidboaoo"
 Output: False
 
 
 Note:
 
 The input strings only contain lower case letters.
 The length of both given strings is in range [1, 10,000].
 */

class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let sArray = Array(s2)
        //        let pArray = Array(p)
        let pLength = s1.count
        let sLength = s2.count
        if sLength < pLength { return false }
        
        var (pMap, windowMap) = countPatternFreq(s1, andTextInitialWindow: s2)
        
        if pLength == sLength {
            return pMap == windowMap ? true : false
        }
        
        for i in (pLength)...(sLength - 1) {
            if pMap == windowMap {
                return true
            }
            let firstIndexOfWindow = i - pLength
            let windowFirstChar = sArray[firstIndexOfWindow]
            let firstElemFreq = windowMap[windowFirstChar] ?? 0
            windowMap[windowFirstChar] = (firstElemFreq - 1 != 0) ? (firstElemFreq - 1) : nil
            let nextChar = sArray[i]
            windowMap[nextChar] = (windowMap[nextChar] ?? 0) + 1
        }
        
        if pMap == windowMap  {
            return true
        }
        
        return false
    }
    
    private func countPatternFreq(_ pattern: String, andTextInitialWindow t: String) -> (pMap: [Character: Int], tMap: [Character: Int]) {
        var pMap: [Character: Int] = [:]
        var tMap: [Character: Int] = [:]
        for (index, char) in pattern.enumerated() {
            pMap[char] = (pMap[char] ?? 0) + 1
            let tChar = t[t.index(t.startIndex, offsetBy: index)]
            tMap[tChar] = (tMap[tChar] ?? 0) + 1
        }
        return (pMap: pMap, tMap: tMap)
    }
}


let sol = Solution()
sol.checkInclusion("ab", "eidbaooo")
sol.checkInclusion("ab", "eidboaoo")
