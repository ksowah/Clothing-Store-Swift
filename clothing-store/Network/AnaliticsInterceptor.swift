//
//  AnaliticsInterceptor.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import Foundation
import Apollo
import ApolloAPI

class AnalyticsInterceptor: ApolloInterceptor {
    public var id: String = UUID().uuidString
    
    func interceptAsync<Operation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) where Operation : GraphQLOperation {
        let startTime = Date()

        chain.proceedAsync(
            request: request,
            response: response,
            interceptor: self
        ) { result in
            let duration = Date().timeIntervalSince(startTime)
            print("🛰️ Operation '\(Operation.operationName)' took \(duration * 1000) ms")

            completion(result)
        }
    }
}

