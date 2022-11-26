//
//  CustomInputField.swift
//  Hugo's Twitter
//
//  Created by Hugo on 26.11.22.
//

import SwiftUI

struct CustomInputField: View {
    let icon: String
    let placeholder: String
    @Binding var text: String
    var body: some View {
        VStack {
            HStack {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                TextField(placeholder, text: $text)
            }
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(icon: "envelope",
                         placeholder: "Email",
                         text: .constant(""))
    }
}
