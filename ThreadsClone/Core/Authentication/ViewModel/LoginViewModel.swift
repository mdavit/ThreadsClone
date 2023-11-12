//
//  LoginViewModel.swift
//  ThreadsClone
//
//  Created by Davit Margaryan on 06.11.23.
//

import Foundation

class LoginViewModel: ObservableObject  {
    @Published var email = ""
    @Published var password = ""
   
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
