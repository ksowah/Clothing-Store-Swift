//
//  RadioButton.swift
//  clothing
//
//  Created by macbook on 05/04/2025.
//

import SwiftUI

struct RadioButton: View {
    @Binding var isSelected: Bool
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 2)
                .frame(width: 18, height: 18)
            if (isSelected) {
                Circle()
                    .frame(width: 12, height: 12)
            }
            
        }
    }
}

struct RadioButton_Previews: PreviewProvider {
    static var previews: some View {
        RadioButton(isSelected: .constant(true))
    }
}
