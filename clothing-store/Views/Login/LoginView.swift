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
    @StateObject var loginViewModel = LoginViewModel()
    
    
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
                
                AppTextField(label: "Email", text: $email, placeholder: "eg. sowahkelvin64@gmail.com", autocapitalization: .never, disableAutocorrection: true)
                AppTextField(label: "Password", text: $password, placeholder: "Enter Password", isPassword: true, autocapitalization: .never, disableAutocorrection: true)
                
            }
            .padding(.vertical, 20)
            
            Spacer()
            
            Group{
                Button {
                    loginViewModel.login(with: email, and: password)
                } label: {
                    AppButton(title: "Login", loading: loginViewModel.activeRequest != nil)
                        .padding(.bottom, 20)
                }
                .onChange(of: loginViewModel.userLoginSccess) { success in
                    if success {
                        router.push(.homeViewScreen)
                    }
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
            .onTapGesture {
                router.push(.signUpScreen)
            }
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

