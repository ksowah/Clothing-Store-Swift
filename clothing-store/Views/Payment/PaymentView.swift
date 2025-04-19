//
//  PaymentView.swift
//  clothing
//
//  Created by macbook on 05/04/2025.
//

import SwiftUI

struct PaymentView: View {
    @State var selectedPaymentType: PaymentMethod.PaymentMethodType?
    @EnvironmentObject var router: NavigationCoordinator
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(PaymentMethod.paymentMethods) { method in
                        Button {
                            withAnimation {
                                selectedPaymentType = method.type
                            }
                        } label: {
                            PaymentCard(isSelected: selectedPaymentType == method.type, title: method.title, image: method.image)
                        }
                        .foregroundColor(.black)
                    }
                }
                .padding(.top)
                
                HStack {
                    Text("Cart Items")
                        .font(.headline)
                        .padding(.top)
                        .padding(.horizontal)
                    
                    Spacer()
                }
                
                VStack {
                    ForEach(cartViewModel.cartItems) { item in
                        CartItemView(item: item)
                    }
                }
                .padding()
            }
            
            Button {
                if selectedPaymentType != nil {
                    router.push(.paymentCardInfo)
                }
            } label: {
                HStack {
                    Text("Continue")
                        .font(.subheadline)
                        .fontWeight(.medium)
                    Spacer()
                    Image(systemName: "arrow.right")
                        .imageScale(.large)
                }
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.black.opacity(selectedPaymentType == nil ? 0.6 : 1))
                .cornerRadius(20)
                .padding(.horizontal, 16)
            }
            .disabled(selectedPaymentType == nil)
            .padding(.vertical, 10)
        }
        .navigationBarTitle("Payment Method")
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

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
