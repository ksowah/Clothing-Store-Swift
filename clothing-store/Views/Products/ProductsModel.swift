//
//  ProductsModel.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import Foundation
import ClothingStoreAPI
import Apollo

class ProductsViewModel: ObservableObject {
    @Published var products: [ProductListQuery.Data.Product] = []
    @Published var product: GetProductQuery.Data.Product?
    @Published var activeRequest: Cancellable?
    @Published var activeProductRequest: Cancellable?
    @Published var currentPage: Int = AppConfig.Pagination.page
    var totalPages: Int = 0
    
    func loadProducts(from category: ClothingStoreAPI.Category?) {
        
        self.activeRequest = Network.shared.apollo.fetch(query: ProductListQuery(pagination: .some(.init(page: .some(currentPage), pageSize: .some(AppConfig.Pagination.pageSize))), category: category != nil ? .some(.case(category!)) : nil)) { [weak self] result in
            guard let self = self else {
                return
            }
            
            self.activeRequest = nil
            
            switch result {
            case .success(let graphQLResult):
                if let products = graphQLResult.data?.products {
                    self.products.append(contentsOf: products.compactMap({ $0 }))
                }
                
                if let countString = graphQLResult.data?.count,
                   let count = Int(countString) {
                    self.totalPages = count / AppConfig.Pagination.pageSize
                }

                
                if let errors = graphQLResult.errors {
//                    self.appAlert = .errors(errors: errors)
                    print(errors)
                }
            case .failure(let error):
//                self.appAlert = .errors(errors: [error])
                print(error)
            }
        }
    }
    
    func loadMoreProducts(from category: ClothingStoreAPI.Category?) {
        guard currentPage < totalPages else { return }
        self.currentPage += 1
        loadProducts(from: category)
    }
    
    func getProduct(for id: String){
        self.activeProductRequest = Network.shared.apollo.fetch(query: GetProductQuery(id: id)) { [weak self] result in
            guard let self = self else {
                return
            }
            
            self.activeProductRequest = nil
            
            switch result {
            case .success(let graphQLResult):
                if let product = graphQLResult.data?.product {
                    self.product = product
                }
                
                if let errors = graphQLResult.errors {
//                    self.appAlert = .errors(errors: errors)
                    print(errors)
                }
            
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct Product: Hashable, Codable, Identifiable {
    var id = UUID()
    var _id: String
    var code: String
    var name: String
    var description: String
    var images: [String]
    var previewImage: String
    var brand: String
    var category: Category
    var price: Float
    var createdAt: String
    var updatedAt: String
    
    enum Category: String, CaseIterable, Codable {
        case newArrivals = "NewArrivals"
        case cloths = "Cloths"
        case shoes = "Shoes"
        case bags = "Bags"
        case electronics = "Electronics"
        case jewelry = "Jewelry"
    }
}

struct CategoryItem: Hashable, Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let subtitle: String
    let category: ClothingStoreAPI.Category
}

extension Product {
    static var MOCK_PRODUCTS: [Product] = [
        .init(_id: "67f7ef16df8ae6feee7d1502", code: "SHO10016ssah", name: "Air Max 97", description: "Comfortable running shoes with premium cushioning.", images: [
            "https://cdn-images.farfetch-contents.com/19/52/52/55/19525255_43509333_1000.jpg",
            "https://cdn-images.farfetch-contents.com/19/52/52/55/19525255_43509330_2048.jpg",
            "https://cdn-images.farfetch-contents.com/19/52/52/55/19525255_43509333_2048.jpg",
            "https://cdn-images.farfetch-contents.com/19/52/52/55/19525255_43509326_2048.jpg"
        ], previewImage: "https://cdn-images.farfetch-contents.com/19/52/52/55/19525255_43509333_1000.jpg", brand: "Nike", category: Product.Category.shoes, price: 120, createdAt: "2025-04-10T16:17:26.938Z", updatedAt: "2025-04-10T16:17:26.938Z")
        
    ]
}

