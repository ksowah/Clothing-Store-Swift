//
//  ContentViewModel.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import Foundation
import ClothingStoreAPI

class ContentViewModel: ObservableObject {
    @Published var welcomeMessage: String?
    @Published var currentUser: CurrentUserQuery.Data.User?

    func checkServerConnection() {
        Network.shared.apollo.fetch(query: RootQuery()) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let graphQLResult):
                if let message = graphQLResult.data?.getRoot {
                    DispatchQueue.main.async {
                        self.welcomeMessage = message
                        print("✅ Server connected: \(message)")
                    }
                } else if let errors = graphQLResult.errors {
                    print("❌ GraphQL errors: \(errors)")
                }
            case .failure(let error):
                print("❌ Network error: \(error)")
            }
        }
    }
    
    func getCurrentSession() {
        Network.shared.apollo.fetch(query: CurrentUserQuery()) { [weak self] result in
            guard let self = self else {return}
            
            switch result {
            case .success(let graphQlResult):
                if let user = graphQlResult.data?.user {
                    self.currentUser = user
                }
                
                if let errors = graphQlResult.errors {
                    print(errors)
                }
            
            case .failure(let error):
                print(error)
                
            }
        }
    }
}

