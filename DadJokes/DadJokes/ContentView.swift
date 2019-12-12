//
//  ContentView.swift
//  DadJokes
//
//  Created by Andreas Velounias on 12/12/2019.
//  Copyright © 2019 Andreas Velounias. All rights reserved.
//

import SwiftUI

struct Joke {
    var setup: String
    var punchline: String
    var rating: String
}

struct ContentView: View {
    let jokes = [
        Joke(setup: "What's a cow's favorite place?", punchline: "A mooseum", rating: "Silence"),
        Joke(setup: "What's brown and sticky?", punchline: "A stick", rating: "Sigh"),
        Joke(setup: "What's orange and sounds like a carrot?", punchline: "A carrot", rating: "Smirk")
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(jokes, id: \.setup) { joke in
                    NavigationLink(destination:
                    Text(joke.punchline)) {
                        EmojiView(for: joke.rating)
                        Text(joke.setup)
                    }
                }
            }.navigationBarTitle("All Groan Up")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
