//
//  NetworkInterceptorProvider.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import Foundation
import Apollo
import ApolloAPI

class NetworkInterceptorProvider: DefaultInterceptorProvider {
    
    override func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] where Operation : GraphQLOperation {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(AuthorizationInterceptor(), at: 0)
        interceptors.insert(AnalyticsInterceptor(), at: 1)
        return interceptors
    }
    
}
