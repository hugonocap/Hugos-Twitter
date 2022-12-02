//
//  ExploreViewModel.swift
//  Hugo's Twitter
//
//  Created by Hugo on 2.12.22.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    let service = UserService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
            
            print("DEBUG: Users is \(users)")
        }
    }
}
