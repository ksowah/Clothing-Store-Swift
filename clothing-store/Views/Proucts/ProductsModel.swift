//
//  ProductsModel.swift
//  clothing-store
//
//  Created by macbook on 10/04/2025.
//

import Foundation

struct Product: Hashable, Codable, Identifiable {
    var id: String
    var name: String
    var subtitle: String
    var image: String
    var description: String
    var price: Float
    var category: Category
    
    enum Category: String, CaseIterable, Codable {
        case All = "All"
        case NewArrivals = "New Arrivals"
        case Cloths = "Cloths"
        case Bags = "Bags"
        case Shoes = "Shoes"
        case Electronics = "Electronics"
        case Jewelry = "Jewelry"
    }
}

struct CategoryItem: Hashable, Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let subtitle: String
    let category: Product.Category
}

extension Product {
    static var MOCK_PRODUCTS: [Product] = [
        .init(
            id: NSUUID().uuidString,
            name: "Roller Rabbit",
            subtitle: "Vodda Edelle Dress",
            image: "f1",
            description: "Flowey bohemian dress with signature print, adjustable straps, and tiered skirt",
            price: 120.00,
            category: .NewArrivals
        ),
        .init(
            id: NSUUID().uuidString,
            name: "Endless Rose",
            subtitle: "Bubble Elastic T-Shirt",
            image: "f2",
            description: "Soft stretchy cotton tee with bubble sleeve detail and crew neckline",
            price: 80.00,
            category: .NewArrivals
        ),
        .init(
            id: NSUUID().uuidString,
            name: "Calvin Klein",
            subtitle: "Slim Fit Cotton Shirt",
            image: "f3",
            description: "Classic tailored shirt with mother-of-pearl buttons and curved hem",
            price: 95.50,
            category: .NewArrivals
        ),
        .init(
            id: NSUUID().uuidString,
            name: "Zara",
            subtitle: "Linen Blend Jacket",
            image: "f4",
            description: "Lightweight unlined blazer with notch lapel and flap pockets",
            price: 140.00,
            category: .Cloths
        ),
        .init(
            id: NSUUID().uuidString,
            name: "Levi's",
            subtitle: "501 Original Fit Jeans",
            image: "f5",
            description: "Iconic straight-leg jeans with button fly and leather patch",
            price: 110.00,
            category: .Cloths
        ),
        .init(
            id: NSUUID().uuidString,
            name: "Adidas",
            subtitle: "Classic Hoodie",
            image: "f7",
            description: "French terry hoodie with kangaroo pocket and ribbed cuffs",
            price: 70.00,
            category: .Cloths
        ),
        .init(
            id: NSUUID().uuidString,
            name: "Nike",
            subtitle: "Air Max Sneakers",
            image: "f6",
            description: "Cushioned running shoes with visible air unit and rubber outsole",
            price: 160.00,
            category: .Shoes
        ),
        .init(
            id: NSUUID().uuidString,
            name: "Balenciaga",
            subtitle: "Triple S Sneakers",
            image: "f11",
            description: "Chunky sole sneakers with distressed detailing and logo branding",
            price: 950.00,
            category: .Shoes
        ),
        .init(
            id: NSUUID().uuidString,
            name: "Versace",
            subtitle: "Barocco Print Swim Shorts",
            image: "f15",
            description: "Signature Baroque print swim trunks with side adjusters",
            price: 240.00,
            category: .Shoes
        ),
        .init(
            id: NSUUID().uuidString,
            name: "H&M",
            subtitle: "Relaxed Fit Pants",
            image: "f8",
            description: "Lightweight cotton trousers with elastic waist and drawstring",
            price: 45.99,
            category: .Bags
        ),
        .init(
            id: NSUUID().uuidString,
            name: "Uniqlo",
            subtitle: "Ultra Light Down Jacket",
            image: "f9",
            description: "Packable down jacket with water-repellent finish and stand collar",
            price: 89.90,
            category: .Bags
        ),
        .init(
            id: NSUUID().uuidString,
            name: "Prada",
            subtitle: "Re-Edition 2005 Nylon Bag",
            image: "f13",
            description: "Reissued nylon shoulder bag with logo plaque and detachable strap",
            price: 1950.00,
            category: .Bags
        ),
        .init(
            id: NSUUID().uuidString,
            name: "Gucci",
            subtitle: "Leather Belt with GG Buckle",
            image: "f10",
            description: "Double G buckle belt in premium leather with adjustable sizing",
            price: 320.00,
            category: .Electronics
        ),
        .init(
            id: NSUUID().uuidString,
            name: "Off-White",
            subtitle: "Arrow Logo T-Shirt",
            image: "f14",
            description: "Oversized cotton tee with diagonal arrow graphic and raw hem",
            price: 330.00,
            category: .Electronics
        ),
        .init(
            id: NSUUID().uuidString,
            name: "Chanel",
            subtitle: "Classic Flap Bag",
            image: "f12",
            description: "Timeless quilted lambskin bag with chain-link shoulder strap",
            price: 5800.00,
            category: .Jewelry
        )
    ]
}

