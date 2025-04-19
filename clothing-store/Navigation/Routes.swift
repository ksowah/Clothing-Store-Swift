//
//  Routes.swift
//  clothing
//
//  Created by macbook on 28/03/2025.
//

import Foundation
import ClothingStoreAPI

enum Route: Hashable {
    case getStartedScreen
    case loginScreen
    case homeScreen
    case homeViewScreen
    case cartScreen
    case onboarding
    case productDetailsScreen(productId: String)
    case paymentMethodScreen
    case paymentCardInfo
    case deliveryAddressScreen
    case categoryProductsScreen(category: ClothingStoreAPI.Category)
    case orderTrackingScreen
    case ordersScreen
    case signUpScreen
}
