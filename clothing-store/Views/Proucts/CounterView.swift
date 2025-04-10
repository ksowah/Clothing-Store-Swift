//
//  CounterView.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import SwiftUI

struct CounterView: View {
    var body: some View {
        HStack {
            Button {
                print("")
            } label: {
                Text("-")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }

            Text("1")
            Button {
                print("")
            } label: {
                Text("+")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }

        }
        .frame(width: 100, height: 36)
        .background(Color(.systemGray5))
        .cornerRadius(20)
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
    }
}

