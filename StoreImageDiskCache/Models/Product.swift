//
//  Product.swift
//  StoreImageDiskCache
//
//  Created by Italo Barzola García on 4/9/25.
//

import Foundation

struct Product: Identifiable, Decodable, Equatable, Hashable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let image: URL
    let category: String
}
