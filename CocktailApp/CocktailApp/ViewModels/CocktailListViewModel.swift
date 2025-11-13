//
//  CocktailListViewModel.swift
//  CocktailApp
//

import Foundation
import Combine

@MainActor
class CocktailListViewModel: ObservableObject {
    @Published var cocktails: [Cocktail] = []
    @Published var featuredCocktails: [Cocktail] = []
    @Published var isLoading = false

    private let cocktailService = CocktailService()
    private let storageService = StorageService.shared

    // MARK: - Load Cocktails
    func loadCocktails() async {
        isLoading = true

        // 1. Load local data first (for instant display)
        if let localCocktails = storageService.loadCocktails() {
            cocktails = localCocktails
            updateFeatured()
        }

        // 2. Fetch online data
        do {
            let onlineCocktails = try await cocktailService.fetchCocktails()

            // 3. Merge local and online data
            if cocktails.isEmpty {
                cocktails = onlineCocktails
            } else {
                cocktails = storageService.mergeCocktails(local: cocktails, online: onlineCocktails)
            }

            updateFeatured()

            // 4. Save merged data
            storageService.saveCocktails(cocktails)
        } catch {
            print("❌ Error fetching cocktails: \(error)")
            // If fetch fails and we have no local data, show error
            if cocktails.isEmpty {
                // Could show an error state here
            }
        }

        isLoading = false
    }

    // MARK: - Toggle Favorite
    func toggleFavorite(_ cocktail: Cocktail) {
        if let index = cocktails.firstIndex(where: { $0.id == cocktail.id }) {
            cocktails[index].isFavourite.toggle()
            updateFeatured()
            storageService.saveCocktails(cocktails)
        }
    }

    // MARK: - Update Featured List
    private func updateFeatured() {
        featuredCocktails = cocktails.filter { $0.isFavourite }
    }
}
