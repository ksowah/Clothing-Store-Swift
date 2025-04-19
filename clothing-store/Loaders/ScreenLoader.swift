//
//  ScreenLoader.swift
//  clothing-store
//
//  Created by macbook on 18/04/2025.
//

import SwiftUI

struct ScreenLoader: View {
    var body: some View {
        ProgressView()
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gray.opacity(0.5))
    }
}

struct ScreenLoader_Previews: PreviewProvider {
    static var previews: some View {
        ScreenLoader()
    }
}
