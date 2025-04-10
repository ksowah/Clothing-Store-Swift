//
//  LoginView.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var router: NavigationCoordinator
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Group{
               Image("logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            
            Spacer()
            
            VStack(alignment: .leading) {
                
                Group{
                    Text("Welcome!")
                        .font(.headline)
                    
                    Text("Please login or sign up to continue")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.bottom, 20)
                }
                
                AppTextField(label: "Email", text: $email, placeholder: "eg. sowahkelvin64@gmail.com")
                AppTextField(label: "Password", text: $password, placeholder: "Enter Password", isPassword: true)
                
            }
            .padding(.vertical, 20)
            
            Spacer()
            
            Group{
                Button {
                    router.push(.homeViewScreen)
                } label: {
                    AppButton(title: "Login")
                        .padding(.bottom, 20)
                }
            }
            .frame(maxWidth: .infinity)
            
            Spacer()
            
            HStack {
                Text("Don't have an account? ") +
                Text("Sign up")
                    .foregroundColor(.black)
                    .fontWeight(.medium)
            }
            .font(.caption)
            .foregroundColor(.gray)
            .frame(maxWidth: .infinity)
            .padding(.bottom)
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

