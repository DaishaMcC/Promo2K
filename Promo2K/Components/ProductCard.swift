//
//  ProductCard.swift
//  Promo2K
//
//  Created by Daisha McCutcheon on 5/28/26.
//

import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var cartManager: CartManager

    var product: Product

    @State private var showSizeOptions = false

    var body: some View {
        ZStack(alignment: .topTrailing) {
            NavigationLink {
                ProductDetailView(product: product)
                    .environmentObject(cartManager)
            } label: {
                VStack(spacing: 8) {
                    Image(product.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 120)
                        .frame(maxWidth: .infinity)
                        .padding(8)
                        .background(
                            Color.white.opacity(0.08)
                        )
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 16,
                                style: .continuous
                            )
                        )

                    Text(product.name)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)

                    Text("$\(product.price)")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(.white.opacity(0.8))
                }
                .padding(10)
                .frame(width: 160, height: 215)
                .background {
                    RoundedRectangle(
                        cornerRadius: 22,
                        style: .continuous
                    )
                    .fill(Color.black.opacity(0.68))
                }
                .overlay {
                    RoundedRectangle(
                        cornerRadius: 22,
                        style: .continuous
                    )
                    .stroke(
                        Color.blue.opacity(0.75),
                        lineWidth: 1.5
                    )
                }
                .shadow(
                    color: Color.blue.opacity(0.3),
                    radius: 8
                )
            }
            .buttonStyle(.plain)

            Button {
                showSizeOptions = true
            } label: {
                Image(systemName: "plus")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .shadow(radius: 4)
            }
            .offset(x: 7, y: -7)
            .accessibilityLabel(
                "Add \(product.name) to cart"
            )
        }
        .confirmationDialog(
            "Choose a size",
            isPresented: $showSizeOptions,
            titleVisibility: .visible
        ) {
            ForEach(ProductSize.allCases) { size in
                Button(size.rawValue) {
                    cartManager.addToCart(
                        product: product,
                        size: size
                    )
                }
            }

            Button("Cancel", role: .cancel) {}
        }
    }
}

#Preview {
    NavigationView {
        ProductCard(product: productList[0])
            .environmentObject(CartManager())
            .padding()
            .background(Color.black)
    }
}


