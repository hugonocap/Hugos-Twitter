//
//  ExploreView.swift
//  Hugo's Twitter
//
//  Created by Hugo on 24.11.22.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
    @State private var searchingText = ""
    
    var body: some View {
        VStack {
            SearchBar(text: $searchingText)
                .padding()
            
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink {
                                ProfileView(user: user)
                        } label: {
                            UserRowView(user: user)
                        }

                    }
                }
            }
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
