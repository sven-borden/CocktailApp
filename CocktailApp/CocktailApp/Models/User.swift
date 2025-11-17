//
//  User.swift
//  CocktailApp
//
//  Model representing an anonymous user
//

import Foundation

struct User: Codable, Identifiable {
    let id: String
    var displayName: String
    let createdAt: Date
    var lastActiveAt: Date

    enum CodingKeys: String, CodingKey {
        case id
        case displayName = "display_name"
        case createdAt = "created_at"
        case lastActiveAt = "last_active_at"
    }

    init(id: String = UUID().uuidString, displayName: String) {
        self.id = id
        self.displayName = displayName
        let now = Date()
        self.createdAt = now
        self.lastActiveAt = now
    }

    /// Converts user data to a dictionary for Firebase storage
    func toDictionary() -> [String: Any] {
        return [
            "id": id,
            "display_name": displayName,
            "created_at": createdAt.timeIntervalSince1970,
            "last_active_at": lastActiveAt.timeIntervalSince1970
        ]
    }

    /// Creates a User from Firebase dictionary
    static func fromDictionary(_ dict: [String: Any]) -> User? {
        guard let id = dict["id"] as? String,
              let displayName = dict["display_name"] as? String,
              let createdAtTimestamp = dict["created_at"] as? TimeInterval,
              let lastActiveAtTimestamp = dict["last_active_at"] as? TimeInterval else {
            return nil
        }

        var user = User(id: id, displayName: displayName)
        user.createdAt = Date(timeIntervalSince1970: createdAtTimestamp)
        user.lastActiveAt = Date(timeIntervalSince1970: lastActiveAtTimestamp)
        return user
    }
}
