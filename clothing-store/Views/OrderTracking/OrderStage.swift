//
//  OrderStage.swift
//  clothing
//
//  Created by macbook on 07/04/2025.
//

import SwiftUI

struct OrderStep: Identifiable {
    @State var id = UUID()
    @State var icon: String
    @State var title: String
}

struct OrderStage: View {
    let steps: [OrderStep] = [
        OrderStep(icon: "cart", title: "Ordered"),
        OrderStep(icon: "airplane", title: "In Transit"),
        OrderStep(icon: "house", title: "Delivered"),
        OrderStep(icon: "checkmark", title: "Completed")
    ]
    @State var currentStep: Int
    
    var body: some View {
        HStack {
            ForEach(0..<steps.count, id: \.self) { index in
                HStack(spacing: 0) {
                    if index != 0 {
                        Rectangle()
                            .fill(index <= currentStep ? Color.black : Color.gray.opacity(0.3))
                            .frame(height: 4)
                            .animation(.easeInOut, value: currentStep)
                    }
                }
                
                ZStack {
                    Circle()
                        .fill(index <= currentStep ? Color.black : Color.gray.opacity(0.3))
                        .frame(width: 30, height: 30)
                        .animation(.easeInOut, value: currentStep)
                    
                    Image(systemName: steps[index].icon)
                        .foregroundColor(index <= currentStep ? .white : .gray)
                        .font(.system(size: 14, weight: .bold))
                        .animation(.easeInOut, value: currentStep)
                }
            }
        }
    }
}

struct OrderStage_Previews: PreviewProvider {
    static var previews: some View {
        OrderStage(currentStep: 1)
    }
}
