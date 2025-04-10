//
//  AppSlider.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import SwiftUI

struct AppSlider: View {
    @State private var currentSlide = "shoe2"
    private var items: [String] = [
        "shoe2",
        "shoe1",
        "shoe3",
    ]
    
    var body: some View {
        VStack {
            TabView(selection: $currentSlide) {
                ForEach(items, id: \.self) { item in
                    SliderItem(image: item, isActive: currentSlide == item)
                        .tag(item)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 220)
            
            HStack(spacing: 10) {
                ForEach(items, id: \.self) { item in
                    Capsule()
                        .frame(width: currentSlide == item ? 20 : 7, height: 7)
                        .foregroundColor(currentSlide == item ? .black : .gray)
                        .animation(.easeInOut, value: currentSlide)
                }
            }
            
        }
    }
}

struct AppSlider_Previews: PreviewProvider {
    static var previews: some View {
        AppSlider()
    }
}
