//
//  Constants.swift
//  CocktailApp
//

import Foundation

enum Constants {
    // Storage
    static let cocktailsStorageKey = "cocktails_data"

    // UI
    static let carouselAutoPlayDelay: TimeInterval = 10.0
    static let imageCacheValidity: TimeInterval = 60 * 60 * 24 * 50 // 50 days

    // Layout
    static let gridSpacing: CGFloat = 12
    static let cardCornerRadius: CGFloat = 12
    static let imageCornerRadius: CGFloat = 4
    static let buttonCornerRadius: CGFloat = 24

    // Heights
    static let carouselHeightPhone: CGFloat = 210
    static let carouselHeightTablet: CGFloat = 450
    static let imageHeight: CGFloat = 350
    static let cocktailTileImageHeight: CGFloat = 120
}
