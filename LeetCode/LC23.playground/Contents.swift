import UIKit

/*
 Given two lists of closed intervals, each list of intervals is pairwise disjoint and in sorted order.

 Return the intersection of these two interval lists.

 (Formally, a closed interval [a, b] (with a <= b) denotes the set of real numbers x with a <= x <= b.  The intersection of two closed intervals is a set of real numbers that is either empty, or can be represented as a closed interval.  For example, the intersection of [1, 3] and [2, 4] is [2, 3].)

  

 Example 1:



 Input: A = [[0,2],[5,10],[13,23],[24,25]], B = [[1,5],[8,12],[15,24],[25,26]]
 Output: [[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]
 Reminder: The inputs and the desired output are lists of Interval objects, and not arrays or lists.
  

 Note:

 0 <= A.length < 1000
 0 <= B.length < 1000
 0 <= A[i].start, A[i].end, B[i].start, B[i].end < 10^9
 NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
 */

class Solution {
    func intervalIntersection(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
        var intersection: [[Int]] = []
        var aIndex = 0
        var bIndex = 0
        while aIndex <= (A.count - 1), bIndex <= (B.count - 1) {
            let aRange = A[aIndex]
            let bRange = B[bIndex]
            let aStart = aRange[0]
            let aEnd = aRange[1]
            let bStart = bRange[0]
            let bEnd = bRange[1]
            
            if check(ifRange: (aStart, aEnd), precedesAnotherRange: (bStart, bEnd)) {
                aIndex += 1
                continue
            }
            
            if check(ifRange: (bStart, bEnd), precedesAnotherRange: (aStart, aEnd)) {
                bIndex += 1
                continue
            }
            
            if check(ifRange: (aStart, aEnd), isInsideAnotherRange: (bStart, bEnd)) {
                intersection.append(aRange)
                aIndex += 1
                continue
            }
            
            if check(ifRange: (bStart, bEnd), isInsideAnotherRange: (aStart, aEnd)) {
                intersection.append(bRange)
                bIndex += 1
                continue
            }
            
            if bStart >= aStart, bEnd >= aEnd {
                intersection.append([bStart, aEnd])
                aIndex += 1
                continue
            }
            
            if aStart >= bStart, aEnd >= bEnd {
                intersection.append([aStart, bEnd])
                bIndex += 1
                continue
            }
            
        }
        
        return intersection
    }
    
    private func check(ifRange range: (Int, Int),
                       isInsideAnotherRange parentRange: (Int, Int)) -> Bool {
        if range.0 >= parentRange.0 && range.1 <= parentRange.1 {
            return true
        }
        return false
    }
    
    private func check(ifRange range: (Int, Int), precedesAnotherRange anotherRange: (Int, Int) ) -> Bool {
        if range.1 < anotherRange.0 {
            return true
        }
        return false
    }
}


let sol = Solution()
print(sol.intervalIntersection([[0,2],[5,10],[13,23],[24,25]],
                        [[1,5],[8,12],[15,24],[25,26]]))

print(sol.intervalIntersection([], []))

print(sol.intervalIntersection([[1,2]], []))

print(sol.intervalIntersection([[0, 10]], [[1,2],[3,5],[6,8],[8,10]]))

print(sol.intervalIntersection( [[1,2],[3,5],[6,8],[8,10]],[[0, 10]]))
