//
//  Cart.swift
//  StoreImageDiskCache
//
//  Created by Italo Barzola García on 4/9/25.
//

import Foundation

struct CartItem: Identifiable, Hashable, Equatable {
    let id = UUID()
    let product: Product
    var quantity: Int = 1
}
