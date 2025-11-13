//
//  Cocktail.swift
//  CocktailApp
//
//  Created by Sven Borden on 13.11.2025.
//

import Foundation

struct Cocktail: Identifiable, Codable {
    let id: Int
    let imagePath: String
    let previewImages: [String]
    let name: String
    let description: String
    let overallRating: Double
    let totalReviews: String
    let alcohol: Double
    let tag: String
    let recipe: [Ingredient]
    let version: Double
    var isFavourite: Bool
    let dominantColor: String?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case imagePath = "ImagePath"
        case previewImages = "PreviewImages"
        case name = "Name"
        case description = "Description"
        case overallRating = "OverallRating"
        case totalReviews = "TotalReviews"
        case alcohol = "Alcohol"
        case tag = "Tag"
        case recipe = "Recipe"
        case version = "Version"
        case isFavourite = "IsFavourite"
        case dominantColor = "DominantColor"
    }
}
