//
//  SideMenuView.swift
//  Hugo's Twitter
//
//  Created by Hugo on 26.11.22.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            
            VStack(alignment: .leading) {
                Circle()
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Hugo Montana")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text("@247geekymontana")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                UserStatsView()
                    .padding(.vertical)
            }
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue) { item in
                HStack(spacing: 16) {
                    Image(systemName: item.imageName)
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    Text(item.title)
                        .font(.subheadline)
                    
                    Spacer()
                }
                .frame(height: 30)
            }
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
