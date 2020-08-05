import UIKit

/*
 Given a positive integer, output its complement number. The complement strategy is to flip the bits of its binary representation.

  

 Example 1:

 Input: 5
 Output: 2
 Explanation: The binary representation of 5 is 101 (no leading zero bits), and its complement is 010. So you need to output 2.
  

 Example 2:

 Input: 1
 Output: 0
 Explanation: The binary representation of 1 is 1 (no leading zero bits), and its complement is 0. So you need to output 0.
  

 Note:

 The given integer is guaranteed to fit within the range of a 32-bit signed integer.
 You could assume no leading zero bit in the integer’s binary representation.
 This question is the same as 1009: https://leetcode.com/problems/complement-of-base-10-integer/
 */

class Solution {
    func findComplement(_ num: Int) -> Int {
        guard num != 0 else { return 1 }
        let numberOfBitsInNum = numberOfBits(inNum: num)
        let highestPossibleValue: Int = Int(pow(Double(2), Double(numberOfBitsInNum)) - 1)
        return (num ^ highestPossibleValue)
        
    }
    
    private func numberOfBits(inNum num: Int) -> Int {
        var numCopy = num
        var numberOfBitsInNum = 0
        while numCopy != 0 {
            numCopy = numCopy / 2
            numberOfBitsInNum = numberOfBitsInNum + 1
        }
        return numberOfBitsInNum
    }
}

let sol = Solution.init()
sol.findComplement(5)
sol.findComplement(1)
sol.findComplement(0)

