//
//  AppButton.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import SwiftUI

struct AppButton: View {
    var title: String
    var width: CGFloat?
    
    var body: some View {
        Text(title)
            .foregroundColor(.white)
            .font(.subheadline)
            .fontWeight(.medium)
            .frame(width: width != nil ? width : 250, height: 50)
            .background(.black)
            .cornerRadius(30)
    }
}

struct AppButton_Previews: PreviewProvider {
    static var previews: some View {
        AppButton(title: "Login")
    }
}
