//
//  HomePage.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import SwiftUI
import ClothingStoreAPI


struct HomePage: View {
    @StateObject private var viewModel = ProductsViewModel()
    @State private var searchText = ""
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 6),
        .init(.flexible(), spacing: 6)
    ]
    
    @State var selectedCategory: ClothingStoreAPI.Category?
    
    @EnvironmentObject var router: NavigationCoordinator
    
    
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
                    Button {
                        selectedCategory = nil
                    } label: {
                        CategoryRowItem(isActive: selectedCategory == nil)
                    }

                    ForEach(ClothingStoreAPI.Category.allCases, id: \.self) { category in
                        Button {
                            selectedCategory = category
                        } label: {
                            CategoryRowItem(isActive: selectedCategory == category, category: category)
                        }
                        
                    }
                }
            }
            .padding(.vertical)
            
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
            
//            if viewModel.currentPage < viewModel.totalPages {
//                ProgressView()
//                    .padding(.vertical, 10)
//                    .onAppear {
//                        viewModel.loadMoreProducts(from: selectedCategory)
//                    }
//            }

        }
        .onChange(of: selectedCategory){ newCategory in
            viewModel.products = []
            viewModel.currentPage = 1
            viewModel.totalPages = 1
            viewModel.loadProducts(from: newCategory)
        }
        .task {
            viewModel.loadProducts(from: selectedCategory)
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
