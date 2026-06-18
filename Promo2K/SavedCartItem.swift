//
//  SavedCartItem.swift
//  Promo2K
//
//  Created by Daisha McCutcheon on 6/17/26.
//

import Foundation
import SwiftData

@Model
final class SavedCartItem {
    @Attribute(.unique) var id: UUID

    var productName: String
    var productImage: String
    var productPrice: Int
    var productDescription: String
    var productSizeGuide: String
    var selectedSize: String

    init(
        id: UUID = UUID(),
        productName: String,
        productImage: String,
        productPrice: Int,
        productDescription: String,
        productSizeGuide: String,
        selectedSize: String
    ) {
        self.id = id
        self.productName = productName
        self.productImage = productImage
        self.productPrice = productPrice
        self.productDescription = productDescription
        self.productSizeGuide = productSizeGuide
        self.selectedSize = selectedSize
    }
}
