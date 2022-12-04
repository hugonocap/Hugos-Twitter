//
//  TweetRowView.swift
//  Hugo's Twitter
//
//  Created by Hugo on 21.11.22.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    var tweet: Tweet
    var body: some View {
        VStack(alignment: .leading) {
            
            //MARK: profile image, user info, tweet
            HStack(alignment: .top, spacing: 12) {
                if let user = tweet.user {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 56, height: 56)
                    
                    //MARK: user info and tweet caption
                    VStack(alignment: .leading, spacing: 4) {
                        // user info
                        HStack {
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.bold)
                            
                            Text("@\(user.username)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                            Text("2w")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                    }
                    
                    // tweet caption
                    
                    Text(tweet.caption)
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

//struct TweetRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetRowView()
//    }
//}
