//
//  ProfileViewModel.swift
//  Hugo's Twitter
//
//  Created by Hugo on 4.12.22.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    private let service = TweetService()
    let user: User
    
    init(user: User) {
        self.user = user
        self.fetchUserTweets()
    }
    
    func fetchUserTweets() {
        guard let uid = user.id else { return }
        service.fetchTweets(forUid: uid) { tweets in
            self.tweets = tweets
            
            for item in 0 ..< tweets.count {
                self.tweets[item].user = self.user
            }
        }
    }
}
