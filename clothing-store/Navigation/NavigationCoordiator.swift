//
//  NavigationCoordiator.swift
//  clothing
//
//  Created by macbook on 29/03/2025.
//

import Foundation

class NavigationCoordinator: ObservableObject {
    @Published var path: [Route] = []

    func push(_ route: Route) {
        path.append(route)
    }

    func pop() {
        _ = path.removeLast()
    }

    func toRoot() {
        path.removeAll()
    }
}
