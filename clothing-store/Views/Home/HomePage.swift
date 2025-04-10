//
//  HomePage.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import SwiftUI

struct HomePage: View {
    
    @State private var searchText = ""
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 6),
        .init(.flexible(), spacing: 6)
    ]
    
    @State private var selectedCategory: Product.Category = .All
    @EnvironmentObject var router: NavigationCoordinator
    
    var filteredProducts: [Product] {
        if selectedCategory == .All {
            return Product.MOCK_PRODUCTS
        } else {
            return Product.MOCK_PRODUCTS.filter { product in
                product.category == selectedCategory
            }
        }
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack {
                VStack(alignment: .leading){
                    Text("Welcome, ")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Kelvin")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .padding()
            
            SearchTextField(searchText: $searchText, submitBtnIcon: "slider.horizontal.3")
                .padding()
            
            AppSlider()
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Product.Category.allCases, id: \.self) { category in
                        Button {
                            selectedCategory = category
                        } label: {
                            CategoryRowItem(isActive: selectedCategory == category, category: category)
                        }
                        
                    }
                }
            }
            .padding(.bottom)
            
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

        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
