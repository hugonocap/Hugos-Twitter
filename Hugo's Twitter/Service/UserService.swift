//
//  UserService.swift
//  Hugo's Twitter
//
//  Created by Hugo on 30.11.22.
//

import Firebase

struct UserService {
    
    func fetchUser(withUid uid: String) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let data = snapshot?.data() else { return }
                
                print("DEBUG: Data is \(data)")
            }
    }
    
}
