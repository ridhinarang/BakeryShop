import SwiftUI

struct CartView: View {
    @EnvironmentObject var cart: CartViewModel

    var body: some View {
        VStack {
            if cart.items.isEmpty {
                Spacer()
                Image(systemName: "cart")
                    .font(.system(size: 48))
                    .foregroundStyle(.secondary)
                Text("Your cart is empty")
                    .foregroundStyle(.secondary)
                Spacer()
            } else {
                List {
                    ForEach(cart.items) { item in
                        HStack {
                            Image(systemName: item.product.symbol)
                                .foregroundStyle(.orange)
                                .frame(width: 32)
                            VStack(alignment: .leading) {
                                Text(item.product.name)
                                    .font(.subheadline.weight(.medium))
                                Text("Qty \(item.quantity)")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            Text("$\(item.subtotal, specifier: "%.2f")")
                                .font(.subheadline)
                        }
                    }
                    .onDelete(perform: cart.remove)
                }

                VStack(spacing: 12) {
                    HStack {
                        Text("Total")
                            .font(.headline)
                        Spacer()
                        Text("$\(cart.totalPrice, specifier: "%.2f")")
                            .font(.headline)
                    }
                    Button {
                        // Checkout action placeholder
                    } label: {
                        Text("Checkout")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Cart")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        CartView().environmentObject(CartViewModel())
    }
}
