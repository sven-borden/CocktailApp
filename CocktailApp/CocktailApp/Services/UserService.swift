//
//  UserService.swift
//  CocktailApp
//
//  Service for managing anonymous user accounts with Firebase
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class UserService: ObservableObject {
    static let shared = UserService()

    @Published var currentUser: User?
    @Published var isLoading = false

    private let db = Firestore.firestore()
    private let usersCollection = "users"
    private let userDefaultsKey = "current_user_id"

    private init() {
        loadCurrentUser()
    }

    // MARK: - User Management

    /// Loads the current user from local storage or creates a new one
    func loadCurrentUser() {
        isLoading = true

        // Check if user ID exists in UserDefaults
        if let userId = UserDefaults.standard.string(forKey: userDefaultsKey) {
            // Try to load user from Firebase
            fetchUser(withId: userId) { [weak self] user in
                if let user = user {
                    self?.currentUser = user
                    self?.updateLastActive()
                } else {
                    // User not found in Firebase, create new one
                    self?.createNewUser()
                }
                self?.isLoading = false
            }
        } else {
            // No existing user, create new one
            createNewUser()
            isLoading = false
        }
    }

    /// Creates a new anonymous user with a fun generated name
    private func createNewUser() {
        isLoading = true

        // First, fetch existing names to ensure uniqueness
        fetchExistingNames { [weak self] existingNames in
            guard let self = self else { return }

            // Generate unique name
            guard let userName = AnonymousNameGenerator.shared.generateUniqueName(
                avoiding: existingNames,
                maxAttempts: 10
            ) else {
                print("Failed to generate unique name, using fallback")
                let fallbackName = AnonymousNameGenerator.shared.generateName()
                self.finishCreatingUser(withName: fallbackName)
                return
            }

            self.finishCreatingUser(withName: userName)
        }
    }

    /// Completes user creation after name generation
    private func finishCreatingUser(withName name: String) {
        let newUser = User(displayName: name)
        self.currentUser = newUser

        // Save to UserDefaults
        UserDefaults.standard.set(newUser.id, forKey: userDefaultsKey)

        // Save to Firebase
        saveUserToFirebase(newUser)
        self.isLoading = false
    }

    // MARK: - Firebase Operations

    /// Saves user to Firebase
    private func saveUserToFirebase(_ user: User) {
        db.collection(usersCollection).document(user.id).setData(user.toDictionary()) { error in
            if let error = error {
                print("Error saving user to Firebase: \(error.localizedDescription)")
            } else {
                print("User successfully saved to Firebase: \(user.displayName)")
            }
        }
    }

    /// Fetches a user from Firebase by ID
    private func fetchUser(withId id: String, completion: @escaping (User?) -> Void) {
        db.collection(usersCollection).document(id).getDocument { snapshot, error in
            if let error = error {
                print("Error fetching user: \(error.localizedDescription)")
                completion(nil)
                return
            }

            guard let data = snapshot?.data(),
                  let user = User.fromDictionary(data) else {
                completion(nil)
                return
            }

            completion(user)
        }
    }

    /// Fetches all existing display names from Firebase
    private func fetchExistingNames(completion: @escaping (Set<String>) -> Void) {
        db.collection(usersCollection).getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching existing names: \(error.localizedDescription)")
                completion(Set())
                return
            }

            let names = snapshot?.documents.compactMap { doc -> String? in
                return doc.data()["display_name"] as? String
            } ?? []

            completion(Set(names))
        }
    }

    /// Updates the last active timestamp for the current user
    func updateLastActive() {
        guard var user = currentUser else { return }

        user.lastActiveAt = Date()
        self.currentUser = user

        db.collection(usersCollection).document(user.id).updateData([
            "last_active_at": user.lastActiveAt.timeIntervalSince1970
        ]) { error in
            if let error = error {
                print("Error updating last active: \(error.localizedDescription)")
            }
        }
    }

    /// Changes the user's display name
    func updateDisplayName(_ newName: String, completion: @escaping (Bool) -> Void) {
        guard var user = currentUser else {
            completion(false)
            return
        }

        user.displayName = newName
        self.currentUser = user

        db.collection(usersCollection).document(user.id).updateData([
            "display_name": newName
        ]) { error in
            if let error = error {
                print("Error updating display name: \(error.localizedDescription)")
                completion(false)
            } else {
                print("Display name updated successfully")
                completion(true)
            }
        }
    }

    /// Deletes the current user (for testing or user request)
    func deleteCurrentUser(completion: @escaping (Bool) -> Void) {
        guard let user = currentUser else {
            completion(false)
            return
        }

        db.collection(usersCollection).document(user.id).delete { error in
            if let error = error {
                print("Error deleting user: \(error.localizedDescription)")
                completion(false)
            } else {
                UserDefaults.standard.removeObject(forKey: self.userDefaultsKey)
                self.currentUser = nil
                print("User deleted successfully")
                completion(true)
            }
        }
    }
}
