//
//  SignupView.swift
//  clothing-store
//
//  Created by macbook on 19/04/2025.
//

import SwiftUI

struct SignupView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var fullName: String = ""
    @State private var phoneNumer: String = ""
    @State private var username: String = ""
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var router: NavigationCoordinator
    
    @StateObject var signupViewModel = SignupViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                Group {
                   Image("logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical)
            
                
                VStack(alignment: .leading) {
                    
                    Group{
                        Text("Sign Up")
                            .font(.headline)
                        
                        Text("Create a new account")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.bottom, 20)
                    }
                    
                    AppTextField(label: "Full Name", text: $fullName, placeholder: "eg. Kelvin Sowah", disableAutocorrection: true)
                    
                    AppTextField(label: "Username", text: $username, placeholder: "eg. ksowah", autocapitalization: .never, disableAutocorrection: true)
                    
                    AppTextField(label: "Email", text: $email, placeholder: "eg. sowahkelvin64@gmail.com", autocapitalization: .never, disableAutocorrection: true)
                    
                    AppTextField(label: "Phone Number", text: $phoneNumer, placeholder: "eg. 0201691439", disableAutocorrection: true)
                    
                    
                    AppTextField(label: "Password", text: $password, placeholder: "Enter Password", isPassword: true, autocapitalization: .never, disableAutocorrection: true)
                    
                    
                }
                .padding(.vertical, 20)
                
                Spacer()
                
                Group{
                    Button {
                        signupViewModel.handleSignUp(for: fullName, emailAddress: email, username: username, phoneNumber: phoneNumer, and: password)
                    } label: {
                        AppButton(title: "Sign Up", loading: signupViewModel.activeRequest != nil)
                            .padding(.bottom, 20)
                    }
                    .onChange(of: signupViewModel.userSignupSuccess) { success in
                        if success {
                            router.push(.loginScreen)
                        }
                    }
                }
                .frame(maxWidth: .infinity)

                
                HStack {
                    Text("Already have an Account? ") +
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
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        router.pop()
                    } label: {
                        AppToolbarItem(icon: "arrow.backward")
                    }
                    .foregroundColor(.white)

                }
        }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
