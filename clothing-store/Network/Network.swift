//
//  Network.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import Foundation
import Apollo


class Network {
  static let shared = Network()
    
  private init() {} // ensure Network() can only be initialised here

    private(set) lazy var apollo: ApolloClient = {
        let client = URLSessionClient()
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let provider = NetworkInterceptorProvider(client: client, store: store)
        let url = URL(string: AppConfig.Network.uri)!
        let transport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)

        return ApolloClient(networkTransport: transport, store: store)
    }()
}
