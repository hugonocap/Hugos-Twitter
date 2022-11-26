//
//  UserRowView.swift
//  Hugo's Twitter
//
//  Created by Hugo on 26.11.22.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 12) {
            
            Circle()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("elonmusk")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text("Elon Musk")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
