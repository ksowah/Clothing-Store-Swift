//
//  CounterView.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import SwiftUI

struct CounterView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var item: CartItem
    
    var body: some View {
        HStack {
            Button {
                cartViewModel.decreaseCartProductCount(item: item)
            } label: {
                Text("-")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }

            Text("\(item.quantity)")
            Button {
                cartViewModel.increaseCartProductCount(item: item)
            } label: {
                Text("+")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }

        }
        .frame(width: 100, height: 36)
        .background(Color(.systemGray5))
        .cornerRadius(20)
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(item: .init(id: "67f7ef16df8ae6feee7d1506", product: .init(id: "67f7ef16df8ae6feee7d1506", name: "Women's Chunky Sneakers", previewImage: "https://img.ltwebstatic.com/images3_spmp/2023/10/20/60/169774208630a81cb06d8a20fa1b24fcbdd8d7893d_thumbnail_720x.jpg", price: 350, brand: "Balenciaga"), quantity: 2))
    }
}

