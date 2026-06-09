//
//  ProductRow.swift
//  Promo2K
//
//  Created by Daisha McCutcheon on 5/28/26.
//

import SwiftUI

struct ProductRow: View {
    @EnvironmentObject var cartManager: CartManager
    var item: CartItem

    var body: some View {
        HStack(spacing: 20) {

            Image(item.product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 6) {
                Text(item.product.name)
                    .bold()

                Text("Size: \(item.size.rawValue)")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Text("$\(item.product.price)")
            }

            Spacer()

            Image(systemName: "trash.fill")
                .foregroundStyle(Color.blue)
                .onTapGesture {
                    cartManager.removeFromCart(item: item)
                }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ProductRow(item: CartItem(product: productList[4], size: .large))
        .environmentObject(CartManager())
}

