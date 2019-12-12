//
//  Joke+CoreDataProperties.swift
//  DadJokesRealsies
//
//  Created by Andreas Velounias on 12/12/2019.
//  Copyright © 2019 Andreas Velounias. All rights reserved.
//
//

import Foundation
import CoreData


extension Joke {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Joke> {
        return NSFetchRequest<Joke>(entityName: "Joke")
    }

    @NSManaged public var punchline: String
    @NSManaged public var rating: String
    @NSManaged public var setup: String

}
