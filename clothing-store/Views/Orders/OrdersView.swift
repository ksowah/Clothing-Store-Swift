//
//  OrdersView.swift
//  clothing
//
//  Created by macbook on 06/04/2025.
//

import SwiftUI

struct OrdersView: View {
    @State private var selectedTab = 0
    @EnvironmentObject var router: NavigationCoordinator
    let tabs = ["Ongoing", "Completed"]
    
    var body: some View {
        VStack {
            Picker("Tabs", selection: $selectedTab) {
                ForEach(0..<tabs.count, id: \.self) { index in
                    Text(tabs[index]).tag(index)
                }
            }
            .pickerStyle(.segmented)
            .padding()

            Spacer()
            
            // Display content based on selected tab
            Group {
                if selectedTab == 0 {
                    ScrollView(showsIndicators: false) {
                        OngoingOrders()
                    }
                } else if selectedTab == 1 {
                    ScrollView(showsIndicators: false) {
                        CompletedOrders()
                    }
                }
            }

            Spacer()
        }
        .navigationTitle("Orders")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    router.pop()
                } label: {
                    AppToolbarItem(icon: "arrow.backward")
                }

            }
        }
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}
