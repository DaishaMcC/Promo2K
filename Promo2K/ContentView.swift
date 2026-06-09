//
//  ContentView.swift
//  Promo2K
//
//  Created by Daisha McCutcheon on 5/28/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()

    var columns = [
        GridItem(.adaptive(minimum: 160), spacing: 20)
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(productList, id: \.id) { product in
                        ProductCard(product: product)
                            .environmentObject(cartManager)
                    }
                }
                .padding()
            }
            .navigationTitle(Text("Promo 2K"))
            .toolbar {
                NavigationLink {
                    CartView()
                        .environmentObject(cartManager)
                } label: {
                    CartButton(numberOfProducts: cartManager.products.count)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
