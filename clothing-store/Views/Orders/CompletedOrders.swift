//
//  CompletedOrders.swift
//  clothing
//
//  Created by macbook on 06/04/2025.
//

import SwiftUI

struct CompletedOrders: View {
    @EnvironmentObject var router: NavigationCoordinator
    var body: some View {
        VStack {
            ForEach(0..<6, id: \.self) { idx in
                Button {
                    router.push(.orderTrackingScreen)
                } label: {
                    OrderItem()
                }
            }
        }
        .padding()
    }
}

struct CompletedOrders_Previews: PreviewProvider {
    static var previews: some View {
        CompletedOrders()
    }
}
