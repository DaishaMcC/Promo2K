//
//  CartView.swift
//  Promo2K
//
//  Created by Daisha McCutcheon on 5/28/26.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        ScrollView {
            if cartManager.products.count > 0 {
                ForEach(cartManager.products, id: \.id) { product in
                    ProductRow(product: product)
                }

                VStack(spacing: 16) {
                    HStack {
                        Text("Your Cart Total")
                            .font(.headline)

                        Spacer()

                        Text("$\(cartManager.total).00")
                            .font(.headline)
                            .bold()
                    }

                    Button {
                        openShopifyCheckout()
                    } label: {
                        HStack {
                            Image(systemName: "bag.fill")
                            Text("Checkout with Shopify")
                                .fontWeight(.semibold)

                            Spacer()

                            Image(systemName: "arrow.right")
                        }
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(14)
                    }
                    .buttonStyle(.plain)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(18)
                .padding(.top, 10)

            } else {
                Text("Your Cart Is Empty")
                    .font(.headline)
                    .padding(.top, 40)
            }
        }
        .navigationTitle("My Cart")
        .padding()
    }

    // UPDATED FUNCTION
    func openShopifyCheckout() {
        if let url = URL(string: "https://PROMO2K.myshopify.com/cart") {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}

