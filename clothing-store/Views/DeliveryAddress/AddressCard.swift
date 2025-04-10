//
//  AddressCard.swift
//  clothing
//
//  Created by macbook on 29/03/2025.
//

import SwiftUI

struct AddressCard: View {
    var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                AddressRow(label: "Street:", value: "3512 Pearl Street")
                AddressRow(label: "City:", value: "Los Poyos Hermanos")
                AddressRow(label: "State/Province/Area:", value: "Tamil")
                AddressRow(label: "Phone Number:", value: "+233201691439")
                AddressRow(label: "Zip Code:", value: "+233201691439")
                AddressRow(label: "Country:", value: "Mexico")
            }
            .frame(maxWidth: .infinity)
            .padding()
            .borderRound(dashPattern: [6,6])
    }
}


struct AddressRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            (
                Text(label)
                    .font(.headline)
                    .fontWeight(.bold) +
                Text(" \(value)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            )
            Spacer()
        }
    }
}

struct AddressCard_Previews: PreviewProvider {
    static var previews: some View {
        AddressCard()
    }
}
