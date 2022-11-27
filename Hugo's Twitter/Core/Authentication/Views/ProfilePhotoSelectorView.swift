//
//  ProfilePhotoSelectorView.swift
//  Hugo's Twitter
//
//  Created by Hugo on 27.11.22.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker: Bool = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    var body: some View {
        VStack {
            AuthenticationHeaderView(title1: "Setup account", title2: "Add a profile photo")
            
            Button {
                showImagePicker.toggle()
            } label: {
                
                if let profileImage = profileImage {
                    profileImage
                        .modifier(ProfileImageModifier())
                } else {
                    Image(systemName: "photo.circle")
                        .renderingMode(.template)
                        .foregroundColor(Color(.systemBlue))
                        .modifier(ProfileImageModifier())
                }
            }
            .padding(.top, 44)
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    // helper
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 180, height: 180)
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
