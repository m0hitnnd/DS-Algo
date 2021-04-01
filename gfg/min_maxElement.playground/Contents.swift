import UIKit

/*
 Given an array, write functions to find the minimum and maximum elements in it.

 */

func min(_ arr: [Int]) -> Int? {
    guard arr.count > 0 else { return nil }
    var minVal: Int = arr[0]
    for item in arr {
        minVal = min(minVal, item)
    }
    return minVal
}


min([12, 1234, 45, 67, 1])
