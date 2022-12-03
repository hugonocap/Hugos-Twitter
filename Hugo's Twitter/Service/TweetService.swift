//
//  TweetService.swift
//  Hugo's Twitter
//
//  Created by Hugo on 4.12.22.
//

import Firebase

struct TweetService {
    
    func uploadTweet(caption: String) {
        // getting current user id
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid": uid,
                    "caption": caption,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date())] as [String : Any] // we set as [String : Any] because we have different types of value
        
        Firestore.firestore().collection("tweets") // creates new collection in fireStorage
            .document()
            .setData(data) { _ in
                print("did upload tweet..")
            }
        
    }
}
