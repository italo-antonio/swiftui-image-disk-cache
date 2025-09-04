//
//  ProductCard.swift
//  StoreImageDiskCache
//
//  Created by Italo Barzola García on 4/9/25.
//

import Foundation
import SwiftUI

struct ProductCard: View {
    let product: Product
    let onAdd: () -> Void
    @State private var isLoading = false
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            CachedImageView(url: product.image)
                .scaledToFit()
                .frame(height: 80)
                .padding(.top, 8)
                .frame(maxWidth: .infinity)
            
            Text(product.title)
                .font(.subheadline).fontWeight(.semibold)
                .lineLimit(2)
            Text(String(format: "$%.2f", product.price))
                .font(.footnote).foregroundStyle(.secondary)
            
            Button {
                isLoading = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isLoading = false
                    onAdd()
                }
            } label: {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .frame(maxWidth: .infinity)
                } else {
                    Label("Agregar", systemImage: "cart.badge.plus")
                        .frame(maxWidth: .infinity)
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.purple)
            .disabled(isLoading)
        }
        .padding(10)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}
