import UIKit

func alternatingCharacters(s: String) -> Int {
    var previousCharacter: Character?
    var count = 0
    s.forEach { (char) in
        if char == previousCharacter {
            count += 1
        }
        else {
            previousCharacter = char
        }
    }
    return count
}

alternatingCharacters(s: "AAAA")
alternatingCharacters(s: "BBBBB")
alternatingCharacters(s: "ABABABAB")
alternatingCharacters(s: "BABABA")
