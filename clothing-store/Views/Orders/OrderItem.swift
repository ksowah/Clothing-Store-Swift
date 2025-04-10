//
//  OrderItem.swift
//  clothing
//
//  Created by macbook on 06/04/2025.
//

import SwiftUI

struct OrderItem: View {
    var body: some View {
        HStack {
            Image("f4")
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .frame(width: 110, height: 110)
            
            VStack(alignment: .leading) {
                Text("Soludos")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.bottom, 1)
                Text("Ibiza classic lace sneakers")
                Text("Quality: 1")
                Text("Size: 42")
            }
            .multilineTextAlignment(.leading)
            .font(.caption)
            .foregroundColor(Color(.systemGray2))
            
            Spacer()
            
            Text("$120.00")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
        }
        .frame(maxWidth: .infinity, maxHeight: 120)
        .padding(8)
        .background(.white)
        .cornerRadius(20)
        .shadow(color: Color(.systemGray6), radius: 20)
        .padding(.bottom, 6)
        
    }
}

struct OrderItem_Previews: PreviewProvider {
    static var previews: some View {
        OrderItem()
    }
}
