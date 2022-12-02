//
//  UserService.swift
//  Hugo's Twitter
//
//  Created by Hugo on 30.11.22.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService {
    
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let data = snapshot?.data() else { return }
                
                guard let user = try? snapshot?.data(as: User.self) else { return }
                completion(user)
            }
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void) {
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, error in
                guard let documents = snapshot?.documents else { return }
                let users = documents.compactMap { try? $0.data(as: User.self) }
                
                completion(users)
            }
    }
}
