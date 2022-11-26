//
//  NewTweetView.swift
//  Hugo's Twitter
//
//  Created by Hugo on 26.11.22.
//

import SwiftUI

struct NewTweetView: View {
    var body: some View {
        VStack {
            
            HStack {
                
                Button {
                    // dismiss button
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
            
            HStack {
                Circle()
                    .frame(width: 64, height: 64)
                
                
            }
            
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
