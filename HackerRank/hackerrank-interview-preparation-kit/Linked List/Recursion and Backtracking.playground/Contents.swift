import UIKit


func superDigit(n: Int64) -> Int64 {
    let digitSum = n.digitsSum
    if digitSum < 10 {
        return digitSum
    }
    return superDigit(n: digitSum)
}

func superDigit(n: String, k: Int) -> Int64 {
    let sum: Int64 = n.reduce(0) { (result, char) -> Int64 in
        return result + Int64((String(char) as NSString).intValue)
    }
    return superDigit(n: sum * Int64(k))
}

extension Int64 {
    var digitsSum: Int64 {
        var value = self
        var sum: Int64 = 0
        while value > 0 {
            sum += value % 10
            value = value / 10
        }
        return sum
    }
}

superDigit(n: "123", k: 3)
superDigit(n: "148", k: 3)

