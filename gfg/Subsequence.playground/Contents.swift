import UIKit

/*
 A subsequence is a sequence that can be derived from another sequence by zero or more elements, without changing the order of the remaining elements.
 For the same example, there are 15 sub-sequences. They are (1), (2), (3), (4), (1,2), (1,3),(1,4), (2,3), (2,4), (3,4), (1,2,3), (1,2,4), (1,3,4), (2,3,4), (1,2,3,4). More generally, we can say that for a sequence of size n, we can have (2n-1) non-empty sub-sequences in total.
 A string example to differentiate: Consider strings “geeksforgeeks” and “gks”. “gks” is a subsequence of “geeksforgeeks” but not a substring. “geeks” is both a subsequence and subarray. Every subarray is a subsequence. More specifically, Subsequence is a generalization of substring.
 */

func subsequence(_ arr: [Int]) -> [[Int]] {
    var subsequences: [[Int]] = []
    let totalSubseq = NSDecimalNumber(decimal: pow(2, arr.count)).intValue
    for sequence in 1..<totalSubseq {
        var subSequence: [Int] = []
        for index in 0..<arr.count {
            if (sequence & (1 << index)) != 0  {
                subSequence.append(arr[index])
            }
        }
        subsequences.append(subSequence)
    }
    return subsequences
}


print(subsequence([1, 2, 3]))
