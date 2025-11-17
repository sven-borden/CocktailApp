//
//  AnonymousNameGeneratorTests.swift
//  CocktailAppTests
//
//  Tests for anonymous name generation
//

import XCTest
@testable import CocktailApp

final class AnonymousNameGeneratorTests: XCTestCase {
    var generator: AnonymousNameGenerator!

    override func setUp() {
        super.setUp()
        generator = AnonymousNameGenerator.shared
    }

    func testGenerateNameFormat() {
        // Generate a name and verify format
        let name = generator.generateName()

        // Should have format: word_word_###
        let components = name.split(separator: "_")
        XCTAssertEqual(components.count, 3, "Name should have 3 components separated by underscores")

        // Last component should be a 3-digit number
        let numberString = String(components[2])
        XCTAssertEqual(numberString.count, 3, "Number should be 3 digits")
        XCTAssertNotNil(Int(numberString), "Last component should be a valid number")

        if let number = Int(numberString) {
            XCTAssertGreaterThanOrEqual(number, 0, "Number should be >= 0")
            XCTAssertLessThanOrEqual(number, 999, "Number should be <= 999")
        }
    }

    func testGenerateNameContainsValidWords() {
        // Generate multiple names and verify they use words from our lists
        for _ in 0..<10 {
            let name = generator.generateName()
            XCTAssertTrue(generator.isValidNameFormat(name), "Generated name should be valid: \(name)")
        }
    }

    func testGenerateUniqueNames() {
        // Generate multiple names to test randomness
        var names = Set<String>()
        for _ in 0..<100 {
            let name = generator.generateName()
            names.insert(name)
        }

        // With 14.4M combinations, 100 generations should be mostly unique
        // Allow some duplicates due to randomness, but expect at least 90% unique
        XCTAssertGreaterThan(names.count, 90, "Should generate mostly unique names")
    }

    func testGenerateUniqueNameWithExistingSet() {
        // Create a set of existing names
        let existingNames: Set<String> = ["speedy_raccoon_123", "jolly_penguin_456"]

        // Generate a unique name
        let uniqueName = generator.generateUniqueName(avoiding: existingNames, maxAttempts: 10)

        XCTAssertNotNil(uniqueName, "Should generate a unique name")
        if let name = uniqueName {
            XCTAssertFalse(existingNames.contains(name), "Generated name should not be in existing set")
            XCTAssertTrue(generator.isValidNameFormat(name), "Generated name should be valid")
        }
    }

    func testIsValidNameFormat() {
        // Test valid names
        XCTAssertTrue(generator.isValidNameFormat("speedy_raccoon_123"))
        XCTAssertTrue(generator.isValidNameFormat("happy_penguin_000"))
        XCTAssertTrue(generator.isValidNameFormat("smooth_shaker_999"))

        // Test invalid names
        XCTAssertFalse(generator.isValidNameFormat("invalid"), "Should reject name without underscores")
        XCTAssertFalse(generator.isValidNameFormat("invalid_name"), "Should reject name without number")
        XCTAssertFalse(generator.isValidNameFormat("invalid_name_12"), "Should reject 2-digit number")
        XCTAssertFalse(generator.isValidNameFormat("invalid_name_1234"), "Should reject 4-digit number")
        XCTAssertFalse(generator.isValidNameFormat("notaword_raccoon_123"), "Should reject invalid adjective")
        XCTAssertFalse(generator.isValidNameFormat("speedy_notaword_123"), "Should reject invalid noun")
    }

    func testWordListsAreNotEmpty() {
        XCTAssertFalse(AnonymousNameLists.adjectives.isEmpty, "Adjectives list should not be empty")
        XCTAssertFalse(AnonymousNameLists.nouns.isEmpty, "Nouns list should not be empty")
        XCTAssertGreaterThanOrEqual(AnonymousNameLists.adjectives.count, 100, "Should have at least 100 adjectives")
        XCTAssertGreaterThanOrEqual(AnonymousNameLists.nouns.count, 100, "Should have at least 100 nouns")
    }

    func testTotalCombinations() {
        let expectedCombinations = AnonymousNameLists.adjectives.count * AnonymousNameLists.nouns.count * 1000
        XCTAssertEqual(AnonymousNameLists.totalPossibleCombinations, expectedCombinations)
        XCTAssertGreaterThan(AnonymousNameLists.totalPossibleCombinations, 10_000_000, "Should have over 10M combinations")
    }

    func testAllAdjectivesAreLowercase() {
        for adjective in AnonymousNameLists.adjectives {
            XCTAssertEqual(adjective, adjective.lowercased(), "Adjective '\(adjective)' should be lowercase")
            XCTAssertFalse(adjective.contains(" "), "Adjective '\(adjective)' should not contain spaces")
        }
    }

    func testAllNounsAreLowercase() {
        for noun in AnonymousNameLists.nouns {
            XCTAssertEqual(noun, noun.lowercased(), "Noun '\(noun)' should be lowercase")
            XCTAssertFalse(noun.contains(" "), "Noun '\(noun)' should not contain spaces")
        }
    }
}
