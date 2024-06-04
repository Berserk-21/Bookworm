//
//  ContentView.swift
//  Bookworm
//
//  Created by Berserk on 04/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationStack {
            TextField("Enter your text", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .navigationTitle("Notes")
                .padding()
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

struct PushButton: View {
    
    let title: String
    // Use Binding to binds this property to the one from the contentView. They now share the same state.
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
    }
}

#Preview {
    ContentView()
}
