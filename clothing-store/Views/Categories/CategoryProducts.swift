//
//  CategoryProducts.swift
//  clothing
//
//  Created by macbook on 06/04/2025.
//

import SwiftUI

struct CategoryProducts: View {
    @State var category: Product.Category
    @EnvironmentObject var router: NavigationCoordinator
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 6),
        .init(.flexible(), spacing: 6)
    ]
    
    var filteredProducts: [Product] {
        return Product.MOCK_PRODUCTS.filter { product in
            product.category == category
        }
    }
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: gridItems) {
                ForEach(filteredProducts){ product in
                    Button {
                        router.push(.productDetailsScreen(product: product))
                    } label: {
                        ProductItem(product: product)
                    }
                    
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical)
        }
        .navigationTitle(category.rawValue)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    router.pop()
                } label: {
                    AppToolbarItem(icon: "arrow.backward")
                }

            }
        }
    }
}

struct CategoryProducts_Previews: PreviewProvider {
    static var previews: some View {
        CategoryProducts(category: .Bags)
    }
}
