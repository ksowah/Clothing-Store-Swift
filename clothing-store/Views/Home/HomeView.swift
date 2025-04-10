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
                    
                    OrdersView()
                        .bold()
                        .tag(Tabs.orders)
                    
                    Text("Profile")
                        .bold()
                        .tag(Tabs.profile)
                }
            }
            
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
                    AppToolbarItem(icon: "basket", count: 2)
                }
            }
        }
        .badge(3)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
