import UIKit

/*
 Question -
 You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.

 Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.

 You are given an API bool isBadVersion(version) which will return whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.

 Example:

 Given n = 5, and version = 4 is the first bad version.

 call isBadVersion(3) -> false
 call isBadVersion(5) -> true
 call isBadVersion(4) -> true

 Then 4 is the first bad version.
 */

/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        return firstBadVersion(inRangeFromStart: 1, end: n)
    }
    
    func firstBadVersion(inRangeFromStart start: Int, end: Int) -> Int {
        guard start <= end else { return 0 }
        
        let mid = start + ((end - start) / 2)
        
        guard isBadVersion(mid) else {
            return firstBadVersion(inRangeFromStart: mid + 1, end: end)
        }
        
        guard isOneLeftOfMidBadVersion(mid) == false else {
            return firstBadVersion(inRangeFromStart: start, end: mid - 1)
        }
        
        return mid
    }
    
    func isOneLeftOfMidBadVersion(_ mid: Int) -> Bool {
        return isBadVersion(mid - 1)
    }
}
