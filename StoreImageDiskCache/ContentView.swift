//
//  ContentView.swift
//  StoreImageDiskCache
//
//  Created by Italo Barzola García on 4/9/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var cart = CartStore()
    @State private var tab: Tab = Tab.Product
    
    init() { ImageMemoryCache.configure() }
    
    var body: some View {
        TabView(selection: $tab){
            ProductView()
                .tabItem{Label("Productos", systemImage: "bag")}
                .tag(Tab.Product)
            CartView()
                .tabItem{Label("Carrito", systemImage: "cart")}
                .tag(Tab.Cart)

        }
        .environmentObject(cart)
        .tint(.purple)
    }
}

#Preview {
    ContentView()
}
