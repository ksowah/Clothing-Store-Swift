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
                
                HStack {
                    Text("Cart Items")
                        .font(.headline)
                        .padding(.top)
                        .padding(.horizontal)
                    
                    Spacer()
                }
                
                VStack {
                    CartItem()
                    CartItem()
                    CartItem()
                }
                .padding()
            }
            
            Button {
                router.push(.paymentCardInfo)
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
                .background(.black)
                .cornerRadius(20)
                .padding(.horizontal, 16)
            }
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
