//
//  CartManager.swift
//  Promo2K
//
//  Created by Daisha McCutcheon on 5/28/26.
//

import Foundation
import Combine

class CartManager: ObservableObject {
    @Published private(set) var products: [CartItem] = []
    @Published private(set) var total: Int = 0
    
    func addToCart(product: Product, size: ProductSize) {
        let item = CartItem(product: product, size: size)
        products.append(item)
        total += product.price
    }
    
    func removeFromCart(item: CartItem) {
        products = products.filter { $0.id != item.id }
        total -= item.product.price
    }
}
