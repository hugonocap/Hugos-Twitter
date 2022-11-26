//
//  ProfileView.swift
//  Hugo's Twitter
//
//  Created by Hugo on 24.11.22.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectionFilter: TweetFilterViewModel = .tweets
    @Environment(\.presentationMode) var presentationMode
    @Namespace var animation
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            actionButtons
            userInfoDetails
            tweetFilterBar
            tweetsView
            
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    var headerView: some View {
        ZStack (alignment: .bottomLeading){
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                }
                
                
                Circle()
                    .frame(width: 72, height: 72)
                    .offset(x: 18, y: 30)
            }
        }
        .frame(height: 96)
    }
    
    var actionButtons: some View {
        HStack {
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
            Button {
                //
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
            
        }
        .padding(.trailing)
    }
    
    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            
            HStack {
                Text("Elon Musk")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            
            Text("@elonmusk")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack {
                Image(systemName: "calendar")
                Text("Joined June 2009")
            }
            .padding(.top)
            .font(.callout)
            .foregroundColor(.gray)
            
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
            .padding(.vertical)
            
        }
        .padding(.horizontal)
        
    }
    var tweetFilterBar: some View {
        HStack {
            
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                
                VStack {
                    
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectionFilter == item ? .semibold : .regular)
                        .foregroundColor(selectionFilter == item ? .black : .gray)
                    
                    if selectionFilter == item {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(.clear)
                            .frame(height: 3)
                    }
                    
                }
                .onTapGesture {
                    
                    withAnimation(.easeOut) {
                        self.selectionFilter = item
                    }
                    
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
    }
    
    var tweetsView: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ..< 10, id: \.self) { _ in
                    TweetRowView()
                }
            }
        }
    }
}
