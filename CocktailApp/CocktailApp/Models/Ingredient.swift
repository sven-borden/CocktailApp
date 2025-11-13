//
//  Ingredient.swift
//  CocktailApp
//
//  Created by Sven Borden on 13.11.2025.
//

import Foundation

struct Ingredient: Identifiable, Codable {
    let id: Int
    let name: String
    let quantity: Double

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
        case quantity = "Quantity"
    }
}
