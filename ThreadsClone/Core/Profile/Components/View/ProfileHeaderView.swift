//
//  ProfileHeaderView.swift
//  ThreadsClone
//
//  Created by Davit Margaryan on 09.11.23.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User?
    
    init(user: User?) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
                //fullname and username
                VStack(alignment: .leading, spacing: 4) {
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.username ?? "")
                        .font(.subheadline)
                }
                
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                
                Text("200M followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            CircularProfileImageView(user: user, size: .medium)
        }   
    }
}

struct ProfileHeaderView_previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: dev.user)
    }
}
