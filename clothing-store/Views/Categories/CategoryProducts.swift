//
//  CategoryProducts.swift
//  clothing
//
//  Created by macbook on 06/04/2025.
//

import SwiftUI
import ClothingStoreAPI

struct CategoryProducts: View {
    @State var category: ClothingStoreAPI.Category
    @StateObject private var viewModel = ProductsViewModel()
    @EnvironmentObject var router: NavigationCoordinator
    @State var searchText: String = ""
        
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 6),
        .init(.flexible(), spacing: 6)
    ]
    
    
    var body: some View {
        VStack {
            SearchTextField(searchText: $searchText, submitBtnIcon: "slider.horizontal.3")
                .padding()
            ScrollView {
                LazyVGrid(columns: gridItems) {
                    if viewModel.activeRequest == nil {
                        ForEach(viewModel.products, id: \.self){ product in
                            Button {
                                router.push(.productDetailsScreen(productId: product._id))
                            } label: {
                                ProductItem(product: product)
                            }
                            
                        }
                    } else {
                        ForEach(0..<2, id: \.self) {idx in
                            ProductsLoader()
                        }
                    }
                    
                }
                .padding(.horizontal, 8)
                .padding(.vertical)
            }
            .task {
                viewModel.loadProducts(from: category)
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
}

struct CategoryProducts_Previews: PreviewProvider {
    static var previews: some View {
        CategoryProducts(category: .bags)
    }
}
