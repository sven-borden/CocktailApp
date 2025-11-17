//
//  CocktailAppApp.swift
//  CocktailApp
//
//  Created by Sven Borden on 13.11.2025.
//

import SwiftUI
import FirebaseCore

@main
struct CocktailAppApp: App {
    // Initialize Firebase on app launch
    init() {
        FirebaseApp.configure()

        // Initialize user service (loads or creates anonymous user)
        _ = UserService.shared
    }

    var body: some Scene {
        WindowGroup {
            CocktailListView()
                .environmentObject(UserService.shared)
        }
    }
}
