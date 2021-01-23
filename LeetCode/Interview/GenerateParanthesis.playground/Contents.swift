import UIKit
 
/*
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

  

 Example 1:

 Input: n = 3
 Output: ["((()))","(()())","(())()","()(())","()()()"]
 Example 2:

 Input: n = 1
 Output: ["()"]
  

 Constraints:

 1 <= n <= 8
 */


class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var paranthesis: [String] = []
        genParanthesis(paranthesis: &paranthesis, openCountRemaining: n, closedCountRemaining: n, currentParenthesis: "")
        return paranthesis
    }
    
    private func genParanthesis(paranthesis: inout [String], openCountRemaining: Int, closedCountRemaining: Int, currentParenthesis: String) {
        if closedCountRemaining < openCountRemaining {
            return
        }
        
        if openCountRemaining == 0, closedCountRemaining == 0 {
            paranthesis.append(currentParenthesis)
            return
        }
        
        if openCountRemaining > 0 {
            genParanthesis(paranthesis: &paranthesis, openCountRemaining: openCountRemaining - 1, closedCountRemaining: closedCountRemaining, currentParenthesis: currentParenthesis + "(")
        }
        
        if closedCountRemaining > 0 {
            genParanthesis(paranthesis: &paranthesis, openCountRemaining: openCountRemaining, closedCountRemaining: closedCountRemaining - 1, currentParenthesis: currentParenthesis + ")")
        }
    }
}

let sol = Solution()
print(sol.generateParenthesis(1))
print("\n")
print(sol.generateParenthesis(2))
print("\n")
print(sol.generateParenthesis(3))
print("\n")
print(sol.generateParenthesis(4))
print("\n")
print(sol.generateParenthesis(5))
print("\n")
print(sol.generateParenthesis(6))
print("\n")
print(sol.generateParenthesis(7))
print("\n")
print(sol.generateParenthesis(8))

