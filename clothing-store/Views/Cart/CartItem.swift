//
//  CartItem.swift
//  clothing
//
//  Created by macbook on 27/03/2025.
//

import SwiftUI

struct CartItem: View {
    var body: some View {
        HStack {
            Image("f6")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipped()
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text("Roller Rabit")
                    .font(.subheadline)
                    .fontWeight(.medium)
                
                Text("Vodo Odelle Dress")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text("$120.00")
                    .fontWeight(.bold)
            }
            .padding(.vertical, 10)
            
            Spacer()
            
            VStack {
                Spacer()
                CounterView()
            }
        }
        .padding(10)
        .frame(maxWidth: .infinity, maxHeight: 120)
        .background(.white)
    }
}

struct CartItem_Previews: PreviewProvider {
    static var previews: some View {
        CartItem()
    }
}
