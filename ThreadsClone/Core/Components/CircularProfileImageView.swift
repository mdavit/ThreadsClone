//
//  CircularProfileImageView.swift
//  ThreadsClone
//
//  Created by Davit Margaryan on 04.11.23.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("logo")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView()
}
