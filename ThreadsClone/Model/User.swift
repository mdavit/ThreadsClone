//
//  User.swift
//  ThreadsClone
//
//  Created by Davit Margaryan on 09.11.23.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
