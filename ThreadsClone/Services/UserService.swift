//
//  UserService.swift
//  ThreadsClone
//
//  Created by Davit Margaryan on 09.11.23.
//

import Firebase

class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    init() {
        Task { try await fetchCurrentuser() }
    }
    
    @MainActor
    /// This function is fetching current user information.
    func fetchCurrentuser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
    }
    
    static func fetchUsers() async throws -> [User] {
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap({ try? $0.data(as: User.self) })
        return users.filter({ $0.id != currentUid })
    }
    
    static func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    /// This function reset loged in user for other user can log in.
    func reset() {
        self.currentUser = nil
    }
    
    @MainActor
    func updateUserProfileImage(withImageUrl imageUrl: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        try await Firestore.firestore().collection("users").document(currentUid).updateData([
            "profileImageUrl": imageUrl
    ])
        self.currentUser?.profileImageUrl = imageUrl
    }
}
