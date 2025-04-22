//
//  ProfileView.swift
//  clothing-store
//
//  Created by macbook on 19/04/2025.
//

import SwiftUI

struct ProfileListItem: Hashable {
    var icon: String
    var title: String
}

struct ProfileView: View {
    
    var list: [ProfileListItem] = [
        ProfileListItem(icon: "person.fill", title: "Personal Details"),
        ProfileListItem(icon: "bag.fill", title: "My Orders"),
        ProfileListItem(icon: "suit.heart.fill", title: "My Favorites"),
        ProfileListItem(icon: "shippingbox.fill", title: "Shipping Address"),
        ProfileListItem(icon: "creditcard.fill", title: "My Card"),
        ProfileListItem(icon: "gearshape.fill", title: "Settings"),
    ]
    
    @EnvironmentObject var router: NavigationCoordinator
    @StateObject var contentViewModel = ContentViewModel()
    
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    let keychain = KeychainSwift()
    
    var body: some View {
        VStack{
            HStack {
                Image("me")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .cornerRadius(14)
                
                VStack(alignment: .leading) {
                    Text(contentViewModel.currentUser?.fullName ?? "Kelvin Sowah")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text(verbatim: contentViewModel.currentUser?.emailAddress ?? "sowahkelvin640@gmail.com")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 8)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(.white)
            .cornerRadius(14)
            .shadow(color: .gray.opacity(0.3), radius: 8)
            
            VStack {
                
                ForEach(list, id: \.self) { list in
                    RowItem(list: list)
                }
                
                Button {
                    keychain.delete(AppConfig.Keychain.loginKey)
                    isLoggedIn = false
                    router.path = [.loginScreen]
                } label: {
                    RowItem(list: .init(icon: "rectangle.portrait.and.arrow.right.fill", title: "Logout"), showChevron: false)
                }
                .foregroundColor(.black)

            }
            .frame(maxWidth: .infinity)
            .padding()
            .borderRound(cornerRadius: 14)
            .padding(.vertical)
            
            Spacer()
            
        }
        .padding()
    }
}

struct RowItem: View {
    var list: ProfileListItem
    var showChevron: Bool = true
    
    var body: some View {
        HStack {
            Image(systemName: list.icon)
                .imageScale(.large)
                .frame(width: 50, height: 50)
                .background(.gray.opacity(0.3))
                .cornerRadius(10)
            
            Text(list.title)
                .font(.subheadline)
                .fontWeight(.medium)
            
            Spacer()
            
            if showChevron {
                Image(systemName: "chevron.right")
                    .imageScale(.small)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
