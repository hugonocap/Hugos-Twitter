//
//  TweetService.swift
//  Hugo's Twitter
//
//  Created by Hugo on 4.12.22.
//

import Firebase

struct TweetService {
    
    func uploadTweet(caption: String, completion: @escaping(Bool) -> Void) {
        // getting current user id
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid": uid,
                    "caption": caption,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date())] as [String : Any] // we set as [String : Any] because we have different types of value
        
        Firestore.firestore().collection("tweets") // creates new collection in fireStorage
            .document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: Tweet upload error \(error.localizedDescription)")
                    completion(false)
                    return
                }
                
                completion(true)
            }
        
    }
    
    func fetchTweets(completion: @escaping([Tweet]) -> Void) {
        Firestore.firestore().collection("tweets")
            .order(by: "timestamp", descending: true) // sorting by recent
            .getDocuments { snapshot, error in
                
                if let error = error {
                    print("DEBUG: Tweet fetching error \(error.localizedDescription)")
                    return
                }
                
                guard let documents = snapshot?.documents else { return }
                
                let tweets = documents.compactMap { try? $0.data(as: Tweet.self) }
                completion(tweets)
            }
    }
    
    func fetchTweets(forUid uid: String, completion: @escaping([Tweet]) -> Void) {
        Firestore.firestore().collection("tweets")
            .whereField("uid", isEqualTo: uid) // going to firestore and searching for uid which equals to user uid
            .getDocuments { snapshot, error in
                
                if let error = error {
                    print("DEBUG: Tweet fetching error \(error.localizedDescription)")
                    return
                }
                
                guard let documents = snapshot?.documents else { return }
                
                var tweets = documents.compactMap { try? $0.data(as: Tweet.self) }
                completion(tweets.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })) // sorting by recent
            }
    }
}
