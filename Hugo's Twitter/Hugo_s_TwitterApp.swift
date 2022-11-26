//
//  Hugo_s_TwitterApp.swift
//  Hugo's Twitter
//
//  Created by Hugo on 21.11.22.
//

import SwiftUI
import Firebase

@main
struct Hugo_s_TwitterApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
//                LoginView()
            }
        }
    }
}
