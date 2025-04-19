//
//  OrdersView.swift
//  clothing
//
//  Created by macbook on 06/04/2025.
//

import SwiftUI
import ClothingStoreAPI

struct OrdersView: View {
    @State private var selectedTab = 0
    @EnvironmentObject var router: NavigationCoordinator
    let tabs = [ClothingStoreAPI.OrderStatus.pending, ClothingStoreAPI.OrderStatus.cancelled]
    @StateObject var orderViewModel: OrdersViewModel
    
    init (cartViewModel: CartViewModel) {
        _orderViewModel = StateObject(wrappedValue: OrdersViewModel(cartViewModel: cartViewModel))
    }
    
    var body: some View {
        VStack {
            Picker("Tabs", selection: $selectedTab) {
                ForEach(0..<tabs.count, id: \.self) { index in
                    Text(tabs[index].rawValue).tag(index)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            .onChange(of: selectedTab) { newIndex in
                orderViewModel.getOrders(status: tabs[newIndex])
            }
            
            // Display content based on selected tab
            if orderViewModel.getOrdersActiveRequest == nil {
                Group {
                    if orderViewModel.orderItems.isEmpty {
                        EmptyStateView(title: "No Order Placed", subtitle: "You haven't placed any order here yet")
                    } else {
                        ScrollView(showsIndicators: false) {
                            ForEach(orderViewModel.orderItems, id: \.self) { order in
                                ForEach(order?.items ?? [], id: \.self){ item in
                                    Button {
                                        router.push(.orderTrackingScreen)
                                    } label: {
                                        OrderItem(orderItem: item)
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                }
            } else {
                OrderListLoader()
                OrderListLoader()
            }

            Spacer()
        }
        .task({
            orderViewModel.getOrders(status: tabs[selectedTab])
        })
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
        let cartViewModel = CartViewModel()
        OrdersView(cartViewModel: cartViewModel)
    }
}
