//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Davit Margaryan on 05.11.23.
//

import Firebase
import FirebaseFirestoreSwift

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentuser()
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(withEmail: email, fullname: fullname, username: username, id: result.user.uid)
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut() //signs out on backend
        self.userSession = nil //this removes  session locally an updates routing
        UserService.shared.reset() // sets current user object to nil
    }
    
    @MainActor
    /// This function upload User Data to Firestore Dtabase
    /// - Parameters:
    ///   - email: User's Email
    ///   - fullname: User's fullname
    ///   - username: Username
    ///   - id: User's identification information(UID)
    private func uploadUserData(
        withEmail email: String,
        fullname: String,
        username: String,
        id: String
    ) async throws {
        let user = User(id: id, fullname: fullname, email: email, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
}
