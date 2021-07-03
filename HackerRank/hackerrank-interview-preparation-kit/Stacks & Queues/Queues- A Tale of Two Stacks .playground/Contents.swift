import UIKit

class Queue<Value> {
    
    private var steak1: [Value] = []
    
    private var steak2: [Value] = []
    
    func put(value: Value) {
        steak1.append(value)
    }
    
    func pop() -> Value? {
        moveValues()
        return steak2.popLast()
    }
    
    func peek() -> Value? {
        moveValues()
        return steak2.last
    }
    
    private func moveValues() {
        if steak2.isEmpty {
            while let value = steak1.popLast() {
                steak2.append(value)
            }
        }
    }
}

func processQueries(queries: [String]) {
    let queue = Queue<String>()
    for query in queries {
        switch query.prefix(1) {
        case "1":
            let value = query.components(separatedBy: " ").last!
            queue.put(value: value)
        case "2":
            _ = queue.pop()
        case "3":
            if let value = queue.peek() {
                print(value)
            }
        default:
            continue
        }
    }
}


let count = Int(readLine()!)!
let queries = (0..<count).map({ _ in readLine()! })
processQueries(queries: queries)
