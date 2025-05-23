//
//  AuthorizationInterceptor.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import Foundation
import Apollo
import ApolloAPI

class AuthorizationInterceptor: ApolloInterceptor {
    public var id: String = UUID().uuidString
    
    func interceptAsync<Operation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) where Operation : GraphQLOperation {
        
        let keychain = KeychainSwift()
        if let token = keychain.get(AppConfig.Keychain.loginKey) {
            request.addHeader(name: "Authorization", value: token)
        }
        
        chain.proceedAsync(
            request: request,
            response: response,
            interceptor: self,
            completion: completion)
        
    }
}
