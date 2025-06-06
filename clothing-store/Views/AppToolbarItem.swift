//
//  AppToolbarItem.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import SwiftUI

struct AppToolbarItem: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var icon: String
    @State var showCount: Bool = false

    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray, lineWidth: 0.5)
                    .frame(width: 35, height: 35)
                
                Image(systemName: icon)
                    .foregroundColor(.black)
                    .font(.system(size: 15))
            }
            
            if showCount {
                if cartViewModel.cartItems.count > 0 {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.black)
                            .frame(width: 20, height: 20)
                        
                        Text("\(cartViewModel.cartItems.count)")
                            .font(.system(size: 8, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .offset(x: -22, y: -8)
                }
            }
        }
        
    }
}

struct AppToolbarItem_Previews: PreviewProvider {
    static var previews: some View {
        AppToolbarItem(icon: "line.3.horizontal")
    }
}

