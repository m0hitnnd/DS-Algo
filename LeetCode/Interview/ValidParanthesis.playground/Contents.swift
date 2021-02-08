import UIKit

/*
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 
 An input string is valid if:
 
 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 
 
 Example 1:
 
 Input: s = "()"
 Output: true
 Example 2:
 
 Input: s = "()[]{}"
 Output: true
 Example 3:
 
 Input: s = "(]"
 Output: false
 Example 4:
 
 Input: s = "([)]"
 Output: false
 Example 5:
 
 Input: s = "{[]}"
 Output: true
 
 
 Constraints:
 
 1 <= s.length <= 104
 s consists of parentheses only '()[]{}'.
 */

struct Stack<T> {
    private var data: [T] = []
    
    mutating func push(_ val: T) {
        data.append(val)
    }
    
    mutating func pop() {
        if !data.isEmpty {
            data.removeLast()
        }
    }
    
    func peek() -> T? {
        return data.last
    }
    
    func isEmpty() -> Bool {
        return data.isEmpty
    }
}

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: Stack<Character> = Stack<Character>()
        for char in s {
            if char == "{" || char == "(" || char == "[" {
                stack.push(char)
            } else {
                guard let topElement = stack.peek() else { return false }
                if char == "}" && topElement == "{" || char == ")" && topElement == "(" || char == "]" && topElement == "[" {
                    stack.pop()
                } else {
                    return false
                }
            }
        }
        return stack.isEmpty()
    }
}

let sol = Solution()
sol.isValid("()")
sol.isValid("()[]{}")
sol.isValid("(]")
sol.isValid("([)]")
sol.isValid("{[]}")
sol.isValid("[")
sol.isValid("]")
