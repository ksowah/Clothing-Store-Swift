//
//  CartViewModel.swift
//  clothing-store
//
//  Created by macbook on 17/04/2025.
//

import Foundation
import SwiftUI
import ClothingStoreAPI


struct CartProduct: Codable, Hashable {
    let id: String
    let name: String?
    let previewImage: String?
    let price: Double?
    let brand: String?
}

struct CartItem: Codable, Identifiable, Hashable {
    let id: String
    let product: CartProduct
    var quantity: Int
}


class CartViewModel: ObservableObject {
    @Published var cartItems: [CartItem] = []
    var totalPrice: Double {
        cartItems.reduce(0) { result, item in
            result + ((item.product.price ?? 0) * Double(item.quantity))
        }
    }

    private let storageKey = "cart_items"

    init() {
        loadCart()
    }

    func addToCart(product: GetProductQuery.Data.Product) {
        let cartProduct = CartProduct(
            id: product._id,
            name: product.name,
            previewImage: product.previewImage,
            price: product.price,
            brand: product.brand
        )

        if ((cartItems.firstIndex(where: { $0.id == cartProduct.id })) != nil) {
            return
        } else {
            let item = CartItem(id: cartProduct.id, product: cartProduct, quantity: 1)
            cartItems.append(item)
        }

        saveCart()
    }
    
    func getCartItem(id: String) -> CartItem? {
        if let item = cartItems.first(where: { $0.id == id }) {
            return item
        }
        return nil
    }
    
    func increaseCartProductCount(item: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            cartItems[index].quantity += 1
        }
    }

    func decreaseCartProductCount(item: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            if item.quantity > 1 {
                cartItems[index].quantity -= 1
            } else {
                removeFromCart(item: item)
            }
        }
    }

    func removeFromCart(item: CartItem) {
        cartItems.removeAll { $0.id == item.id }
        saveCart()
    }

    func clearCart() {
        cartItems = []
        saveCart()
    }

    // MARK: - Persistence

    private func saveCart() {
        if let encoded = try? JSONEncoder().encode(cartItems) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }

    private func loadCart() {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
              let savedItems = try? JSONDecoder().decode([CartItem].self, from: data) else {
            cartItems = []
            return
        }

        cartItems = savedItems
    }
}
