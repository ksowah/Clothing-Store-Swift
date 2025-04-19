//
//  HomeView.swift
//  clothing
//
//  Created by macbook on 26/03/2025.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab: Tabs = .home
    @EnvironmentObject var router: NavigationCoordinator
    @EnvironmentObject var cartViewModel: CartViewModel
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    HomePage()
                        .tag(Tabs.home)
                    
                    CategoriesView()
                        .tag(Tabs.categories)
                    
                    OrdersView(cartViewModel: cartViewModel)
                        .bold()
                        .tag(Tabs.orders)
                    
                    ProfileView()
                        .bold()
                        .tag(Tabs.profile)
                }
            }
            .padding(.bottom, 55)
            
            VStack {
                Spacer()
                BottomTabView(selectedTab: $selectedTab)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                AppToolbarItem(icon: "line.3.horizontal")
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    router.push(.cartScreen)
                } label: {
                    AppToolbarItem(icon: "basket", showCount: true)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
