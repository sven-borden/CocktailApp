//
//  AnonymousNameGenerator.swift
//  CocktailApp
//
//  Service for generating unique anonymous user names
//

import Foundation

class AnonymousNameGenerator {
    static let shared = AnonymousNameGenerator()

    private init() {}

    /// Generates a random anonymous name in format: adjective_noun_###
    /// Example: speedy_raccoon_123
    func generateName() -> String {
        let adjective = AnonymousNameLists.adjectives.randomElement() ?? "happy"
        let noun = AnonymousNameLists.nouns.randomElement() ?? "user"
        let number = Int.random(in: 0...999)

        return String(format: "%@_%@_%03d", adjective, noun, number)
    }

    /// Generates a unique name that doesn't exist in the provided set of existing names
    /// - Parameter existingNames: Set of names to check against
    /// - Parameter maxAttempts: Maximum number of attempts before giving up (default: 10)
    /// - Returns: A unique name, or nil if max attempts reached
    func generateUniqueName(avoiding existingNames: Set<String>, maxAttempts: Int = 10) -> String? {
        for _ in 0..<maxAttempts {
            let name = generateName()
            if !existingNames.contains(name) {
                return name
            }
        }
        return nil
    }

    /// Validates if a name follows the correct format
    /// - Parameter name: The name to validate
    /// - Returns: True if the name is valid
    func isValidNameFormat(_ name: String) -> Bool {
        let components = name.split(separator: "_")
        guard components.count == 3 else { return false }

        let adjective = String(components[0])
        let noun = String(components[1])
        let numberString = String(components[2])

        // Check if adjective and noun are in our lists
        guard AnonymousNameLists.adjectives.contains(adjective),
              AnonymousNameLists.nouns.contains(noun) else {
            return false
        }

        // Check if number is valid (3 digits)
        guard let number = Int(numberString),
              number >= 0 && number <= 999,
              numberString.count == 3 else {
            return false
        }

        return true
    }
}
