//
//  JokeCard.swift
//  DadJokes
//
//  Created by Andreas Velounias on 12/12/2019.
//  Copyright © 2019 Andreas Velounias. All rights reserved.
//

import SwiftUI
import CoreData

struct JokeCard: View {
    var joke: Joke
    
    var body: some View {
        VStack {
            VStack {
                Text(self.joke.setup)
                    .font(.largeTitle)
                    .lineLimit(10)
                    .padding([.horizontal])
                
                Text(self.joke.punchline)
                    .font(.title)
                    .lineLimit(10)
                    .padding([.horizontal, .bottom])
            }
            .multilineTextAlignment(.center)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .background(RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .shadow(color: .black, radius: 5, x: 0, y: 0)
            )
            
            EmojiView(for: joke.rating)
                .font(.system(size: 72))
        }
        .frame(minHeight: 0, maxHeight:  .infinity)
        .frame(width: 300)
    }
}

struct JokeCard_Previews: PreviewProvider {
    static var previews: some View {
        let joke = Joke(context: NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType))
        joke.setup = "What do you call a hen who counts her eggs?"
        joke.punchline = "A mathemachicken"
        joke.rating = "Sigh"
        return JokeCard(joke: joke)
    }
}
