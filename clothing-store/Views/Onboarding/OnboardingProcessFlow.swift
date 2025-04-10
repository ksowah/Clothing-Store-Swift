//
//  OboardingProcessFlow.swift
//  clothing
//
//  Created by macbook on 26/03/2025.
//

import SwiftUI

struct OnboardingProcessFlow: View {
    @EnvironmentObject var router: NavigationCoordinator
    
    private let onboardingPages = [
        OnboardingPage(
            image: "f2",
            title: "20% Discount New Arrival Product",
            description: "Publish up your selies to make yourself more beautiful."
        ),
        OnboardingPage(
            image: "f3",
            title: "Take Advantage Of The Offer Shopping",
            description: "Publish up your selies to make yourself more beautiful."
        ),
        OnboardingPage(
            image: "f5",
            title: "All Types Offers Within Your Reach",
            description: "Publish up your selies to make yourself more beautiful."
        )
    ]
    
    @State private var currentPage = 0
    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding = false
    
    var body: some View {
        VStack(alignment: .leading) {
            TabView(selection: $currentPage) {
                ForEach(onboardingPages.indices, id: \.self) { index in
                    OnboardingItem(item: onboardingPages[index])
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            Spacer()
            
            // Page Indicator
            HStack(alignment: .center) {
                HStack(spacing: 10) {
                    ForEach(onboardingPages.indices, id: \.self) { index in
                        Capsule()
                            .frame(width: currentPage == index ? 20 : 7, height: 7)
                            .foregroundColor(currentPage == index ? .black : .gray)
                            .animation(.easeInOut, value: currentPage)
                    }
                }
                
                Spacer()
                
                Button {
                    handleButtonPress()
                } label: {
                    DirectionButton(btnType: .Next)
                }
            }
            .padding(.horizontal, 20)
            
            Text("Skip")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.horizontal, 20)

            
            Spacer()
        }
        
    }
    
    private func handleButtonPress() {
        if currentPage < onboardingPages.count - 1 {
            withAnimation {
                currentPage += 1
            }
        } else {
            hasCompletedOnboarding = true
            router.push(.loginScreen)
        }
    }
}

struct OboardingProcessFlow_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingProcessFlow()
    }
}
