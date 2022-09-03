import UIKit



//When you open the dialer of your phone and start typing a number, you will probably get search results from the save contacts for the number you entered. Your task is to implement a similar feature.
//Saved contacts are numbered from 0 to N-1. They are represented by two arrays A,B of N strings each. Name of K-th contact is A[K] and phone number is B[K].
//Write a function
//class Solution { public String solution(String[] A, String[] B, String P); }
//which, given two arrays A and B and a string P of length M representing a partial phone number, returns the contact name whose phone number contains P as a substring, that is a contiguous segment (for example, "436800143" contains as a substring "6800", but not "3614").
//If there is more than one contact matching the search criteria, your function should return the alphabetically smallest contact name.
//If no match is found, your function should return "NO CONTACT".
//Examples:
//Given A = ["pim", "pom"], B = ["999999999", "777888999"] and P = "88999", your function should return "pom", because only pom’s phone number contains "88999".
//Given A = ["sander", "amy", "ann", "michael"], B = ["123456789", "234567890", "789123456", ‘"123123123"’] and P = "1", your function should return "ann". Note that sander, ann and michael’s phone number contain "1" but "ann" is alphabetically smaller.

public func solution(a: [String], b: [String], p: String) -> String {

    var filteredNames: [String] = []
    
    for i in 0..<b.count {
        if b[i].contains(p) {
            filteredNames.append(a[i])
        }
    }
    
    guard !filteredNames.isEmpty else {return "NO CONTACT"}
    
    var smallerName = filteredNames.first!
    
    for name in filteredNames {
        if name < smallerName {
            smallerName = name
        }
    }
    
    return smallerName
}

solution(a: ["pim", "pom"], b: ["999999999", "777888999"], p: "88999")
solution(a: ["sander", "amy", "ann", "michael"], b: ["123456789", "234567890", "789123456", "123123123"], p: "1")





class Solution {
    func reformatNumber(_ number: String) -> String {
        
        var digits = number.filter({ $0 != " " && $0 != "-" })
        var dashedDigits = String()
        
        for i in 0..<digits.count {
            if i % 3 == 0 {
        
            }
        }
    }
}
