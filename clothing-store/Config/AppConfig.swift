//
//  AppConfig.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import Foundation

enum AppConfig {
    enum App {
        static let name = "Clothing Store"
    }
    enum Network {
        static let uri = "https://clothing-store-graph.onrender.com/graphql"
    }

    enum Keychain {
        static let loginKey = "token"
    }
    
    enum Pagination {
        static let page = 1
        static let pageSize = 10
    }
}

