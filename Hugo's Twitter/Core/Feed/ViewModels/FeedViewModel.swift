//
//  FeedViewModel.swift
//  Hugo's Twitter
//
//  Created by Hugo on 4.12.22.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    // service constants
    let service = TweetService()
    let userService = UserService()
    
    
    init() {
        fetchTweets()
    }
    
    // fetching tweets..
    func fetchTweets() {
        service.fetchTweets { tweets in
            self.tweets = tweets
            
            for item in 0 ..< tweets.count {
                let uid = tweets[item].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.tweets[item].user = user
                }
            }
            
        }
    }
}
