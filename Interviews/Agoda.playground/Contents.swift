import UIKit


//
protocol Food {}

protocol Animal {
    
    associatedtype T: Food
    
    func eat(food: T)
}

class Grass: Food {
    
}

class Cow: Animal {
    typealias T = Grass
    func eat(food: Grass) {
    }
}

class Cake : Food {}
let cake = Cake()
let grass = Grass()
let cow = Cow()
cow.eat(food: grass)



//
enum Foo: String {
    case one = "1"
    case two, three = "3"
//    case four(value: Int) = "4" // Enum with raw type cannot have cases with arguments
}
Foo.two.rawValue
Foo.three.rawValue


//
func getFirstTwoElementsWithoutPair(list: [Int]) -> [Int] {
    var withoutPairs: [Int] = []
    for i in 0..<list.count {
        var shouldAdd = true
        for j in (i+1)..<list.count {
            if list[i] == list[j] {
                shouldAdd = false
            }
        }
        if shouldAdd {
            withoutPairs.append(list[i])
            if withoutPairs.count == 2 {
                return withoutPairs
            }
        }
       
    }
    return withoutPairs
}

getFirstTwoElementsWithoutPair(list: [5,23,23,66,7,5,23,0])


// Reverse words in expression
func getReversedWords(string: String) -> String {
    let words = string.components(separatedBy: " ")
    var reversed = String()
    for i in 0..<words.count {
        reversed.append(words[words.count-1-i])
        reversed.append(" ")
    }
    return reversed
}
getReversedWords(string: "My name is amaan")


// Sort Dates
func sortDates(dates: [String]) -> [String] {
    
    let formatter = DateFormatter()
    formatter.dateFormat = "dd MMM yyyy"
    
    let actualDates = dates.map { (date) -> Date in
        return formatter.date(from: date)!
    }
    
    let sortedDates = actualDates.sorted()
    return sortedDates.map({ (date) -> String in
        return formatter.string(from: date)
    })
    
}

let dates = ["3 Mar 2017", "1 Feb 2017", "1 Jan 1997"]
let sortedDates = sortDates(dates: dates)


