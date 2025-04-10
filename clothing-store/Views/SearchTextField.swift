//
//  SearchTextField.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import SwiftUI

struct SearchTextField: View {
    @Binding var searchText: String
    var submitBtnIcon: String?
    
    var body: some View {
        HStack(spacing: 12) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading, 12)
                
                TextField("Search...", text: $searchText)
                    .padding(.vertical, 12)
                    .padding(.trailing, 12)
            }
            .background(Color(.systemGray6))
            .cornerRadius(12)
            
            if let icon = submitBtnIcon {
                Button(action: {
                    print("pressed")
                }) {
                    Image(systemName: icon)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.black)
                        .clipShape(Circle())
                }
            }
        }
//        .padding(.bottom, 20)
    }
}

struct SearchTextField_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextField(searchText: .constant("search"), submitBtnIcon: "slider.horizontal.3")
    }
}

