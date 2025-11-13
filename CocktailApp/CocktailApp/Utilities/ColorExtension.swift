//
//  ColorExtension.swift
//  CocktailApp
//
//  Created by Sven Borden on 13.11.2025.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - App Color Palette
extension Color {
    // Primary Colors
    static let primaryColor = Color(hex: "#AD103A")
    static let primaryDark = Color(hex: "#d0424f")
    static let primaryDarken = Color(hex: "#ab3641")
    static let primaryLighter = Color(hex: "#edcacd")
    static let primaryLight = Color(hex: "#ffe8f4")

    // Secondary Colors
    static let secondary = Color(hex: "#d54381")

    // Accent Colors
    static let green = Color(hex: "#7ed321")
    static let red = Color(hex: "#ff4a4a")
    static let orange = Color(hex: "#ff844a")
    static let blue = Color(hex: "#4acaff")
    static let hyperlink = Color(hex: "#567cd7")

    // Grayscale
    static let gray100 = Color(hex: "#f6f7f8")
    static let gray200 = Color(hex: "#ebecef")
    static let gray300 = Color(hex: "#ced2d9")
    static let gray400 = Color(hex: "#b2b8c2")
    static let gray500 = Color(hex: "#959eac")
    static let gray600 = Color(hex: "#788396")
    static let gray700 = Color(hex: "#606a7b")
    static let gray800 = Color(hex: "#4a515e")
    static let gray900 = Color(hex: "#333942")
}
