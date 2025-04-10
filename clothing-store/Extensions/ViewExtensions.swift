//
//  ViewExtensions.swift
//  clothing
//
//  Created by macbook on 29/03/2025.
//

import Foundation
import SwiftUI

extension View {
    func borderRound(
        cornerRadius: CGFloat = 16,
        borderColor: Color = Color.gray.opacity(0.3),
        backgroundColor: Color = .white,
        borderWidth: CGFloat = 1,
        dashPattern: [CGFloat] = [6, 3]
    ) -> some View {
        self.modifier(RoundedBorder(
            cornerRadius: cornerRadius,
            borderColor: borderColor,
            backgroundColor: backgroundColor,
            borderWidth: borderWidth,
            dashPattern: dashPattern
        ))
    }
    
    func textFieldRounded() -> some View {
        self.modifier(RoundedTextField())
    }
}

