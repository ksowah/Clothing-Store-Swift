//
//  OnboardingItem.swift
//  clothing
//
//  Created by macbook on 26/03/2025.
//

import SwiftUI

struct OnboardingPage {
    let image: String
    let title: String
    let description: String
}

struct OnboardingItem: View {
    let item: OnboardingPage
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Image(item.image)
                .resizable()
                .scaledToFill()
                .frame(height: 450)
                .cornerRadius(30)
                .clipped()
            
            Text(item.title)
                .font(.title)
                .fontWeight(.bold)
            
            Text(item.description)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

struct OnboardingItem_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingItem(item: OnboardingPage(image: "f2", title: "20% Discount New Arrival Product", description: "Publish up your selies to make yourself more beautiful"))
    }
}
