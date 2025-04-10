//
//  CardInfoView.swift
//  clothing
//
//  Created by macbook on 05/04/2025.
//

import SwiftUI

struct CardInfoView: View {
    @State private var cardHolder: String = ""
    @State private var cardNumber: String = ""
    @State private var expiryDate: String = ""
    @State private var cvv: String = ""
    @State var showSuccess = false
    @EnvironmentObject var router: NavigationCoordinator
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Image("card-blank")
                        .resizable()
                        .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    
                    Text(cardNumber != "" ? formatCardNumber(cardNumber) : "**** **** **** ****")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 280, alignment: .leading)
                        .offset(x:-14, y: 5)
                    
                    Text(cardHolder != "" ? cardHolder : "John Doe")
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(width: 200, alignment: .leading)
                        .offset(x:-52, y: 95)
                    
                    Text(expiryDate != "" ? expiryDate : getCurrentExpiryDate())
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(width: 80, alignment: .leading)
                        .offset(x: 100, y: 95)
                        
                }
                
                HStack {
                    Text("Card Details")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                VStack(spacing: 16) {
                    TextField("Card Holder", text: $cardHolder)
                        .textFieldRounded()
                        .autocorrectionDisabled()

                    TextField("Card Number", text: $cardNumber)
                        .onChange(of: cardNumber) { newValue in
                            cardNumber = formatCardNumber(newValue)
                        }
                        .keyboardType(.numberPad)
                        .textFieldRounded()

                    TextField("Expiry Date (MM/YY)", text: $expiryDate)
                        .onChange(of: expiryDate) { newValue in
                            expiryDate = formatExpiryDate(newValue)
                        }
                        .keyboardType(.numberPad)
                        .textFieldRounded()
                    
                    SecureField("CVV", text: $cvv)
                        .onChange(of: cvv) { newValue in
                            if !isValidCVV(newValue) {
                                cvv = String(newValue.prefix(3))
                            }
                        }
                        .keyboardType(.numberPad)
                        .textFieldRounded()
                }
                .padding()
                
                HStack {
                    Button {
                        print("")
                    } label: {
                        Text("Cancel")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Button {
                        showSuccess = true
                    } label: {
                        AppButton(title: "Confirm",width: 200)
                    }
                }
                .padding()
            }
            
            if showSuccess {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .background(.black)
                    .opacity(0.6)
                    .transition(.opacity)
                    .onTapGesture {
                        showSuccess = false
                    }
                    .animation(.default, value: showSuccess)
            }
            
            if showSuccess {
                CardPaymentSuccess()
                    .transition(.scale)
            }
        }
        .navigationBarTitle("Card Details")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    router.pop()
                } label: {
                    AppToolbarItem(icon: "arrow.backward")
                }

            }
        }
    }
    
    
    func formatCardNumber(_ cardNumber: String) -> String {
        let digitsOnly = cardNumber.filter { $0.isNumber }
        let limitedDigits = String(digitsOnly.prefix(16))
        
        var formatted = ""
        for (index, char) in limitedDigits.enumerated() {
            if index != 0 && index % 4 == 0 {
                formatted.append("  ")
            }
            formatted.append(char)
        }
        
        return formatted
    }
    
    func formatExpiryDate(_ input: String) -> String {
        let digitsOnly = input.filter { $0.isNumber }
        let limited = String(digitsOnly.prefix(4))
        
        var formatted = ""
        for (index, char) in limited.enumerated() {
            if index == 2 {
                formatted.append("/")
            }
            formatted.append(char)
        }
        return formatted
    }
    
    func isValidCVV(_ cvv: String) -> Bool {
        let cleanedCVV = cvv.filter { $0.isNumber }
        return cleanedCVV.count == 3
    }
    
    func getCurrentExpiryDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/yy"
        return formatter.string(from: date)
    }
}

struct CardInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CardInfoView()
    }
}
