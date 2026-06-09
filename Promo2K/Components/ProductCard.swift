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
                ZStack(alignment: .bottom) {
                    Image(product.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                        .cornerRadius(20)

                    VStack {
                        Text(product.name)
                            .bold()

                        Text("$\(product.price)")
                            .font(.caption)
                    }
                    .padding()
                    .foregroundColor(.primary)
                }
                .frame(width: 180, height: 240)
                .shadow(radius: 10)
            }
            .buttonStyle(.plain)

            Button {
                showSizeOptions = true
            } label: {
                Image(systemName: "plus")
                    .font(.headline)
                    .padding(10)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .clipShape(Circle())
            }
            .padding()
            .accessibilityLabel("Add \(product.name) to cart")

        }
        .confirmationDialog("Choose a size", isPresented: $showSizeOptions, titleVisibility: .visible) {
            ForEach(ProductSize.allCases) { size in
                Button(size.rawValue) {
                    cartManager.addToCart(product: product, size: size)
                }
            }

            Button("Cancel", role: .cancel) { }
        }
    }
}

#Preview {
    NavigationView {
        ProductCard(product: productList[0])
            .environmentObject(CartManager())
    }
}
