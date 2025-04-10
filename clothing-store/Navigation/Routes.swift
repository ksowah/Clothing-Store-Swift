//
//  Routes.swift
//  clothing
//
//  Created by macbook on 28/03/2025.
//

import Foundation

enum Route: Hashable {
    case getStartedScreen
    case loginScreen
    case homeScreen
    case homeViewScreen
    case cartScreen
    case onboarding
    case productDetailsScreen(product: Product)
    case paymentMethodScreen
    case paymentCardInfo
    case deliveryAddressScreen
    case categoryProductsScreen(category: Product.Category)
    case orderTrackingScreen
    case ordersScreen
}
