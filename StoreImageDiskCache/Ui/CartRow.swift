//
//  CartRow.swift
//  StoreImageDiskCache
//
//  Created by Italo Barzola García on 4/9/25.
//

import Foundation
import SwiftUI

struct CartRow: View {
    let item: CartItem
    let onIncrement: () -> Void
    let onDecrement: () -> Void
    let onRemove: () -> Void
    
    
    var body: some View {
        HStack(spacing: 10) {
            CachedImageView(url: item.product.image, cornerRadius: 8)
                .frame(width: 56, height: 42)
                .background(.white, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(Color.black.opacity(0.08), lineWidth: 0.5)
                )
            
            
            VStack(alignment: .leading, spacing: 2) {
                Text(item.product.title).font(.subheadline).lineLimit(2)
                Text(String(format: "$%.2f", item.product.price)).font(.footnote).foregroundStyle(.secondary)
            }
            Spacer()
            HStack(spacing: 8) {
                Button(action: onDecrement) { Image(systemName: "minus.circle.fill") }
                Text("\(item.quantity)").font(.subheadline).frame(minWidth: 20)
                Button(action: onIncrement) { Image(systemName: "plus.circle.fill") }
            }
            .tint(.purple)
            Button(role: .destructive, action: onRemove) { Image(systemName: "trash") }
        }
        .padding(.vertical, 6)
    }
}
