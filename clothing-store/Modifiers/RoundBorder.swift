//
//  RoundedBorder.swift
//  clothing
//
//  Created by macbook on 29/03/2025.
//

import SwiftUI

struct RoundedBorder: ViewModifier {
    var cornerRadius: CGFloat = 16
    var borderColor: Color = Color.gray.opacity(0.3)
    var backgroundColor: Color = .white
    var borderWidth: CGFloat = 1
    var dashPattern: [CGFloat] = [6, 3]

    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroundColor)
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .strokeBorder(
                                borderColor,
                                style: StrokeStyle(
                                    lineWidth: borderWidth,
                                    dash: dashPattern
                                )
                            )
                    )
            )
    }
}
