//
//  DeliveryAddressView.swift
//  clothing
//
//  Created by macbook on 29/03/2025.
//

import SwiftUI

struct DeliveryAddressView: View {
    @EnvironmentObject var router: NavigationCoordinator
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    AddressCard()
                        .padding()
                    
                    Text("Product Item")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    ForEach(cartViewModel.cartItems) { item in
                        CartItemView(item: item)
                    }
                    
                }
            }
            .navigationBarTitle("Delivery Address")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        router.pop()
                    } label: {
                        AppToolbarItem(icon: "arrow.backward")
                    }

                }
        }
            
        HStack {
            VStack {
                Text("Total Price")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text(String(format: "$%.2f", cartViewModel.totalPrice))
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            Button {
                router.push(.paymentMethodScreen)
            } label: {
                Text("Place Order")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .frame(width: 160, height: 40)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(20)
            }
        }
        .padding()
        }
    }
}

struct DeliveryAddressView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryAddressView()
    }
}
