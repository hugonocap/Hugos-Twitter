//
//  FeedViewModel.swift
//  Hugo's Twitter
//
//  Created by Hugo on 4.12.22.
//

import Foundation

class FeedViewModel: ObservableObject {
    // service constant
    let service = TweetService()
    
    init() {
        fetchTweets()
    }
    
    // fetching tweets..
    func fetchTweets() {
        service.fetchTweets()
    }
}
