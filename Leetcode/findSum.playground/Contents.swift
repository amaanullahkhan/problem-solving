import UIKit


func mostActive(customers: [String]) -> [String] {
    
    let totalTrades: Int = customers.count
    
    var distinceCustomersAndOrders: [String: Int] = [:]
    for customer in customers {
        distinceCustomersAndOrders[customer] = (distinceCustomersAndOrders[customer] ?? 0) + 1
    }
    
    let activeCustomers = distinceCustomersAndOrders.filter { (custAndOrder) -> Bool in
        return (Double(custAndOrder.value) / Double(totalTrades)) >= 0.05
    }
    .map({ $0.key })
    .sorted()
    
    return activeCustomers
}



func findSum(numbers: [Int], queries: [[Int]]) -> [Int] {
    let sums: [Int] = queries.map { (query) -> Int in
        var sum: Int = 0
        let _numbers = numbers[query[0]...query[1]]
        for num in _numbers {
            if num == 0 {
                sum += query[2]
            } else {
                sum += num
            }
        }
        return sum
    }
    return sums
}
