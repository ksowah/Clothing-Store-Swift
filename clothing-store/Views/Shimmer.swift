//
//  Shimmer.swift
//  clothing-store
//
//  Created by macbook on 13/04/2025.
//

import SwiftUI

struct Shimmer<S: Shape>: View {
    @State var isAnimating: Bool = false
    var shape: S
    var color: Color
    
    init(shape: S, color: Color = .gray.opacity(0.3)) {
        self.shape = shape
        self.color = color
    }
    
    var body: some View {
        shape
            .fill(color)
            .overlay {
                GeometryReader {
                    let size = $0.size
                    let shimmerWidth = size.width / 2
                    let blurRadius = max(shimmerWidth / 2, 30) // radius 30+
                    let blurDimension = blurRadius * 2
                    
//                    movement offset
                    let minX = -(shimmerWidth + blurDimension)
                    let maxX = size.width + shimmerWidth + blurDimension
                    
                    Rectangle()
                        .fill(.gray)
                        .frame(width: shimmerWidth, height: size.height * 2)
                        .frame(height: size.height)
                        .blur(radius: blurRadius)
                        .rotationEffect(.init(degrees: rotation))
                        .blendMode(.softLight)
                        .offset(x: isAnimating ? maxX : minX)
                }
            }
            .clipShape(shape)
            .compositingGroup()
            .onAppear {
                guard !isAnimating else {return}
                withAnimation(animation) {
                    isAnimating = true
                }
            }
            .onDisappear{
                isAnimating = false
            }
            .transaction {
                if $0.animation != animation {
                    $0.animation = .none
                }
            }
    }
    
    var rotation: Double {
        return 5
    }
    
    var animation: Animation {
        .easeInOut(duration: 1.5).repeatForever(autoreverses: false)
    }
}

struct Shimmer_Previews: PreviewProvider {
    static var previews: some View {
        Shimmer(shape: Circle())
            .frame(width: 100, height: 100)
    }
}
