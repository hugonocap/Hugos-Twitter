//
//  UserStatsView.swift
//  Hugo's Twitter
//
//  Created by Hugo on 26.11.22.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 24) {
            
            HStack(alignment: .center, spacing: 4) {
                
                Text("130")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text("Following")
                    .font(.subheadline)
                
            }
            
            HStack(alignment: .center, spacing: 4) {
                
                Text("118.9M")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text("Followers")
                    .font(.subheadline)
                
            }
            
        }
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
