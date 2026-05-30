//
//  Product.swift
//  Promo2K
//
//  Created by Daisha McCutcheon on 5/28/26.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}

var productList = [Product(name: "Black Regular Belt", image: "Belt", price: 79),
                   Product(name: "Heart Boxers", image: "Boxers", price: 25),
                   Product(name: "Black Cropped Long Tee", image: "Croppedlong", price: 45),
                   Product(name: "Black Cropped Short Tee", image: "Croppedshort", price: 40),
                   Product(name: "Black Hoodie", image: "Hoodie", price: 56),
                   Product(name: "Dark Jeans", image: "Jeans", price: 128),
                   Product(name: "Dark Jorts", image: "Jorts", price: 109),
                   Product(name: "Black Studded Belt", image: "Studdedbelt", price: 79)
]
