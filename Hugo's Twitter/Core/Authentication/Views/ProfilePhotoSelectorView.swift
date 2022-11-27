//
//  ProfilePhotoSelectorView.swift
//  Hugo's Twitter
//
//  Created by Hugo on 27.11.22.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    var body: some View {
        VStack {
            AuthenticationHeaderView(title1: "Create your account", title2: "Add a profile photo")
            
            Button {
                //
            } label: {
                Image(systemName: "photo.circle")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color(.systemBlue))
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                    
            }
            .padding(.top, 44)
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
