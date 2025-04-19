//
//  CartView.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var router: NavigationCoordinator
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var body: some View {
            NavigationSplitView{
                if cartViewModel.cartItems.isEmpty {
                    EmptyStateView(imageName: "cart", title: "Your Cart is Empty", subtitle: "Start adding items to your cart")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button {
                                    router.pop()
                                } label: {
                                    AppToolbarItem(icon: "arrow.backward")
                                }
                                
                            }
                        }

                } else {
                    VStack {
                        List {
                            
                            ForEach(cartViewModel.cartItems){ item in
                                CartItemView(item: item)
                                    .swipeActions {
                                        Button(role: .destructive) {
                                            cartViewModel.removeFromCart(item: item)
                                        } label: {
                                            Label("Remove", systemImage: "cart.badge.minus")
                                        }
                                        .tint(.red)
                                    }
                            }
                            
                        }
                        .listStyle(PlainListStyle())
                        
                        Button {
                            router.push(.deliveryAddressScreen)
                        } label: {
                            HStack {
                                Text("Proceed to Checkout")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                Spacer()
                                Image(systemName: "arrow.right")
                                    .imageScale(.large)
                            }
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.black)
                            .cornerRadius(20)
                            .padding(.horizontal, 16)
                        }
                        .padding(.top, 10)
                    }
                    .animation(.default, value: cartViewModel.cartItems)
                    .navigationTitle("My Cart")
                    .background(.white)
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
                
            } detail: {
                Text("Select a Product")
            }
            
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}

