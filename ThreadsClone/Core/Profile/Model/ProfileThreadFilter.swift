//
//  ProfileThreadFilter.swift
//  ThreadsClone
//
//  Created by Davit Margaryan on 04.11.23.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads
    case replies
    
    var title: String {
        switch self {
        case .threads: return "Threads"
        case .replies: return "Replies"
            
        }
    }
    
    var id: Int { return self.rawValue}
}
