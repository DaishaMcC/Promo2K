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
            if cartManager.products.isEmpty {
                Text("Your cart is empty")
                    .font(.headline)
                    .padding()
            } else {
                VStack(spacing: 20) {

                    ForEach(cartManager.products) { item in
                        ProductRow(item: item)
                            .environmentObject(cartManager)
                    }

                    HStack {
                        Text("Total")
                            .font(.title2)
                            .bold()

                        Spacer()

                        Text("$\(cartManager.total)")
                            .font(.title2)
                            .bold()
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Cart")
    }
}

#Preview {
    NavigationView {
        CartView()
            .environmentObject(CartManager())
    }
}

