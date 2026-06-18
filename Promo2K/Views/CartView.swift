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
        ZStack {
            GeometryReader { geometry in
                Image("AppBackground")
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(1.25)
                    .clipped()
                    .ignoresSafeArea()
            }

            Color.black
                .opacity(0.60)
                .ignoresSafeArea()

            ScrollView {
                if cartManager.products.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "cart.fill")
                            .font(.system(size: 42))
                            .foregroundStyle(.blue)

                        Text("Your cart is empty")
                            .font(.headline)
                            .foregroundStyle(.white)

                        Text("Add some Promo2K pieces to get started.")
                            .font(.subheadline)
                            .foregroundStyle(.white.opacity(0.75))
                            .multilineTextAlignment(.center)
                    }
                    .padding(30)
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 24, style: .continuous)
                            .fill(Color.black.opacity(0.78))
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: 24, style: .continuous)
                            .stroke(Color.blue.opacity(0.7), lineWidth: 1.5)
                    }
                    .padding()
                    .padding(.top, 50)
                } else {
                    VStack(spacing: 18) {
                        ForEach(cartManager.products) { item in
                            ProductRow(item: item)
                                .environmentObject(cartManager)
                        }

                        HStack {
                            Text("Total")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)

                            Spacer()

                            Text("$\(cartManager.total)")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 22, style: .continuous)
                                .fill(Color.black.opacity(0.82))
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 22, style: .continuous)
                                .stroke(Color.blue.opacity(0.75), lineWidth: 1.5)
                        }
                        .shadow(
                            color: Color.blue.opacity(0.25),
                            radius: 8
                        )
                    }
                    .padding()
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.clear)
        }
        .navigationTitle("Cart")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.black.opacity(0.92), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}

#Preview {
    NavigationView {
        CartView()
            .environmentObject(CartManager())
    }
}


