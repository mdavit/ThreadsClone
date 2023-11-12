//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by Davit Margaryan on 03.11.23.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Image("threads-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack {
                TextField("Enter your e-mail", text: $viewModel.email)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifier())
                
                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(ThreadsTextFieldModifier())
                
                TextField("Enter your fullname", text: $viewModel.fullname)
                    .modifier(ThreadsTextFieldModifier())

                TextField("Enter your username", text: $viewModel.username)
                    .modifier(ThreadsTextFieldModifier())
            }
            
            Button {
                Task { try await viewModel.createUser() }
            } label: {
                Text("Sign up")
                    .modifier(ThreadsButtonModifier())
            }
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
                .font(.footnote)
            }
            .padding(.vertical, 16)
        }
    }
}
    
    struct RegistrationView_Previews: PreviewProvider {
        static var previews: some View {
        RegistrationView()
    }
}
