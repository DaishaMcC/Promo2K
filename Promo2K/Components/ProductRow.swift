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
        HStack(spacing: 14) {
            Image(item.product.image)
                .resizable()
                .scaledToFit()
                .frame(width: 72, height: 72)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .fill(Color.white.opacity(0.08))
                )

            VStack(alignment: .leading, spacing: 6) {
                Text(item.product.name)
                    .font(.headline)
                    .foregroundStyle(.white)

                Text("Size: \(item.size.rawValue)")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.72))

                Text("$\(item.product.price)")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
            }

            Spacer()

            Button {
                cartManager.removeFromCart(item: item)
            } label: {
                Image(systemName: "trash.fill")
                    .foregroundStyle(.white)
                    .frame(width: 36, height: 36)
                    .background(Color.blue.opacity(0.9))
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(Color.black.opacity(0.78))
        }
        .overlay {
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .stroke(Color.blue.opacity(0.75), lineWidth: 1.5)
        }
        .shadow(
            color: Color.blue.opacity(0.22),
            radius: 8
        )
    }
}

#Preview {
    ProductRow(
        item: CartItem(product: productList[0], size: .large)
    )
    .environmentObject(CartManager())
    .padding()
    .background(Color.black)
}


