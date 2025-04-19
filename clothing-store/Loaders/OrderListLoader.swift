//
//  OrderListLoader.swift
//  clothing-store
//
//  Created by macbook on 19/04/2025.
//

import SwiftUI

struct OrderListLoader: View {
    var body: some View {
        HStack {
            Shimmer(shape: Rectangle())
                .frame(width: 110, height: 110)
                .cornerRadius(10)
            
            VStack(alignment: .leading){
                Shimmer(shape: Rectangle())
                    .frame(width: 160, height: 10)
                    .cornerRadius(2)
                    .padding(.bottom)
                Shimmer(shape: Rectangle())
                    .frame(width: 80, height: 10)
                    .cornerRadius(2)
                Shimmer(shape: Rectangle())
                    .frame(width: 120, height: 10)
                    .cornerRadius(2)
                Shimmer(shape: Rectangle())
                    .frame(width: 120, height: 10)
                    .cornerRadius(2)
                }
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: 120)
        .padding(8)
        .background(.white)
        .cornerRadius(20)
        .shadow(color: Color(.systemGray6), radius: 20)
        .padding(.bottom, 6)
    }
}

struct OrderListLoader_Previews: PreviewProvider {
    static var previews: some View {
        OrderListLoader()
    }
}
