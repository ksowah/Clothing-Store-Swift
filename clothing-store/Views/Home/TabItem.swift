//
//  TabItem.swift
//  clothing
//
//  Created by macbook on 26/03/2025.
//

import SwiftUI

struct TabItem: View {
    var isActiveTab: Bool
    var icon: String
    var label: String
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .foregroundColor(isActiveTab ? .white : .black)
                    .imageScale(.medium)
                    .frame(width: 50, height: 50)
                    .background(isActiveTab ? .black : .white)
                    .cornerRadius(50)
                
                if isActiveTab {
                    Text(label)
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                }
                
            }
            .padding(.trailing, isActiveTab ? 14 : 0)
        }
        .frame(height: 50)
        .background(isActiveTab ? .gray : .white)
        .cornerRadius(25)
    }
}

struct TabItem_Previews: PreviewProvider {
    static var previews: some View {
        TabItem(isActiveTab: true, icon: "house.fill", label: "Home")
    }
}
