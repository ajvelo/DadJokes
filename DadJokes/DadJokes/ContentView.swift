//
//  ContentView.swift
//  DadJokes
//
//  Created by Andreas Velounias on 12/12/2019.
//  Copyright © 2019 Andreas Velounias. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Joke.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Joke.setup, ascending: true)
    ]) var jokes: FetchedResults<Joke>
    
    @State private var showingAddJoke = false
    
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
            .onDelete(perform: removeJokes(at:))
            }
            .navigationBarTitle("All Groan Up")
            .navigationBarItems(leading: EditButton(), trailing:
                Button("Add") {
                    self.showingAddJoke.toggle()
                }
            )
            .sheet(isPresented: $showingAddJoke) {
                AddView().environment(\.managedObjectContext, self.moc)
            }
        }
    }
    
    func removeJokes(at offsets: IndexSet) {
        for index in offsets {
            let joke = jokes[index]
            moc.delete(joke)
        }
        
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
