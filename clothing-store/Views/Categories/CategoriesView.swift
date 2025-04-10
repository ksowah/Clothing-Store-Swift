//
//  CategoriesView.swift
//  clothing
//
//  Created by macbook on 06/04/2025.
//

import SwiftUI

struct CategoriesView: View {
    @EnvironmentObject var router: NavigationCoordinator
    private let categoryItems = [
        CategoryItem(
            image: "f6",
            title: "New Arrivals",
            subtitle: "208 Products",
            category: .NewArrivals
        ),
        CategoryItem(
            image: "f7",
            title: "Cloths",
            subtitle: "385 Products",
            category: .Cloths
        ),
        CategoryItem(
            image: "f8",
            title: "Bags",
            subtitle: "160 Products",
            category: .Bags
        ),
        CategoryItem(
            image: "f9",
            title: "Shoes",
            subtitle: "290 Products",
            category: .Shoes
        ),
        CategoryItem(
            image: "f10",
            title: "Electronics",
            subtitle: "230 Products",
            category: .Electronics
        ),
        CategoryItem(
            image: "f11",
            title: "Jewelry",
            subtitle: "92 Products",
            category: .Jewelry
        ),
    ]
    
    var body: some View {
        VStack {
            List {
                ForEach(Array(categoryItems.enumerated()), id: \.element.id) { idx, item in
                    Button {
                        router.push(.categoryProductsScreen(category: item.category))
                    } label: {
                        Category(item: item, index: idx)
                    }

                }
            }
            .listStyle(PlainListStyle())
            .padding(.vertical)
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
