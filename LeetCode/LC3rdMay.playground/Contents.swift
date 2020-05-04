import UIKit

/*
 Question:
 Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.

 Each letter in the magazine string can only be used once in your ransom note.

 Note:
 You may assume that both strings contain only lowercase letters.

 canConstruct("a", "b") -> false
 canConstruct("aa", "ab") -> false
 canConstruct("aa", "aab") -> true
 */

class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var ransomCharCount: [Character: Int] = [:]
        
        populateRansomCharCount(ransomNote: ransomNote, ransomCharCount: &ransomCharCount)
        
        for char in magazine {
            if let ransomCharValForMagazineChar = ransomCharCount[char] {
                ransomCharCount[char] = ransomCharValForMagazineChar - 1
            } // else ransom char does not require this magazine char
        }
        
        return (ransomCharCount.filter { $0.value > 0 }.isEmpty) ? true : false
    }
    
    private func populateRansomCharCount(ransomNote: String,
                                         ransomCharCount: inout [Character: Int]) {
        return ransomNote.forEach {
            if let val = ransomCharCount[$0] {
                ransomCharCount[$0] = val + 1
            } else {
                ransomCharCount[$0] = 1
            }
        }
    }
}

let sol = Solution()
sol.canConstruct("fffbfg","effjfggbffjdgbjjhhdegh")
sol.canConstruct("", "")
sol.canConstruct("", "asv")
