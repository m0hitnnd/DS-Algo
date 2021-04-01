import UIKit

/*
 Given an array and a number k where k is smaller than size of array, we need to find the k’th smallest element in the given array. It is given that all array elements are distinct.
 */



func kSmallestElement(_ k: Int, arr: [Int]) -> Int? {
    guard k <= arr.count else {
        return nil
    }
        
    var heapedArray: [Int] = []
    for element in arr {
        insertIntoHeap(element, heapedArray: &heapedArray)
    }
    print(heapedArray)
    for _ in 1...k - 1 {
        extractMin(fromHeapedArray: &heapedArray)
    }
    return getTopOfHeap(heapedArray)
}

func insertIntoHeap(_ element: Int, heapedArray: inout [Int]) {
    heapedArray.append(element)
    heapifyUp(&heapedArray, index: heapedArray.count - 1)
}

func heapifyUp(_ arr: inout [Int], index: Int) {
    print(index)
    let parentIndex = index + 1 / 2 - 1
    guard parentIndex >= 0 else {
        return
    }
    
    if arr[index] <=  arr[parentIndex] {
        arr.swapAt(index, parentIndex)
        heapifyUp(&arr, index: parentIndex)
    }
}

func heapifyDown(_ arr: inout [Int], index: Int) {
    let leftChildIndex = index * 2 + 1
    let rightChildIndex = index * 2 + 2
    
    if leftChildIndex > arr.count - 1 {
        return
    }
    
    if rightChildIndex > arr.count - 1 {
        if arr[index] >= arr[leftChildIndex] {
            arr.swapAt(index, leftChildIndex)
        }
    } else {
        let minElementIndex = arr[leftChildIndex] <= arr[rightChildIndex] ? leftChildIndex : rightChildIndex
        if arr[index] >= arr[minElementIndex] {
            arr.swapAt(index, minElementIndex)
            heapifyDown(&arr, index: minElementIndex)
        }
    }
}

func extractMin(fromHeapedArray array: inout [Int]) {
    array.swapAt(0, array.count - 1)
    array.removeLast()
    heapifyDown(&array, index: 0)
}

func getTopOfHeap(_ heapedArray: [Int]) -> Int? {
    return heapedArray.first
}


kSmallestElement(5, arr: [7, 10, 4, 3, 20, 15] )
