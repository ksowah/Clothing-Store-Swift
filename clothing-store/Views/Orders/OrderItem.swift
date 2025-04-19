//
//  OrderItem.swift
//  clothing
//
//  Created by macbook on 06/04/2025.
//

import SwiftUI
import ClothingStoreAPI
import SDWebImageSwiftUI

struct OrderItem: View {
    @State var orderItem: OrderListQuery.Data.Order.Item?
    
    var body: some View {
        HStack {
            if let orderItem = orderItem {
                WebImage(url: URL(string: orderItem.product?.previewImage ?? "")) { image in
                    image.resizable()
                } placeholder: {
                    Image("")
                }
                .indicator(.activity)
                .scaledToFill()
                .cornerRadius(10)
                .frame(width: 110, height: 110)
                
                VStack(alignment: .leading) {
                    Text(orderItem.product?.name ?? "")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.bottom, 1)
                    Text(orderItem.product?.description ?? "")
                    Text("Brand: \(orderItem.product?.brand ?? "")")
                    Text("Quantity: \(orderItem.quantity)")
                }
                .multilineTextAlignment(.leading)
                .font(.caption)
                .foregroundColor(Color(.systemGray2))
                
                Spacer()
                
                Text("\(orderItem.product?.price ?? 0, format: .currency(code: "USD"))")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: 120)
        .padding(8)
        .background(.white)
        .cornerRadius(20)
        .shadow(color: Color(.systemGray6), radius: 20)
        .padding(.bottom, 6)
        
    }
}

//struct OrderItem_Previews: PreviewProvider {
//    static var previews: some View {
//        OrderItem()
//    }
//}
