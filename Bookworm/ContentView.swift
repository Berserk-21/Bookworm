//
//  ContentView.swift
//  Bookworm
//
//  Created by Berserk on 04/06/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
//    @Query(sort: \Book.title) var books: [Book]
//    @Query(sort: \Book.rating, order: .reverse) var books: [Book]
    @Query(sort: [SortDescriptor(\Book.title), SortDescriptor(\Book.rating)]) var books: [Book]
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: Book.self, destination: { book in
                DetailView(book: book)
            })
            .navigationTitle("Bookwork")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Book", systemImage: "plus") {
                        showingAddScreen.toggle()
                    }
                }
            })
            .sheet(isPresented: $showingAddScreen, content: {
                AddBookView()
            })
        }
    }
}



#Preview {
    ContentView()
}
