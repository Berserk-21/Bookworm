//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Berserk on 04/06/2024.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
