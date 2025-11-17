//
//  AnonymousNameLists.swift
//  CocktailApp
//
//  Word lists for generating fun anonymous user names
//

import Foundation

struct AnonymousNameLists {
    // 120 fun adjectives
    static let adjectives = [
        // Positive & Energetic
        "speedy", "happy", "jolly", "bright", "cheerful", "lively", "bouncy", "zippy",
        "snappy", "peppy", "perky", "chipper", "bubbly", "fizzy", "sparkling", "gleaming",

        // Cool & Smooth
        "smooth", "cool", "chill", "mellow", "groovy", "funky", "jazzy", "slick",
        "sharp", "crisp", "neat", "dapper", "suave", "classy", "elegant", "refined",

        // Fun & Playful
        "silly", "goofy", "quirky", "witty", "clever", "crafty", "sneaky", "cheeky",
        "playful", "jolly", "merry", "festive", "jovial", "amusing", "hilarious", "comic",

        // Bold & Strong
        "bold", "brave", "mighty", "fierce", "strong", "powerful", "sturdy", "robust",
        "solid", "tough", "rugged", "hardy", "vigorous", "dynamic", "forceful", "intense",

        // Mysterious & Intriguing
        "mysterious", "cryptic", "enigmatic", "curious", "peculiar", "odd", "unusual", "strange",
        "mystic", "magical", "cosmic", "stellar", "lunar", "solar", "astral", "ethereal",

        // Nature-Inspired
        "wild", "free", "breezy", "sunny", "stormy", "frosty", "misty", "foggy",
        "cloudy", "windy", "leafy", "mossy", "rocky", "sandy", "dusty", "muddy",

        // Smart & Wise
        "wise", "smart", "brilliant", "genius", "savvy", "astute", "sharp", "quick",
        "keen", "bright", "lucid", "clear", "focused", "alert", "aware", "mindful",

        // Interesting & Unique
        "interesting", "fascinating", "intriguing", "captivating", "engaging", "charming", "delightful", "pleasant",
        "lovely", "wonderful", "marvelous", "splendid", "superb", "excellent", "premium", "prime"
    ]

    // 120 fun nouns (mix of animals, objects, and concepts)
    static let nouns = [
        // Animals
        "raccoon", "penguin", "dolphin", "panda", "koala", "otter", "fox", "wolf",
        "bear", "lion", "tiger", "leopard", "cheetah", "jaguar", "panther", "lynx",
        "owl", "eagle", "hawk", "falcon", "raven", "crow", "parrot", "toucan",
        "shark", "whale", "octopus", "squid", "jellyfish", "starfish", "seahorse", "turtle",

        // Cocktail-Related
        "shaker", "mixer", "stirrer", "glass", "goblet", "chalice", "tumbler", "coupe",
        "fizz", "splash", "swirl", "twist", "garnish", "olive", "cherry", "lime",
        "mint", "basil", "citrus", "berry", "mango", "pineapple", "coconut", "vanilla",

        // Objects & Things
        "rocket", "comet", "meteor", "asteroid", "planet", "galaxy", "nebula", "quasar",
        "crystal", "diamond", "ruby", "emerald", "sapphire", "pearl", "amber", "jade",
        "thunder", "lightning", "spark", "flame", "blaze", "ember", "glow", "shimmer",

        // Fun Concepts
        "ninja", "wizard", "knight", "viking", "pirate", "cowboy", "ranger", "scout",
        "pilot", "captain", "admiral", "commander", "chief", "leader", "hero", "champion",
        "legend", "master", "sage", "guru", "expert", "ace", "pro", "star",

        // Abstract Cool Words
        "vibe", "mood", "groove", "rhythm", "beat", "pulse", "wave", "echo",
        "dream", "vision", "spirit", "soul", "essence", "aura", "energy", "force",
        "bonus", "prize", "treasure", "fortune", "wealth", "gold", "silver", "bronze",

        // More Fun Words
        "robot", "cyborg", "android", "droid", "mech", "tech", "byte", "pixel"
    ]

    /// Calculates the total number of possible unique names
    /// With 120 adjectives, 120 nouns, and 1000 numbers (000-999)
    /// Total combinations: 120 × 120 × 1000 = 14,400,000
    static var totalPossibleCombinations: Int {
        return adjectives.count * nouns.count * 1000
    }
}
