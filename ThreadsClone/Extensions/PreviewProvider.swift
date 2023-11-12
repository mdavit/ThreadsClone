//
//  PreviewProvider.swift
//  ThreadsClone
//
//  Created by Davit Margaryan on 09.11.23.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Հեռուստատեսության և ռադիոյի հանձնաժողով", email: "ctr@tvradio.am", username: "CTR")
    let thread = Thread(ownerUid: "123", caption: "This is a test thread", timestamp: Timestamp(), likes: 0)
    
    
}
