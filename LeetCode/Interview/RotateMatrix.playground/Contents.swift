import UIKit

/*
 You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).

 You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.

 Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
 Output: [[7,4,1],[8,5,2],[9,6,3]]
 
 Input: matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
 Output: [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]
 
 Input: matrix = [[1]]
 Output: [[1]]
 
 Input: matrix = [[1,2],[3,4]]
 Output: [[3,1],[4,2]]
 
 Constraints:

 matrix.length == n
 matrix[i].length == n
 1 <= n <= 20
 -1000 <= matrix[i][j] <= 1000
 */

class Solution {
    
    typealias TDIndex = (x: Int, y: Int)
    
    func rotate(_ matrix: inout [[Int]]) {
        let length = matrix.count
        
        for squareIndex in 0..<length/2 {
            var top: TDIndex = (squareIndex, squareIndex)
            var right: TDIndex = (squareIndex, length - squareIndex - 1)
            var left: TDIndex = (length - squareIndex - 1, squareIndex)
            var bottom: TDIndex = (length - squareIndex - 1, length - squareIndex - 1)
            
            
            while top.y < length - squareIndex - 1 {
                let temp = matrix[top.x][top.y]
                matrix[top.x][top.y] = matrix[left.x][left.y] // left to top
                matrix[left.x][left.y] = matrix[bottom.x][bottom.y] //bottom to left
                matrix[bottom.x][bottom.y]  = matrix[right.x][right.y]// right to bottom
                matrix[right.x][right.y] = temp//top to right
                top.y += 1
                right.x += 1
                bottom.y -= 1
                left.x -= 1
            }
        }
    }
}

let sol = Solution()
var arr = [[1,2,3],[4,5,6],[7,8,9]]
sol.rotate(&arr)
print(arr)

var arr2 = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
sol.rotate(&arr2)
print(arr2)


