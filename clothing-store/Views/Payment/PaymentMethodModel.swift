//
//  PpaymentModel.swift
//  clothing
//
//  Created by macbook on 05/04/2025.
//

import Foundation

struct PaymentMethod: Identifiable {
    let id = UUID()
    let image: String
    let type: PaymentMethodType
    let title: String
    
    enum PaymentMethodType: String, CaseIterable {
        case creditCard = "Credit Card"
        case paypal = "PayPal"
        case visa = "Visa"
        case googlePay = "Google Pay"
    }
}

extension PaymentMethod {
    static var paymentMethods: [PaymentMethod] = [
        PaymentMethod(image: "master", type: .creditCard, title: "Credit Card"),
        PaymentMethod(image: "paypal", type: .paypal, title: "PayPal"),
        PaymentMethod(image: "visa", type: .visa, title: "Visa"),
        PaymentMethod(image: "google", type: .googlePay, title: "Google Pay"),
    ]
}


