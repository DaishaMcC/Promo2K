//
//  Product.swift
//  Promo2K
//
//  Created by Daisha McCutcheon on 5/28/26.
//

import Foundation

enum ProductSize: String, CaseIterable, Identifiable{
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
    case extraLarge = "Extra Large"

    var id: String { rawValue }
}

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
    var description: String = "Premium Promo2K unique everyday pieces"
    var sizeGuide: String = "Small: Fitted\nMedium: regular fit/nLarge: relaxed fit\nExtra Large: oversized fit"
}

struct CartItem: Identifiable {
    var id: UUID
    var product: Product
    var size: ProductSize

    init(
        id: UUID = UUID(),
        product: Product,
        size: ProductSize
    ) {
        self.id = id
        self.product = product
        self.size = size
    }
}


var productList = [Product(name: "Black Regular Belt", image: "Belt", price: 79, description: "Classic black belt with a clean unique design"),
                   Product(name: "Heart Boxers", image: "Boxers", price: 25, description: "Boxers with cute heart designs"),
                   Product(name: "Black Cropped Long Tee", image: "Croppedlong", price: 45, description: "Black cropped long sleeve"),
                   Product(name: "Black Cropped Short Tee", image: "Croppedshort", price: 40, description: "Black cropped short sleeve"),
                   Product(name: "Black Hoodie", image: "Hoodie", price: 56, description: "relaxed comfortable hoodie"),
                   Product(name: "Dark Jeans", image: "Jeans", price: 128, description: "Dark wash straight leg jeans"),
                   Product(name: "Dark Jorts", image: "Jorts", price: 109, description: "Dark wash straight leg jorts"),
                   Product(name: "Black Studded Belt", image: "Studdedbelt", price: 79, description: "Classic black belt with studded design")
]
