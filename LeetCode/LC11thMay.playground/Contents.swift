import UIKit

/*
 An image is represented by a 2-D array of integers, each integer representing the pixel value of the image (from 0 to 65535).
 
 Given a coordinate (sr, sc) representing the starting pixel (row and column) of the flood fill, and a pixel value newColor, "flood fill" the image.
 
 To perform a "flood fill", consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color as the starting pixel), and so on. Replace the color of all of the aforementioned pixels with the newColor.
 
 At the end, return the modified image.
 
 Example 1:
 
 Input:
 image = [[1,1,1],[1,1,0],[1,0,1]]
 sr = 1, sc = 1, newColor = 2
 Output: [[2,2,2],[2,2,0],[2,0,1]]
 Explanation:
 From the center of the image (with position (sr, sc) = (1, 1)), all pixels connected
 by a path of the same color as the starting pixel are colored with the new color.
 Note the bottom corner is not colored 2, because it is not 4-directionally connected
 to the starting pixel.
 Note:
 
 The length of image and image[0] will be in the range [1, 50].
 The given starting pixel will satisfy 0 <= sr < image.length and 0 <= sc < image[0].length.
 The value of each color in image[i][j] and newColor will be an integer in [0, 65535].
 */

class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        let orColor = image[sr][sc]
        guard orColor != newColor else { return image }
        return floodFill(image, sr, sc, orColor, newColor)
    }
    
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ orColor: Int, _ newColor: Int) -> [[Int]] {
        var modifiedImg = image
        modifiedImg[sr][sc] = newColor
        
        if (0...(modifiedImg[0].count - 1)).contains(sc - 1), modifiedImg[sr][sc - 1] == orColor {
            modifiedImg = floodFill(modifiedImg, sr, sc - 1, newColor)
        }
        
        if (0...(modifiedImg.count - 1)).contains(sr - 1), modifiedImg[sr - 1][sc] == orColor {
            modifiedImg = floodFill(modifiedImg, sr - 1, sc, newColor)
        }
        
        if (0...(modifiedImg[0].count - 1)).contains(sc + 1), modifiedImg[sr][sc + 1] == orColor {
            modifiedImg = floodFill(modifiedImg, sr, sc + 1, newColor)
        }
        
        if (0...(modifiedImg.count - 1)).contains(sr + 1), modifiedImg[sr + 1][sc] == orColor {
            modifiedImg = floodFill(modifiedImg, sr + 1, sc, newColor)
        }
        return modifiedImg
    }
    
}


let sol = Solution()
sol.floodFill([[1,1,1],[1,1,0],[1,0,1]], 1, 1, 2)
sol.floodFill([[0,0,0],[0,1,1]], 1, 1, 1)
