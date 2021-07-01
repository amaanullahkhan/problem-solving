import UIKit

func isBalanced(s: String) -> String {
    let brackets = ["[":"]", "{":"}", "(":")"]
    var stack: [String] = []
    for char in s {
        let charS = String(char)
        if let closing = brackets[charS] {
            stack.append(closing)
        } else {
            guard let popped = stack.popLast(),
                  popped == charS else {
                return "NO"
            }
        }
    }
    return stack.isEmpty ? "YES" : "NO"
}

isBalanced(s: "{{}(")
isBalanced(s: "{[(])}")
isBalanced(s: "{{[[(())]]}}")
