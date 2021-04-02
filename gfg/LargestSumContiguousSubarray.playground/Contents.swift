import UIKit

/*
 Write an efficient program to find the sum of contiguous subarray within a one-dimensional array of numbers that has the largest sum.
 */

func largestSum(_ arr: [Int]) -> Int {
    guard arr.count > 0 else { return Int.min }
    
    var maxSoFar = Int.min
    var currentMax = 0
    for startingIndex in 0..<arr.count {
        currentMax += arr[startingIndex]
        maxSoFar = max(maxSoFar, currentMax)
        if currentMax <= 0 {
            currentMax = 0
        }
    }
    return maxSoFar
}


largestSum([-2,-3,4,-1,-2,1,5,-3])
largestSum([-2,-3])

