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
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            
            ZStack(alignment: .bottom){
                Image(product.image)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaledToFit()
                
                VStack(){
                    Text(product.name)
                        .bold()
                    
                    Text("$\(product.price)")
                        .font(.caption)
                }
                .padding()
                
            }
            .frame(width: 180, height: 240)
            .shadow(radius: 10)
            
            Button {
                cartManager.addToCart(product: product)
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundStyle(Color.black)
                    .background(.blue)
                    .clipShape(Circle())
                    .padding()
                
            }
        }
        
    }
}

#Preview {
    ProductCard(product: productList[0])
        .environmentObject(CartManager())
}
