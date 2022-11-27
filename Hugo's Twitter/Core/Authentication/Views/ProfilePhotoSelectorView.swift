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
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack {
            AuthenticationHeaderView(title1: "Setup account", title2: "Add a profile photo")
            
            Button {
                showImagePicker.toggle()
            } label: {
                
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                } else {
                    Image(systemName: "photo.circle")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color(.systemBlue))
                        .modifier(ProfileImageModifier())
                }
            }
            .padding(.top, 44)
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            
            // button
            if let selectedImage = selectedImage {
                
                Button {
                    viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                }
                .padding()
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                
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
            .scaledToFill()
            .frame(width: 180, height: 180)
            .clipShape(Circle())
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
