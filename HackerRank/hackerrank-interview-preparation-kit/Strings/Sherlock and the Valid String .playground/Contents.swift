import UIKit

func isValid(s: String) -> String {

    var freqs: [Character: Int] = [:]
    for char in s {
        freqs[char] = freqs[char, default: 0] + 1
    }

    print(freqs)
    var freqsOfFreqs: [Int: Int] = [:]
    var maxFreqFreq = 0
    var maxFreq = 0
    for (_, freq) in freqs {
        freqsOfFreqs[freq] = freqsOfFreqs[freq, default: 0] + 1
        maxFreqFreq = max(maxFreqFreq, freqsOfFreqs[freq]!)
        if maxFreqFreq == freqsOfFreqs[freq]! {
            maxFreq = freq
        }
    }
    print(freqsOfFreqs)
    print(maxFreq)

    let filteredFF = freqs.filter { (dict) -> Bool in
        return dict.value != maxFreq
    }

    if filteredFF.isEmpty {
      return "YES"
    } else if filteredFF.count > 1 {
        return "NO"
    } else {
        let freq = filteredFF.values.first! - 1
        return freq == maxFreq || freq == 0 ? "YES" : "NO"
    }

}

isValid(s: "abc")
isValid(s: "abcc")
isValid(s: "abccc")
isValid(s: "aaaaabc")
isValid(s: "aabbcd")
isValid(s: "aabbccddeefghi")
isValid(s: "abcdefghhgfedecba")






