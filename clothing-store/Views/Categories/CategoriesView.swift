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
            category: .newArrivals
        ),
        CategoryItem(
            image: "f7",
            title: "Cloths",
            subtitle: "385 Products",
            category: .cloths
        ),
        CategoryItem(
            image: "bag",
            title: "Bags",
            subtitle: "160 Products",
            category: .bags
        ),
        CategoryItem(
            image: "shoe",
            title: "Shoes",
            subtitle: "290 Products",
            category: .shoes
        ),
        CategoryItem(
            image: "jewelry",
            title: "Jewelry",
            subtitle: "92 Products",
            category: .jewelry
        ),
        CategoryItem(
            image: "electronic",
            title: "Electronics",
            subtitle: "230 Products",
            category: .electronics
        ),
    ]
    
    var body: some View {
        VStack {
            List {
                ForEach(Array(categoryItems.enumerated()), id: \.element.id) { idx, item in
                    Button {
                        router.push(.categoryProductsScreen(category: item.category))
                    } label: {
                        CategoryType(item: item, index: idx)
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
