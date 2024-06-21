//
//  ContentView.swift
//  Bookworm
//
//  Created by Berserk on 04/06/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    // Creating a modelContext automatically creates a container for this context.
    @Environment(\.modelContext) var modelContext
    
    // Sort descriptors are recommanded for Query. (Better performance).
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
                                    .foregroundStyle(book.rating > 1 ? .black : .red)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                // We can perform code for different actions on ForEach views.
                .onDelete(perform: { indexSet in
                    deleteBooks(at: indexSet)
                })
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
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            })
            .sheet(isPresented: $showingAddScreen, content: {
                AddBookView()
            })
        }
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            modelContext.delete(book)
        }
    }
}



#Preview {
    ContentView()
}
