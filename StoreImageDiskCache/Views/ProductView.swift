//
//  ProductView.swift
//  StoreImageDiskCache
//
//  Created by Italo Barzola García on 4/9/25.
//

import SwiftUI

struct ProductView: View {
    @EnvironmentObject var cart: CartStore
    @StateObject private var service = ProductService()
    
    
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    
    var body: some View {
        NavigationStack {
            Group {
                if service.isLoading {
                    VStack(spacing: 12) { ProgressView(); Text("Cargando productos…").foregroundStyle(.secondary) }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if let err = service.errorMessage {
                    ContentUnavailableView("Error", systemImage: "xmark.octagon", description: Text(err))
                } else if service.products.isEmpty {
                    ContentUnavailableView("Sin productos", systemImage: "shippingbox")
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 18) {
                            ForEach(service.products) { p in
                                ProductCard(product: p) { cart.add(p) }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 8)
                    }
                }
            }
            .navigationTitle("Productos")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        CartView()
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "cart"); Text("\(cart.count)")
                        }
                    }
                }
            }
            .task { await service.fetch() }
            .refreshable { await service.fetch() }
        }
    }
}

#Preview {
    ProductView()
}
