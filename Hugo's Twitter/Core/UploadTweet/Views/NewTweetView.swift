//
//  NewTweetView.swift
//  Hugo's Twitter
//
//  Created by Hugo on 26.11.22.
//

import SwiftUI

struct NewTweetView: View {
    @State private var caption: String = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            
            HStack {
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Spacer()
                
                Button {
                    // tweet button
                } label: {
                    Text("Tweet")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                }

                
            }
            .padding()
            
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 64, height: 64)
                
                TextArea("What's happening?", text: $caption)
            }
            .padding()
            
            Spacer()
            
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
