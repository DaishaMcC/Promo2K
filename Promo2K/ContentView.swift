//
//  ContentView.swift
//  Promo2K
//
//  Created by Daisha McCutcheon on 5/28/26.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject var cartManager = CartManager()

    var columns = [
        GridItem(.adaptive(minimum: 160), spacing: 20)
    ]

    var body: some View {
        NavigationView {
            ZStack {
                GeometryReader { geometry in
                    Image("AppBackground")
                        .resizable()
                        .scaledToFill()                        
                        .clipped()
                        .ignoresSafeArea()
                }

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(productList, id: \.id) { product in
                            ProductCard(product: product)
                                .environmentObject(cartManager)
                        }
                    }
                    .padding()
                }
                .scrollContentBackground(.hidden)
                .background(Color.clear)
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            .navigationTitle(Text("Promo 2K"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink {
                    CartView()
                        .environmentObject(cartManager)
                } label: {
                    CartButton(
                        numberOfProducts: cartManager.products.count
                    )
                }
            }
        }
        .task {
            cartManager.configure(with: modelContext)
        }
    }
}

#Preview {
    ContentView()
}



