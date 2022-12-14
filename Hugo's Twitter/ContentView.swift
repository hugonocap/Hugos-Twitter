//
//  ContentView.swift
//  Hugo's Twitter
//
//  Created by Hugo on 21.11.22.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @State private var showMenu: Bool = false
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group {
            // no user logged in
            if viewModel.userSession == nil {
                LoginView()
            } else {
                // have a logged in user
                mainInterfaceView
            }
            
        }
    }
}

extension ContentView {
    
    var mainInterfaceView: some View {
        ZStack(alignment: .topLeading) {
            MainTabView()
                .navigationBarHidden(showMenu)
            
            // shadow
            if showMenu {
                ZStack {
                    Color(.black)
                        .opacity(showMenu ? 0.25 : 0.0)
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0 : -300, y: 0)
                .background(showMenu ? .white : .clear)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if let user = viewModel.currentUser {
                    Button {
                        withAnimation(.easeInOut) {
                            showMenu.toggle()
                        }
                    } label: {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 32, height: 32)
                    }
                }
            }
        }
        .onAppear {
            showMenu = false
        }
    }
    
}
