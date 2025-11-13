//
//  StorageService.swift
//  CocktailApp
//

import Foundation

class StorageService {
    static let shared = StorageService()

    private init() {}

    // MARK: - Save Cocktails
    func saveCocktails(_ cocktails: [Cocktail]) {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(cocktails)

            if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = documentsDirectory.appendingPathComponent("cocktail.txt")
                try data.write(to: fileURL)
                print("✅ Saved \(cocktails.count) cocktails to storage")
            }
        } catch {
            print("❌ Error saving cocktails: \(error)")
        }
    }

    // MARK: - Load Cocktails
    func loadCocktails() -> [Cocktail]? {
        do {
            if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = documentsDirectory.appendingPathComponent("cocktail.txt")

                guard FileManager.default.fileExists(atPath: fileURL.path) else {
                    print("ℹ️ No local cocktail data found")
                    return nil
                }

                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                let cocktails = try decoder.decode([Cocktail].self, from: data)
                print("✅ Loaded \(cocktails.count) cocktails from storage")
                return cocktails
            }
        } catch {
            print("❌ Error loading cocktails: \(error)")
        }
        return nil
    }

    // MARK: - Merge Logic
    // Merges local and online cocktails with smart conflict resolution
    func mergeCocktails(local: [Cocktail], online: [Cocktail]) -> [Cocktail] {
        var merged: [Cocktail] = []
        let localDict = Dictionary(uniqueKeysWithValues: local.map { ($0.id, $0) })

        for var onlineCocktail in online {
            if let localCocktail = localDict[onlineCocktail.id] {
                // Cocktail exists in both local and online
                // Preserve user's favorite preference
                onlineCocktail.isFavourite = localCocktail.isFavourite

                // Use online data if version is newer
                if onlineCocktail.version > localCocktail.version {
                    merged.append(onlineCocktail)
                } else {
                    merged.append(localCocktail)
                }
            } else {
                // Cocktail exists only online - add it
                merged.append(onlineCocktail)
            }
        }

        print("✅ Merged cocktails: \(merged.count) total")
        return merged
    }
}
