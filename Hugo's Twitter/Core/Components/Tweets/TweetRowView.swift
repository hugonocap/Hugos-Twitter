//
//  TweetRowView.swift
//  Hugo's Twitter
//
//  Created by Hugo on 21.11.22.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            //MARK: profile image, user info, tweet
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                
                //MARK: user info and tweet caption
                VStack(alignment: .leading, spacing: 4) {
                    // user info
                    HStack {
                        Text("Elon Musk")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                        Text("@elonmusk")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    // tweet caption
                    
                    Text("Twitter is fun 🚀 💫 ♥️")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            
            //MARK: action buttons
            HStack {
                Button {
                    //
                } label: {
                    Image(systemName: "bubble.left")
                }
                
                Spacer()
                
                Button {
                    //
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                }
                
                Spacer()
                
                Button {
                    //
                } label: {
                    Image(systemName: "heart")
                }
                
                Spacer()
                
                Button {
                    //
                } label: {
                    Image(systemName: "bookmark")
                }

            }
                .padding()
            
            Divider()
        }
        .padding()
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}
