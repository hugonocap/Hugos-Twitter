//
//  LoginView.swift
//  Hugo's Twitter
//
//  Created by Hugo on 26.11.22.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        // parent container
        VStack {
            
            //MARK: Header
            AuthenticationHeaderView(title1: "Hello.", title2: "Welcome Back")
            
            VStack(spacing: 40) {
                CustomInputField(icon: "envelope", placeholder: "Email", text: $email)
                CustomInputField(icon: "lock", placeholder: "Password", text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack {
                Spacer()
                
                NavigationLink {
                    //
                } label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .foregroundColor(Color(.systemBlue))
                        .fontWeight(.semibold)
                }
                .padding(.top)
                .padding(.trailing, 22)

            }
        
            Button {
                //
            } label: {
                Text("Sign In")
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
                
                Text("Don't have an account?")
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarHidden(true)
                } label: {
                    Text("Sign Up")
                        .fontWeight(.semibold)
                }
                
            }
            .padding(.bottom, 32)
            .font(.footnote)
            .foregroundColor(Color(.systemBlue))
            
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
