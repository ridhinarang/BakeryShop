import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject var cart: CartViewModel
    let product: Product

    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.orange.opacity(0.15))
                .frame(height: 220)
                .overlay(
                    Image(systemName: product.symbol)
                        .font(.system(size: 72))
                        .foregroundStyle(.orange)
                )
                .padding(.horizontal)

            VStack(alignment: .leading, spacing: 8) {
                Text(product.name)
                    .font(.title2.bold())
                Text(product.category)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(.orange)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)

            Spacer()

            Button {
                cart.add(product)
            } label: {
                Text("Add to Cart")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ProductDetailView(product: Product.sample[0])
            .environmentObject(CartViewModel())
    }
}
