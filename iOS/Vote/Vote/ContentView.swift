//
//  ContentView.swift
//  Vote
//
//  Created by Amaan on 15/11/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var poll: Poll = Poll()
    
    var body: some View {
        VStack {
            Text(poll.question)
            Voting(poll: $poll)
            Result(poll: $poll)
        }
        .padding()
    }
}

struct Voting: View {
    
    @Binding var poll: Poll
    
    var body: some View {
        HStack(content: {
            ForEach($poll.options, id: \.id) { option in
                Vote(option: option)
                    .disabled(poll.isAnnounced)
            }
        })
    }
}

struct Vote: View {
    
    @Binding var option: PollOption
    
    var body: some View {
        Button(action: {
            option.votes += 1
        }, label: {
            Text(option.text)
        })
    }
}

struct Result: View {
    
    @Binding var poll: Poll
    
    var body: some View {
        
        let (superman, batman) = (poll.options[0], poll.options[1])
        let (leading, other) = superman.votes > batman.votes ? (superman, batman) : (batman, superman)
        let voteDifference = leading.votes - other.votes
        let isTie = superman.votes == batman.votes
        
        let displayText = isTie ? "It's a tie" : poll.isAnnounced ? "\(leading.text) won by \(leading.votes) total votes" : "\(leading.text) is leading by \(voteDifference) votes"
        
        VStack(content: {
            Text(displayText)
            Button(action: {
                poll.isAnnounced = true
            }, label: {
                Text("View winner")
            })
            .disabled(poll.isAnnounced)
        })
    }
}

#Preview {
    ContentView()
}


struct PollOption {
    let id: Int
    let text: String
    var votes: Int
    init(id: Int, text: String, votes: Int) {
        self.id = id
        self.text = text
        self.votes = votes
    }
}

struct Poll {
    var isAnnounced: Bool = false
    let question: String = "Who's your favorite character?"
    var options: [PollOption] = [.init(id: 1, text: "Superman", votes: 0),
                                 .init(id: 2, text: "Batman", votes: 0)]
}
