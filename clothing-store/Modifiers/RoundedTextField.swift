//
//  RoundedTextField.swift
//  clothing
//
//  Created by macbook on 05/04/2025.
//

import SwiftUI

struct RoundedTextField: ViewModifier {

    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.white)
            .cornerRadius(14)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(Color(.systemGray5), lineWidth: 1)
            )

    }
}
