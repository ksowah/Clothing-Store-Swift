//
//  CategoryRow.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import SwiftUI
import ClothingStoreAPI

struct CategoryRowItem: View {
    var isActive: Bool
    var category: ClothingStoreAPI.Category?
    
    var body: some View {
        Text(category?.rawValue ?? "All")
            .padding(.horizontal, category == nil ? 12 : 0)
            .foregroundColor(isActive ? .white : Color(.systemGray))
            .fontWeight(isActive ? .bold : .medium)
            .font(.subheadline)
            .padding(isActive ? 16 : 0)
            .background(isActive ? .black : .white)
            .cornerRadius(16)
            .padding(.horizontal, 14)
            .animation(.easeInOut, value: isActive)
        
    }
    
}

struct CategoryRowItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRowItem(isActive: true, category: .jewelry)
    }
}
