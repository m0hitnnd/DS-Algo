import UIKit

/*
 Given a string s and a non-empty string p, find all the start indices of p's anagrams in s.

 Strings consists of lowercase English letters only and the length of both strings s and p will not be larger than 20,100.

 The order of output does not matter.

 Example 1:

 Input:
 s: "cbaebabacd" p: "abc"

 Output:
 [0, 6]

 Explanation:
 The substring with start index = 0 is "cba", which is an anagram of "abc".
 The substring with start index = 6 is "bac", which is an anagram of "abc".
 Example 2:

 Input:
 s: "abab" p: "ab"

 Output:
 [0, 1, 2]

 Explanation:
 The substring with start index = 0 is "ab", which is an anagram of "ab".
 The substring with start index = 1 is "ba", which is an anagram of "ab".
 The substring with start index = 2 is "ab", which is an anagram of "ab".
 */

class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        print(s.unicodeScalars)
        let sArray = Array(s)
        let pLength = p.count
        let sLength = s.count
        if sLength < pLength { return [] }
        
        var (pMap, windowMap) = countPatternFreq(p, andTextInitialWindow: s)
        
        if pLength == sLength {
            return pMap == windowMap ? [0] : []
        }
        
        var result: [Int] = []
        for i in (pLength)...(sLength - 1) {
            if pMap == windowMap {
                result.append((i - pLength))
            }
            let firstIndexOfWindow = i - pLength
            let windowFirstChar = sArray[firstIndexOfWindow]// s[s.index(s.startIndex, offsetBy: firstIndexOfWindow)]
            let firstElemFreq = windowMap[windowFirstChar] ?? 0
            windowMap[windowFirstChar] = (firstElemFreq - 1 != 0) ? (firstElemFreq - 1) : nil
            let nextChar = sArray[i]//s[s.index(s.startIndex, offsetBy: i)]
            windowMap[nextChar] = (windowMap[nextChar] ?? 0) + 1
        }
        
        if pMap == windowMap  {
            result.append((sLength - pLength))
        }
        
        return result
    }
    
//    private func checkIfOccurenceMatches(_ map1: [Character: Int], map2: [Character: Int]) -> Bool {
//        print(map1)
//        print(map2)
//        for map2KeyVal in map2 {
//            if map1[map2KeyVal.key] != map2KeyVal.value {
//                return false
//            }
//        }
//
//        return true
//    }
    
    private func countPatternFreq(_ pattern: String, andTextInitialWindow t: String) -> (pMap: [Character: Int], tMap: [Character: Int]) {
        var pMap: [Int] = []
        var tMap: [Int] = []
        
        for i in 0..
        
//        for (index, char) in pattern.enumerated() {
//            pMap[char] = (pMap[char] ?? 0) + 1
//            let tChar = t[t.index(t.startIndex, offsetBy: index)]
//            tMap[tChar] = (tMap[tChar] ?? 0) + 1
//        }
        return (pMap: pMap, tMap: tMap)
    }
}

let sol = Solution()
//print(sol.findAnagrams("asdadsd", "dsa"))
//
//print(sol.findAnagrams("cbaebabacd", "abc"))
//
//print(sol.findAnagrams("abab", "ab"))
//
//print(sol.findAnagrams("", "ab"))
//
print(sol.findAnagrams("ba", "ab"))
//
//print(sol.findAnagrams("aaaaaa", "a"))

//print(sol.findAnagrams("aa", "bb"))

//print(sol.findAnagrams("lzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajwlzfkvcrutnehgdopmixyqsbajw"
//, "lz"))
//
