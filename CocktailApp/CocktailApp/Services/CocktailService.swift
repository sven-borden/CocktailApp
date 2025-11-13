//
//  CocktailService.swift
//  CocktailApp
//
//  Created by Sven Borden on 13.11.2025.
//

import Foundation

class CocktailService {
    // Hardcoded dummy data with 2 cocktails for development
    // This will be replaced with real data later
    private let dummyJSONString = """
    [
      {
        "ID": 1,
        "ImagePath": "https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?w=400",
          "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400"
        ],
        "Name": "Mojito",
        "Description": "A refreshing Cuban cocktail made with white rum, sugar, lime juice, soda water, and mint. Perfect for summer evenings.",
        "OverallRating": 4.5,
        "TotalReviews": "128",
        "Alcohol": 0.15,
        "Tag": "Summer",
        "Recipe": [
          {
            "ID": 1,
            "Name": "White Rum",
            "Quantity": 50
          },
          {
            "ID": 2,
            "Name": "Lime Juice",
            "Quantity": 25
          },
          {
            "ID": 3,
            "Name": "Sugar",
            "Quantity": 10
          },
          {
            "ID": 4,
            "Name": "Soda Water",
            "Quantity": 100
          },
          {
            "ID": 5,
            "Name": "Fresh Mint",
            "Quantity": 5
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#c5e8d5"
      },
      {
        "ID": 2,
        "ImagePath": "https://images.unsplash.com/photo-1536935338788-846bb9981813?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1536935338788-846bb9981813?w=400",
          "https://images.unsplash.com/photo-1470337458703-46ad1756a187?w=400"
        ],
        "Name": "Margarita",
        "Description": "A classic Mexican cocktail with tequila, lime juice, and orange liqueur. Served with a salted rim for the perfect balance of sweet and sour.",
        "OverallRating": 4.8,
        "TotalReviews": "256",
        "Alcohol": 0.25,
        "Tag": "Classic",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Tequila",
            "Quantity": 50
          },
          {
            "ID": 2,
            "Name": "Lime Juice",
            "Quantity": 30
          },
          {
            "ID": 3,
            "Name": "Triple Sec",
            "Quantity": 20
          },
          {
            "ID": 4,
            "Name": "Salt",
            "Quantity": 2
          }
        ],
        "Version": 1.0,
        "IsFavourite": true,
        "DominantColor": "#f4e8c1"
      }
    ]
    """

    func fetchCocktails() async throws -> [Cocktail] {
        guard let jsonData = dummyJSONString.data(using: .utf8) else {
            throw CocktailServiceError.invalidData
        }

        let decoder = JSONDecoder()
        let cocktails = try decoder.decode([Cocktail].self, from: jsonData)
        return cocktails
    }
}

enum CocktailServiceError: Error {
    case invalidData
    case networkError
    case decodingError
}
