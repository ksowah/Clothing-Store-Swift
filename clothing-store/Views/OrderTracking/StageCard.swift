//
//  StageCard.swift
//  clothing
//
//  Created by macbook on 07/04/2025.
//

import SwiftUI

struct StageCard: View {
    var body: some View {
        HStack {
            Image(systemName: "car.fill")
                .frame(width: 50, height: 50)
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text("US 47848293445")
                    .font(.subheadline)
                    .fontWeight(.bold)
                Text("Tamil Nadu")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text("Delivered")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(Color.gray.opacity(0.5))
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 110)
        .background(.white)
        .cornerRadius(20)
        .shadow(color: Color(.systemGray5) ,radius: 10)
    }
}

struct StageCard_Previews: PreviewProvider {
    static var previews: some View {
        StageCard()
    }
}
