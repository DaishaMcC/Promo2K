//
//  CartManager.swift
//  Promo2K
//
//  Created by Daisha McCutcheon on 5/28/26.
//

import Foundation
import Combine
import SwiftData

@MainActor
final class CartManager: ObservableObject {
    @Published private(set) var products: [CartItem] = []
    @Published private(set) var total: Int = 0

    private var modelContext: ModelContext?
    private var hasLoadedSavedCart = false

    // Connect CartManager to SwiftData.
    func configure(with context: ModelContext) {
        modelContext = context
        
        guard !hasLoadedSavedCart else {
            return
        }

        hasLoadedSavedCart = true
        loadSavedCart()
    }

    func addToCart(product: Product, size: ProductSize) {
        let cartItem = CartItem(
            product: product,
            size: size
        )

        products.append(cartItem)
        calculateTotal()

        let savedItem = SavedCartItem(
            id: cartItem.id,
            productName: product.name,
            productImage: product.image,
            productPrice: product.price,
            productDescription: product.description,
            productSizeGuide: product.sizeGuide,
            selectedSize: size.rawValue
        )

        modelContext?.insert(savedItem)
        saveContext()
    }

    func removeFromCart(item: CartItem) {
        products.removeAll { cartItem in
            cartItem.id == item.id
        }

        calculateTotal()
        deleteSavedItem(withID: item.id)
    }

    private func loadSavedCart() {
        guard let modelContext else {
            return
        }

        do {
            let descriptor = FetchDescriptor<SavedCartItem>()
            let savedItems = try modelContext.fetch(descriptor)

            products = savedItems.compactMap { savedItem in
                guard let productSize = ProductSize(
                    rawValue: savedItem.selectedSize
                ) else {
                    return nil
                }

                let product = Product(
                    name: savedItem.productName,
                    image: savedItem.productImage,
                    price: savedItem.productPrice,
                    description: savedItem.productDescription,
                    sizeGuide: savedItem.productSizeGuide
                )

                return CartItem(
                    id: savedItem.id,
                    product: product,
                    size: productSize
                )
            }

            calculateTotal()
        } catch {
            print("Could not load saved cart: \(error)")
        }
    }

    private func deleteSavedItem(withID id: UUID) {
        guard let modelContext else {
            return
        }

        do {
            let descriptor = FetchDescriptor<SavedCartItem>(
                predicate: #Predicate<SavedCartItem> { savedItem in
                    savedItem.id == id
                }
            )

            let matchingItems = try modelContext.fetch(descriptor)

            for savedItem in matchingItems {
                modelContext.delete(savedItem)
            }

            saveContext()
        } catch {
            print("Could not delete saved cart item: \(error)")
        }
    }

    private func calculateTotal() {
        total = products.reduce(0) { currentTotal, item in
            currentTotal + item.product.price
        }
    }

    private func saveContext() {
        guard let modelContext else {
            return
        }

        do {
            try modelContext.save()
        } catch {
            print("Could not save cart: \(error)")
        }
    }
}
