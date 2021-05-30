import UIKit

func makeAnagram(a: String, b: String) -> Int {
    
    var aDict: [Character: Int] = [:]
    var bDict: [Character: Int] = [:]
    
    var charsToDelete = 0
    
    for char in a {
        aDict[char] = aDict[char, default: 0] + 1
    }
    
    for char in b {
        bDict[char] = bDict[char, default: 0] + 1
    }
    
    for (char, frequency) in aDict {
        if bDict[char] == nil {
            charsToDelete += frequency
        } else if let frequencyInB = bDict[char], frequency > frequencyInB {
            charsToDelete += frequency - frequencyInB
        }
    }
    
    for (char, frequency) in bDict {
               
        if aDict[char] == nil {
            charsToDelete += frequency
        } else if let frequencyInA = aDict[char], frequency > frequencyInA {
            charsToDelete += frequency - frequencyInA
        }
    }
    
    return charsToDelete
    
}

makeAnagram(a: "cde", b: "dcf")
makeAnagram(a: "cde", b: "abc")
