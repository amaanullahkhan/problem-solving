import UIKit

//func longestPalindrome(_ s: String) -> String {
//
//    guard s.count > 1 else  { return s }
//
//    let characters = Array(s)
//
//    var isPalindrome = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
//
//    var left = 0
//    var right = 0
//    
//    for tempRight in 1..<characters.count {
//        for tempLeft in 0..<tempRight {
//            if characters[tempLeft] == characters[tempRight] && (isPalindrome[tempLeft+1][tempRight-1] || tempRight - tempLeft <= 2) {
//                isPalindrome[tempLeft][tempRight] = true
//                if tempRight-tempLeft > right-left {
//                    right = tempRight
//                    left = tempLeft
//                }
//            }
//        }
//    }
//
//    return String(characters[left...right])
//}

func longestPalindrome(_ s: String) -> String {
        if s.count < 2 {
            return s
        }
        
        var low = 0
        var maxL = 0
        var count = 1
        let word = Array(s)
        for i in 0..<word.count - 1 {
            checkSubString(i,i,word,&low,&maxL)
            checkSubString(i,i+1,word, &low, &maxL)
        }
        return String(word[low..<low + maxL])
    }
    
    func checkSubString(_ i:Int, _ j:Int, _ s:[Character],_ low:inout Int, _ maxL:inout Int) {
        var x = i
        var y = j
        while (x >= 0 && y < s.count && s[x] == s[y] ) {
            x -= 1
            y += 1
        }
        
        if (maxL < y - x - 1) {
            low = x + 1
            maxL = y - x - 1
        }
    }

longestPalindrome("civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth")


