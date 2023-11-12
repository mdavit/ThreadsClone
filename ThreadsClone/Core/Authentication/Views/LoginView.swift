//
//  LoginView.swift
//  ThreadsClone
//
//  Created by Davit Margaryan on 03.11.23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack{
            VStack {
            
                Spacer()
                
                Image("threads-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                Spacer()
                VStack {
                    TextField("Enter your e-mail", text: $viewModel.email)
                        .autocapitalization(.none)
                        .modifier(ThreadsTextFieldModifier())
                    
                    SecureField("Enter you password", text: $viewModel.password)
                        .modifier(ThreadsTextFieldModifier())

                }
                NavigationLink {
                    Text("Forgot password")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 28)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                
                }
                Button {
                    Task { try await viewModel.login() }
                } label: {
                    Text("Login")
                        .modifier(ThreadsButtonModifier())
                }
                Spacer()
                
                Divider()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Not register yet?")
                        
                        Text("Sign up")
                            .fontWeight(.semibold)
                        
                    }
                    .foregroundColor(.black)
                    .font(.footnote)
                }
                .padding(.vertical, 16)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
