//
//  SignupViewModel.swift
//  clothing-store
//
//  Created by macbook on 19/04/2025.
//

import Foundation
import ClothingStoreAPI
import Apollo


class SignupViewModel: ObservableObject {
    @Published var activeRequest: Cancellable?
    @Published var userSignupSuccess: Bool = false
    
    func handleSignUp(for fullName: String, emailAddress: String, username: String, phoneNumber: String, and password: String) {
        
        self.activeRequest = Network.shared.apollo.perform(mutation: RegisterUserMutation(input: .init(fullName: fullName, username: username, emailAddress: emailAddress, password: password, phoneNumber: phoneNumber))) { [weak self] result in
            
            guard let self = self else {return}
            
            self.activeRequest = nil
            
            switch result {
            case .success(let graphQLResult):
                if let registeredUser = graphQLResult.data?.registerUser {
                    self.userSignupSuccess = true
                    print("User created successfully", registeredUser)
                }
                
                if let errors = graphQLResult.errors {
                    print(errors)
                }
            
            case.failure(let error):
                print(error)
            }
        }
    }
}
