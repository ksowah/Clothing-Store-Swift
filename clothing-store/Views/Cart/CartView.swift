//
//  CartView.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var router: NavigationCoordinator
    
    var body: some View {
            NavigationSplitView{
                VStack {
                    List {
                        
                        ForEach(Product.MOCK_PRODUCTS){ product in
                            CartItem()
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
//                .animation(.default, value: filteredLandmarks)
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

