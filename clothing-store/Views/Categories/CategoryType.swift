//
//  Category.swift
//  clothing
//
//  Created by macbook on 26/03/2025.
//

import SwiftUI


struct CategoryType: View {
    var item: CategoryItem
    var index: Int
    
    var body: some View {
        ZStack {
            Image(item.image)
                .resizable()
                .scaledToFill()
                .overlay(Color.black.opacity(0.3))

                HStack {
                    
                    if index % 2 != 0 {
                        Spacer()
                    }
                    
                    VStack(alignment: index % 2 == 0 ? .leading : .trailing) {
                        Text(item.title)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text(item.subtitle)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    
                    if index % 2 == 0 {
                        Spacer()
                    }
                }
        }
        .frame(maxWidth: .infinity, maxHeight: 150)
        .cornerRadius(20)
        .clipped()
    }
}

struct CategoryType_Previews: PreviewProvider {
    static var previews: some View {
        CategoryType(item: CategoryItem(image: "f6", title: "New Arrivals", subtitle: "208 Products", category: .newArrivals), index: 1)
    }
}
