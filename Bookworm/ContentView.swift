//
//  ContentView.swift
//  Bookworm
//
//  Created by Berserk on 04/06/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query var books: [Book]
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack {
            Text("Count: \(books.count) books")
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
