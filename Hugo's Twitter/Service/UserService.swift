//
//  UserService.swift
//  Hugo's Twitter
//
//  Created by Hugo on 30.11.22.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService {
    
    func fetchUser(withUid uid: String) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let data = snapshot?.data() else { return }
                
                guard let user = try? snapshot?.data(as: User.self) else { return }
                
                print("DEBUG: User Email is \(user.email)")
                print("DEBUG: User Username is \(user.username)")
            }
    }
    
}
