//
//  SliderItem.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import SwiftUI

struct SliderItem: View {
    var image: String
    var isActive: Bool
    
    @State private var scale: CGFloat = 1
    @State private var offsetY: CGFloat = -10

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    VStack {
                        HStack {
                            Text("20% ") +
                            Text("Discount")
                                .font(.title2)
                                .fontWeight(.medium)
                        }
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        
                        Text("on your first purchase")
                            .font(.subheadline)
                        
                        AppButton(title: "Shop Now", width: 150)
                            .padding(.bottom, 20)
                        
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)
            }
            .frame(maxWidth: .infinity, minHeight: 160, maxHeight: 180)
            .background(Color(.systemGray4))
            .cornerRadius(30)
            .padding()
            
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 250,height: 250)
                .offset(x: 75, y:-10)
                .scaleEffect(scale)
                .opacity(isActive ? 1 : 0)
                .onChange(of: isActive) { newValue in
                    if newValue {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                            scale = 1.0
                            offsetY = -10
                        }
                    } else {
                        scale = 0.1
                        offsetY = 20
                    }
                }
        }
    }
}

struct SliderItem_Previews: PreviewProvider {
    static var previews: some View {
        SliderItem(image: "shoe1", isActive: true)
    }
}
