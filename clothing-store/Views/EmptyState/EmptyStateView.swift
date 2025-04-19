//
//  EmptyStateView.swift
//  clothing-store
//
//  Created by macbook on 18/04/2025.
//

import SwiftUI

struct EmptyStateView: View {
    var imageName: String = "tray"
    var title: String = "No Items Found"
    var subtitle: String = "Looks like there's nothing here yet."
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(.gray)

            Text(title)
                .font(.title3)
                .fontWeight(.semibold)

            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
        }
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView()
    }
}
