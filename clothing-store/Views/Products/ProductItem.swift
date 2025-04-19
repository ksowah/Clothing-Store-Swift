//
//  ProductItem.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import SwiftUI
import ClothingStoreAPI
import SDWebImageSwiftUI

struct ProductItem: View {
    private let placeholderImg = Image("f2")
    var product: ProductListQuery.Data.Product
    
    var body: some View {
        VStack {
            if let product = product {
                ZStack {
                    WebImage(url: URL(string: product.previewImage ?? "")) { image in
                        image.resizable()
                    } placeholder: {
                        Rectangle()
                            .background(Color.gray.opacity(0.6))
                    }
                     .indicator(.activity)
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
                
                Text(product.name ?? "Clothing Store")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Text(product.brand ?? "Brand")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("\(product.price ?? 99.99, format: .currency(code: "USD"))")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
        }
    }
}

//struct ProductItem_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductItem(product: Product.MOCK_PRODUCTS[0])
//    }
//}
