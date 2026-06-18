//
//  Promo2KApp.swift
//  Promo2K
//
//  Created by Daisha McCutcheon on 5/28/26.
//

import SwiftUI
import SwiftData

@main
struct Promo2KApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: SavedCartItem.self)
    }
}

