//
//  UploadTweetViewModel.swift
//  Hugo's Twitter
//
//  Created by Hugo on 4.12.22.
//

import Foundation

class UploadTweetViewModel: ObservableObject {
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        service.uploadTweet(caption: caption)
    }
}
