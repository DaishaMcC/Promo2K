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
        ZStack {
            // MARK: - Background
            GeometryReader { geometry in
                Image("AppBackground")
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(1.25)
                    .clipped()
                    .ignoresSafeArea()
            }

            // Dark layer so the information is readable
            Color.black
                .opacity(0.55)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 18) {

                    // MARK: - Product Image
                    Image(product.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .frame(height: 330)
                        .padding(12)
                        .background {
                            RoundedRectangle(
                                cornerRadius: 24,
                                style: .continuous
                            )
                            .fill(Color.black.opacity(0.72))
                        }
                        .overlay {
                            RoundedRectangle(
                                cornerRadius: 24,
                                style: .continuous
                            )
                            .stroke(
                                Color.blue.opacity(0.85),
                                lineWidth: 2
                            )
                        }
                        .shadow(
                            color: Color.blue.opacity(0.5),
                            radius: 14
                        )

                    // MARK: - Product Information
                    VStack(alignment: .leading, spacing: 16) {
                        Text(product.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)

                        Text("$\(product.price)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        Color.white,
                                        Color.blue
                                    ],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )

                        Divider()
                            .overlay(Color.blue.opacity(0.7))

                        Text("Product Description")
                            .font(.headline)
                            .foregroundStyle(.white)

                        Text(product.description)
                            .font(.body)
                            .foregroundStyle(.white.opacity(0.78))

                        Text("Choose Size")
                            .font(.headline)
                            .foregroundStyle(.white)

                        Picker("Size", selection: $selectedSize) {
                            ForEach(ProductSize.allCases) { size in
                                Text(size.rawValue)
                                    .tag(size)
                            }
                        }
                        .pickerStyle(.segmented)
                        .colorScheme(.dark)

                        Text("Size Guide")
                            .font(.headline)
                            .foregroundStyle(.white)

                        Text(product.sizeGuide)
                            .font(.body)
                            .foregroundStyle(.white.opacity(0.78))

                        Button {
                            cartManager.addToCart(
                                product: product,
                                size: selectedSize
                            )
                        } label: {
                            HStack {
                                Image(systemName: "bag.fill")

                                Text(
                                    "Add to Cart — \(selectedSize.rawValue)"
                                )
                                .fontWeight(.bold)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 15)
                            .foregroundStyle(.white)
                            .background {
                                LinearGradient(
                                    colors: [
                                        Color.blue,
                                        Color.blue.opacity(0.55)
                                    ],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            }
                            .clipShape(
                                RoundedRectangle(
                                    cornerRadius: 16,
                                    style: .continuous
                                )
                            )
                            .overlay {
                                RoundedRectangle(
                                    cornerRadius: 16,
                                    style: .continuous
                                )
                                .stroke(
                                    Color.white.opacity(0.35),
                                    lineWidth: 1
                                )
                            }
                            .shadow(
                                color: Color.blue.opacity(0.55),
                                radius: 10
                            )
                        }
                    }
                    .padding(20)
                    .background {
                        RoundedRectangle(
                            cornerRadius: 24,
                            style: .continuous
                        )
                        .fill(Color.black.opacity(0.78))
                    }
                    .overlay {
                        RoundedRectangle(
                            cornerRadius: 24,
                            style: .continuous
                        )
                        .stroke(
                            Color.blue.opacity(0.65),
                            lineWidth: 1.5
                        )
                    }
                }
                .padding()
            }
            .scrollContentBackground(.hidden)
        }
        .navigationTitle(product.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(
            Color.black.opacity(0.92),
            for: .navigationBar
        )
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}

#Preview {
    NavigationView {
        ProductDetailView(product: productList[0])
            .environmentObject(CartManager())
    }
}

