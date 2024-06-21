//
//  AddBookView.swift
//  Bookworm
//
//  Created by Berserk on 04/06/2024.
//

import SwiftUI

struct AddBookView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var rating = 3
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    // Providing an axis allows the TextField size to grow as the user types.
                    TextField("Name of the book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        // Insert the model to the context to allow saving, deleting and more.
                        modelContext.insert(newBook)
                        dismiss()
                    }
                    .disabled(disableSaveButton())
                }
            }
            .navigationTitle("Add Book")
        }
    }
    
    func disableSaveButton() -> Bool {
        
        return title.isEmpty || author.isEmpty || genre.isEmpty || review.isEmpty
    }
}

#Preview {
    AddBookView()
}
