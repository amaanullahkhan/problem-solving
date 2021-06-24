import UIKit

var str = "Hello, playground"

func reverseShuffleMerge(s: String) -> String {
    var chars: [String: Int] = [:]
    s.forEach { (char) in
        chars[String(char), default: 0] += 1
    }
    var charsSorted: [String] = []
    chars.keys.sorted().forEach { (char) in
        charsSorted.append(contentsOf: [String].init(repeating: char, count: chars[char, default: 0]/2 + chars[char, default: 0]%2))
    }
    
    return charsSorted.reduce("", +)
}

reverseShuffleMerge(s: "eggegg")
reverseShuffleMerge(s: "abcdefgabcdefg")
reverseShuffleMerge(s: "aeiouuoiea")
