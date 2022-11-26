//
//  RegistrationView.swift
//  Hugo's Twitter
//
//  Created by Hugo on 26.11.22.
//

import SwiftUI

struct RegistrationView: View {
    var body: some View {
        VStack {
            AuthenticationHeaderView(title1: "Get Started.", title2: "Create Your Account")
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
