//
//  AuthViewModel.swift
//  Hugo's Twitter
//
//  Created by Hugo on 26.11.22.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    // if the user is logged in this property will have a value if not property will be nil
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        // if user is logged in we're going to store the user session in "userSession" variable
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User session is \(String(describing: self.userSession))")
    }
    
    // this function gonna log our user in
    func login(withEmail email: String, password: String) {
        print("DEBUG: Login with email \(email)")
    }
    
    // this function gonna sign our user up
    func register(withEmail email: String, password: String, fullName: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            // checks for error and print it into console
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            
            guard let user = result?.user else { return }
            self.userSession = user
            
            print("DEBUG: Registered user successfully")
            print("DEBUG: User is \(String(describing: self.userSession))")
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullName,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    print("DEBUG: Did upload user data..")
                }
        }
    }
    
    func signOut() {
        userSession = nil
        
        // signs user out in backend/server
        try? Auth.auth().signOut()
    }
}
