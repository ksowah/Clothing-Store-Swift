//
//  SizeLabel.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import SwiftUI

enum Size: String, CaseIterable, Codable {
    case S
    case M
    case L
    case XL
    case XXL
}

struct SizeLabel: View {
    var selected: Bool
    var size: Size
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .stroke(.gray, lineWidth: 0.5)
                .frame(width: 35, height: 35)
            
            Text("\(size.rawValue)")
                .font(.subheadline)
                .frame(width: 40, height: 40)
                .foregroundColor(selected ? .white : .black )
        }
        .background(selected ? .black : .white)
        .cornerRadius(50)
        .clipped()
    }
}

struct SizeLabel_Previews: PreviewProvider {
    static var previews: some View {
        SizeLabel(selected: false, size: .L)
    }
}

