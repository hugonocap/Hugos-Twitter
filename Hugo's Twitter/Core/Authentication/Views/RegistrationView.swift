//
//  RegistrationView.swift
//  Hugo's Twitter
//
//  Created by Hugo on 26.11.22.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group {
            if viewModel.didAuthenticateUser {
                ProfilePhotoSelectorView()
            } else {
                mainInterfaceView
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

extension RegistrationView {
    var mainInterfaceView: some View {
        VStack {
            AuthenticationHeaderView(title1: "Get Started.", title2: "Create Your Account")
            
            VStack(spacing: 40) {
                CustomInputField(icon: "envelope", placeholder: "Email", text: $email)
                CustomInputField(icon: "person", placeholder: "Username", text: $username)
                CustomInputField(icon: "person", placeholder: "Full Name", text: $fullName)
                CustomInputField(icon: "lock", placeholder: "Password", isSecureField: true, text: $password)
            }
            .padding(32)
            
            Button {
                viewModel.register(withEmail: email,
                                   password: password,
                                   fullName: fullName,
                                   username: username)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
            }
            .padding()
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            HStack {
                
                Text("Already have an account?")
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                
            }
            .padding(.bottom, 32)
            .font(.footnote)
            .foregroundColor(Color(.systemBlue))
        }
        .ignoresSafeArea()
    }
}
