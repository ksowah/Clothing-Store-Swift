//
//  BottomTabView.swift
//  clothing
//
//  Created by macbook on 26/03/2025.
//

import SwiftUI

enum Tabs: String, CaseIterable {
    case home
    case categories
    case orders
    case profile
}

struct BottomTabView: View {
    
    @Binding var selectedTab: Tabs
    
    func getIcon(tab: Tabs) -> String {
        switch tab {
        case .home:
            return "house.fill"
        case .categories:
            return "list.bullet.rectangle.fill"
        case .orders:
            return "bag.fill"
        case .profile:
            return "person.fill"
        }
    }
    
    var body: some View {
        HStack {
            ForEach(Tabs.allCases, id: \.rawValue ){ tab in
                TabItem(isActiveTab: tab == selectedTab, icon: getIcon(tab: tab), label: tab.rawValue.capitalized)
                    .onTapGesture {
                        selectedTab = tab
                    }
            }
        }
        .frame(height: 50)
        .padding(7)
        .background(.white)
        .cornerRadius(35)
        .animation(.default, value: selectedTab)
        .shadow(radius: 16)
        .padding(.bottom, -20)
    }
}

struct BottomTabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView(selectedTab: .constant(.home))
    }
}
