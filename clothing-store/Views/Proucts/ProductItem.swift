//
//  ProductItem.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import SwiftUI

struct ProductItem: View {
    var product: Product
    
    var body: some View {
        VStack {
            ZStack {
                Image(product.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180, height: 180)
                    .clipped()
                .cornerRadius(20)
                
                Image(systemName: "heart")
                    .imageScale(.small)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(40)
                    .offset(x: 60, y: -60)
                
            }
            
            Text(product.name)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
            Text(product.subtitle)
                .font(.caption)
                .foregroundColor(.gray)
            Text("\(product.price, format: .currency(code: "USD"))")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
        }
    }
}

struct ProductItem_Previews: PreviewProvider {
    static var previews: some View {
        ProductItem(product: Product.MOCK_PRODUCTS[0])
    }
}
