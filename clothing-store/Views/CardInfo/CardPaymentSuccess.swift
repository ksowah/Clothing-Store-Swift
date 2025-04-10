//
//  CardPaymentSuccess.swift
//  clothing
//
//  Created by macbook on 05/04/2025.
//

import SwiftUI

struct CardPaymentSuccess: View {
    @EnvironmentObject var router: NavigationCoordinator
    
    var body: some View {
        VStack {
            Image("payment-success")
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
            
            Text("Successul!")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("Your payment has been confirmed successfully")
                .font(.subheadline)
                .foregroundColor(Color(.systemGray))
                .padding(.top, 5)
                .multilineTextAlignment(.center)
            
            Button {
                router.push(.homeViewScreen)
            } label: {
                AppButton(title: "Continue Shopping")
                    .padding(.top)
            }

            
            
        }
        .padding()
        .frame(width: 300, height: 300)
        .background(.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

struct CardPaymentSuccess_Previews: PreviewProvider {
    static var previews: some View {
        CardPaymentSuccess()
    }
}
