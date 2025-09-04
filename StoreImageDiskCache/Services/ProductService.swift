//
//  ProductService.swift
//  StoreImageDiskCache
//
//  Created by Italo Barzola García on 4/9/25.
//

import Foundation

@MainActor
final class ProductService: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    
    func fetch() async {
        isLoading = true; defer { isLoading = false }
        errorMessage = nil
        do {
            let url = URL(string: "https://fakestoreapi.com/products")!
            let (data, response) = try await URLSession.shared.data(from: url)
            if let http = response as? HTTPURLResponse, !(200...299).contains(http.statusCode) {
                throw URLError(.badServerResponse)
            }
            let decoded = try JSONDecoder().decode([Product].self, from: data)
            self.products = decoded
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
}
