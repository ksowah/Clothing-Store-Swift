//
//  ProductsLoader.swift
//  clothing-store
//
//  Created by macbook on 13/04/2025.
//

import SwiftUI

struct ProductsLoader: View {
    
    var body: some View {
        VStack {
            Shimmer(shape: Rectangle())
                .frame(width: 180, height: 180)
                .cornerRadius(20)
                .padding(.bottom, 5)
            
            Shimmer(shape: Rectangle())
                .frame(width: 160, height: 10)
                .cornerRadius(2)
            Shimmer(shape: Rectangle())
                .frame(width: 80, height: 10)
                .cornerRadius(2)
            Shimmer(shape: Rectangle())
                .frame(width: 120, height: 10)
                .cornerRadius(2)
            
        }
    }
}

struct ProductsLoader_Previews: PreviewProvider {
    static var previews: some View {
        ProductsLoader()
    }
}
