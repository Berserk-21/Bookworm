//
//  Book.swift
//  Bookworm
//
//  Created by Berserk on 04/06/2024.
//

import Foundation
import SwiftData

// SwiftData models are classes and observable by nature, with @Model.
@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    var date: Date
    
    init(title: String, author: String, genre: String, review: String, rating: Int) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
        self.date = Date.now
    }
}
