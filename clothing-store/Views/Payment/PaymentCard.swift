//
//  PaymentCard.swift
//  clothing
//
//  Created by macbook on 05/04/2025.
//

import SwiftUI

struct PaymentCard: View {
    let isSelected: Bool
    @State var title: String
    @State var image: String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 45, height: 45)
                .padding(5)
                .background(Color(.systemGray5))
                .cornerRadius(50)
            
            Text(title)
                .font(.subheadline)
            
            Spacer()
            
            RadioButton(isSelected: .constant(isSelected))
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 100)
        .background(.white)
        .cornerRadius(20)
        .shadow(
            color: .gray.opacity(0.2),
            radius: 8,
            y: 6
        )
        .padding(.horizontal)
    }
}

struct PaymentCard_Previews: PreviewProvider {
    static var previews: some View {
        PaymentCard(isSelected: false, title: "Credit Card", image: "paypal")
    }
}
