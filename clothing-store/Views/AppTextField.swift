//
//  AppTextField.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import SwiftUI

struct AppTextField: View {
    let label: String
    @Binding var text: String
    var placeholder: String = ""
    var leadingIcon: String? = nil
    var trailingIcon: String? = nil
    var font: Font = .body
    var textColor: Color = .primary
    var borderColor: Color = .gray
    var accentColor: Color = .blue
    var isPassword: Bool = false
    
    @State private var showPassword: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.subheadline)
                .foregroundColor(.black)
            
            HStack(spacing: 8) {
                // Leading icon
                if let leadingIcon = leadingIcon {
                    Image(systemName: leadingIcon)
                        .foregroundColor(borderColor)
                }
                
                // Text/Secure Field
                Group {
                    if isPassword {
                        if showPassword {
                            TextField(placeholder, text: $text)
                        } else {
                            SecureField(placeholder, text: $text)
                        }
                    } else {
                        TextField(placeholder, text: $text)
                    }
                }
                .font(font)
                .foregroundColor(textColor)
                .accentColor(accentColor)
                .padding(.vertical, 8)
                
                // Password visibility toggle or trailing icon
                if isPassword {
                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(borderColor)
                    }
                } else if let trailingIcon = trailingIcon {
                    Image(systemName: trailingIcon)
                        .foregroundColor(borderColor)
                }
            }
            .overlay(
                VStack {
                    Spacer()
                    Rectangle()
                        .frame(height: 0.5)
                        .foregroundColor(text.isEmpty ? borderColor : accentColor)
                }
            )
        }
        .padding(.vertical, 8)
    }
}

// Updated preview with password field
struct AppTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            AppTextField(
                label: "Password",
                text: .constant("Password123"),
                placeholder: "Enter password",
                leadingIcon: "lock",
                isPassword: true
            )
            
            AppTextField(
                label: "New Password",
                text: .constant(""),
                placeholder: "Enter new password",
                leadingIcon: "lock.doc",
                isPassword: true
            )
            
            AppTextField(
                label: "Email",
                text: .constant("user@example.com"),
                placeholder: "Enter email",
                leadingIcon: "envelope"
            )
        }
        .padding()
    }
}

