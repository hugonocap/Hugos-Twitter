//
//  LoginView.swift
//  Hugo's Twitter
//
//  Created by Hugo on 26.11.22.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        // parent container
        VStack {
            
            //MARK: Header
            VStack(alignment: .leading) {
                // fills background to entire screen
                HStack { Spacer() }
                
                Text("Hello.")
                
                Text("Welcome Back")
            }
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(height: 260)
            .padding(.leading)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            
            Spacer()
            
        }
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
