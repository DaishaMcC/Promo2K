//
//  ProductDe.swift
//  Promo2K
//
//  Created by Daisha McCutcheon on 6/8/26.
//

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product

    @State private var selectedSize: ProductSize = .medium

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(maxWidth: .infinity)

                Text(product.name)
                    .font(.title)
                    .bold()

                Text("$\(product.price)")
                    .font(.title2)

                Text("Product Description")
                    .font(.headline)

                Text(product.description)
                    .font(.body)

                Text("Choose Size")
                    .font(.headline)

                Picker("Size", selection: $selectedSize) {
                    ForEach(ProductSize.allCases) { size in
                        Text(size.rawValue).tag(size)
                    }
                }
                .pickerStyle(.segmented)

                Text("Size Guide")
                    .font(.headline)

                Text(product.sizeGuide)
                    .font(.body)

                Button {
                    cartManager.addToCart(product: product, size: selectedSize)
                } label: {
                    Text("Add to Cart - \(selectedSize.rawValue)")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundStyle(Color.white)
                        .cornerRadius(12)
                }
            }
            .padding()
        }
        .navigationTitle(product.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        ProductDetailView(product: productList[0])
            .environmentObject(CartManager())
    }
}

