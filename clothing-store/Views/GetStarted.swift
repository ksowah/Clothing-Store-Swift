//
//  GetStarted.swift
//  clothing
//
//  Created by macbook on 26/03/2025.
//

import SwiftUI

struct GetStarted: View {
    @EnvironmentObject var router: NavigationCoordinator
    
    var body: some View {
            ZStack {
                Image("f4")
                    .resizable()
                    .scaledToFill()
                    .overlay(Color.black.opacity(0.6))
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    Text("Welcome to the")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    
                    Text("Clothing Store")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    
                    Button {
                        router.push(.onboarding)
                    } label: {
                        Text("Get Started")
                            .foregroundColor(.black)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .frame(width: 200, height: 60)
                            .background(.white)
                            .cornerRadius(30)
                            .padding(.bottom, 20)
                    }
                    
                }
                
            }
            .background(.black)
    }
}

struct GetStarted_Previews: PreviewProvider {
    static var previews: some View {
        GetStarted()
    }
}
