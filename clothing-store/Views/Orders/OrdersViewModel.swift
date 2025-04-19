//
//  OrdersViewModel.swift
//  clothing-store
//
//  Created by macbook on 18/04/2025.
//

import Foundation
import ClothingStoreAPI
import Apollo
import SwiftUI

class OrdersViewModel: ObservableObject {
    
    @Published var activeRequest: Cancellable?
    @Published var getOrdersActiveRequest: Cancellable?
    @Published var isOrderPlacedSuccess: Bool = false
    @Published var orderItem: OrderListQuery.Data.Order?
    @Published var orderItems: [OrderListQuery.Data.Order?] = []
    private var cartViewModel: CartViewModel
    
    init(cartViewModel: CartViewModel) {
        self.cartViewModel = cartViewModel
    }
    
    func placeOrder() {
        let items = cartViewModel.cartItems.map {
            ClothingStoreAPI.OrderItemInput(product: $0.product.id, quantity: $0.quantity)
        }
        
        self.activeRequest = Network.shared.apollo.perform(mutation: PlaceOrderMutation(input: .init(items: items, totalPrice: cartViewModel.totalPrice))){ [weak self] result in
            
            guard let self = self else {
                return
            }
            
            self.activeRequest = nil
            
            switch result {
                case .success(let graphQLResult):
                if let orderID = graphQLResult.data?.order?._id {
                    self.isOrderPlacedSuccess = true
                    self.cartViewModel.clearCart()
                    print("Order Submitted", orderID)
                }
                
                if let errors = graphQLResult.errors {
                    print(errors)
                }
                
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    func getOrders(status: ClothingStoreAPI.OrderStatus) {
        
        self.getOrdersActiveRequest = Network.shared.apollo.fetch(query: OrderListQuery(status: status == .cancelled ? .some(.case(status)) : nil)) { [weak self]
 result in
            guard let self = self else {return}
            
            self.getOrdersActiveRequest = nil
            
            switch result {
            case .success(let graphQLResult):
                if let orderItems = graphQLResult.data?.orders {
                    self.orderItems = orderItems
                    print("success >>", orderItems)
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
