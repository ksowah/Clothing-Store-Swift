//
//  clothing_storeApp.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import SwiftUI

@main
struct clothing_storeApp: App {
    @StateObject private var coordinator = NavigationCoordinator()
    @StateObject private var cartViewModel = CartViewModel()
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(coordinator)
                .environmentObject(cartViewModel)
                .onAppear {
                    viewModel.checkServerConnection()
                    viewModel.getCurrentSession()
                }
        }
    }
}
