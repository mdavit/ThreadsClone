//
//  ProfileViewModel.swift
//  ThreadsClone
//
//  Created by Davit Margaryan on 09.11.23.
//

import Foundation
import Combine

class CurrentProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancelables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            print("DEBUG: User in view model from combine \(user)")
        }.store(in: &cancelables)
    }
}
