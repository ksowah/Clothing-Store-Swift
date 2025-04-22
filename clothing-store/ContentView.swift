//
//  ContentView.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var coordinator: NavigationCoordinator
    @EnvironmentObject var cartViewModel: CartViewModel
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            VStack {
                if isLoggedIn {
                    HomeView()
                } else {
                    GetStarted()
                }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .productDetailsScreen(let productId):
                    ProductDetailsView(productId: productId)
                        .navigationBarBackButtonHidden()
                case .getStartedScreen:
                    GetStarted()
                case .loginScreen:
                    LoginView()
                        .navigationBarBackButtonHidden()
                case .homeScreen:
                    HomePage()
                        .navigationBarBackButtonHidden()
                case .cartScreen:
                    CartView()
                        .navigationBarBackButtonHidden()
                case .onboarding:
                    OnboardingProcessFlow()
                        .navigationBarBackButtonHidden()
                case .homeViewScreen:
                    HomeView()
                        .navigationBarBackButtonHidden()
                case .paymentMethodScreen:
                    PaymentView()
                        .navigationBarBackButtonHidden()
                case .paymentCardInfo:
                    CardInfoView(cartViewModel: cartViewModel)
                        .navigationBarBackButtonHidden()
                case .deliveryAddressScreen:
                    DeliveryAddressView()
                        .navigationBarBackButtonHidden()
                case .categoryProductsScreen(let category):
                    CategoryProducts(category: category)
                        .navigationBarBackButtonHidden()
                case .orderTrackingScreen:
                    OrderTrackingView()
                        .navigationBarBackButtonHidden()
                case .ordersScreen:
                    OrdersView(cartViewModel: cartViewModel)
                        .navigationBarBackButtonHidden()
                case .signUpScreen:
                    SignupView()
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
