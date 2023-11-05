//
//  UserCell.swift
//  ThreadsClone
//
//  Created by Davit Margaryan on 04.11.23.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
         CircularProfileImageView()
            VStack(alignment: .leading) {
                Text("ՀՌՀ")
                    .fontWeight(.semibold)
                
                Text("CTR")
            }
            .font(.footnote)
            
            Spacer()
            
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
        }
        .padding(.horizontal)    }
}

#Preview {
    UserCell()
}
