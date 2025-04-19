//
//  CartItem.swift
//  clothing
//
//  Created by macbook on 27/03/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct CartItemView: View {
    @EnvironmentObject private var cartViewModel: CartViewModel
    var item: CartItem
    var product: CartProduct
    
    init(item: CartItem){
        self.item = item
        self.product = item.product
    }
    
    var body: some View {
        HStack {
            
            WebImage(url: URL(string: product.previewImage ?? "")) { image in
                image.resizable()
            } placeholder: {
                Rectangle()
                    .background(Color.gray.opacity(0.6))
            }
             .indicator(.activity)
             .scaledToFill()
             .frame(width: 100, height: 100)
             .clipped()
             .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text(product.name ?? "")
                    .font(.subheadline)
                    .fontWeight(.medium)
                
                Text(product.brand ?? "")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text("\(product.price ?? 0, format: .currency(code: "USD"))")
                    .fontWeight(.bold)
            }
            .padding(.vertical, 10)
            
            Spacer()
            
            VStack(alignment: .trailing) {
//                Button {
//                    cartViewModel.removeFromCart(item: item)
//                } label: {
//                    Image(systemName: "trash")
//                        .imageScale(.medium)
//                }
//                .frame(width: 34, height: 34)
//                .borderRound(cornerRadius: 4)
//                .foregroundColor(.gray)

                
                Spacer()
                CounterView(item: item)
            }
        }
        .padding(10)
        .frame(maxWidth: .infinity, maxHeight: 120)
        .background(.white)
    }
}

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView(item: .init(id: "67f7ef16df8ae6feee7d1506", product: .init(id: "67f7ef16df8ae6feee7d1506", name: "Women's Chunky Sneakers", previewImage: "https://img.ltwebstatic.com/images3_spmp/2023/10/20/60/169774208630a81cb06d8a20fa1b24fcbdd8d7893d_thumbnail_720x.jpg", price: 350, brand: "Nike"), quantity: 2))
    }
}
