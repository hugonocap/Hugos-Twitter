//
//  ExploreView.swift
//  Hugo's Twitter
//
//  Created by Hugo on 24.11.22.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(0 ..< 25, id: \.self) { _ in
                            NavigationLink {
//                                ProfileView(user: user)
                            } label: {
                                UserRowView()
                            }

                        }
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
