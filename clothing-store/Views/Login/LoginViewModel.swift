//
//  LoginViewModel.swift
//  clothing-store
//
//  Created by macbook on 18/04/2025.
//

import Foundation
import ClothingStoreAPI
import Apollo
import SwiftUI

class LoginViewModel: ObservableObject {
    
    @Published var activeRequest: Cancellable?
    @Published var userLoginSccess: Bool = false
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    func login(with email: String?, and password: String?) {
        
        guard let email = email, !email.isEmpty else {
            return
        }
        guard let password = password, !password.isEmpty else {
            return
        }
        
        self.activeRequest = Network.shared.apollo.perform(mutation: LoginUserMutation(emailAddress: email, password: password)) { [weak self] result in
            
            guard let self = self else {return}
            
            self.activeRequest = nil

            switch result {
            case .success(let graphQLResult):
                if let token = graphQLResult.data?.loginUser?.token {
                    let keychain = KeychainSwift()
                    keychain.set(token, forKey: AppConfig.Keychain.loginKey)
                    self.isLoggedIn = true
                    self.userLoginSccess = true
                }

                if let errors = graphQLResult.errors {
                    print(errors)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
