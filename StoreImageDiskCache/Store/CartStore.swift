//
//  CartStore.swift
//  StoreImageDiskCache
//
//  Created by Italo Barzola García on 4/9/25.
//

import Foundation

@MainActor
final class CartStore: ObservableObject {
    @Published private(set) var items: [CartItem] = []
    
    
    func add(_ product: Product) {
        if let idx = items.firstIndex(where: { $0.product.id == product.id }) {
            items[idx].quantity += 1
        } else {
            items.append(CartItem(product: product, quantity: 1))
        }
    }
    
    func decrement(_ item: CartItem) {
        if let idx = items.firstIndex(where: { $0.id == item.id }) {
            items[idx].quantity -= 1
            if items[idx].quantity <= 0 { items.remove(at: idx) }
        }
    }
    
    func remove(_ item: CartItem) {
        items.removeAll { $0.id == item.id }
    }
    
    var total: Double { items.reduce(0) { $0 + (Double($1.quantity) * $1.product.price) } }
    var count: Int { items.reduce(0) { $0 + $1.quantity } }
}
