import SwiftUI

struct CartView: View {
    @EnvironmentObject var cart: CartStore
    
    var body: some View {
        NavigationStack {
            Group {
                if cart.items.isEmpty {
                    ContentUnavailableView("Carrito vacío", systemImage: "cart")
                } else {
                    List {
                        ForEach(cart.items) { item in
                            CartRow(item: item,
                                    onIncrement: { cart.add(item.product) },
                                    onDecrement: { cart.decrement(item) },
                                    onRemove: { cart.remove(item) })
                        }
                        Section {
                            VStack(spacing: 12) {
                                HStack {
                                    Text("Total")
                                        .font(.headline)
                                    Spacer()
                                    Text(String(format: "$%.2f", cart.total))
                                        .font(.headline)
                                }
                                
                                Button {
                                    
                                } label: {
                                    Text("Finalizar compra")
                                        .frame(maxWidth: .infinity)
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(.purple)
                            }
                            .padding(.vertical, 8)
                        }
                    }
                    .listStyle(.insetGrouped)
                }
            }
            .navigationTitle("Carrito")
        }
    }
}
