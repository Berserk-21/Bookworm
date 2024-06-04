//
//  ContentView.swift
//  Bookworm
//
//  Created by Berserk on 04/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isOn = false
    
    var body: some View {
        PushButton(title: isOn ? "Turn off" : "Turn on", isOn: $isOn)
        .padding()
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
