import SwiftUI

struct ProductCardView: View {
    @EnvironmentObject var cart: CartViewModel
    let product: Product

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.orange.opacity(0.15))
                .frame(height: 100)
                .overlay(
                    Image(systemName: product.symbol)
                        .font(.system(size: 36))
                        .foregroundStyle(.orange)
                )

            Text(product.name)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(.primary)
                .lineLimit(1)

            HStack {
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.footnote)
                    .foregroundStyle(.secondary)

                Spacer()

                Stepper(quantityLabel: cart.quantity(for: product)) {
                    cart.add(product)
                } onDecrement: {
                    cart.decrement(product)
                }
            }
        }
        .padding(10)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

/// Small +/- stepper matching the quantity boxes sketched in the wireframe.
private struct Stepper: View {
    let quantityLabel: Int
    let onIncrement: () -> Void
    let onDecrement: () -> Void

    var body: some View {
        HStack(spacing: 8) {
            if quantityLabel > 0 {
                Button(action: onDecrement) {
                    Image(systemName: "minus.circle.fill")
                        .foregroundStyle(.orange)
                }
                Text("\(quantityLabel)")
                    .font(.footnote.weight(.semibold))
                    .frame(minWidth: 14)
            }
            Button(action: onIncrement) {
                Image(systemName: "plus.circle.fill")
                    .foregroundStyle(.orange)
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ProductCardView(product: Product.sample[0])
        .environmentObject(CartViewModel())
        .padding()
}
