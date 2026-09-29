import SwiftUI

struct HomeView: View {
    @EnvironmentObject var cart: CartViewModel
    @State private var selectedCategory = "All"

    private let categories = ["All", "Bread", "Pastry", "Muffin"]
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]

    private var filteredProducts: [Product] {
        selectedCategory == "All"
            ? Product.sample
            : Product.sample.filter { $0.category == selectedCategory }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                // Category filter row (the row of icons/boxes in the sketch)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(categories, id: \.self) { category in
                            Button {
                                selectedCategory = category
                            } label: {
                                Text(category)
                                    .font(.subheadline.weight(.medium))
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(selectedCategory == category ? Color.orange : Color(.systemGray5))
                                    .foregroundStyle(selectedCategory == category ? .white : .primary)
                                    .clipShape(Capsule())
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 8)

                // Product grid
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(filteredProducts) { product in
                        NavigationLink(value: product) {
                            ProductCardView(product: product)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .navigationTitle("Sweet Bakery")
            .navigationDestination(for: Product.self) { product in
                ProductDetailView(product: product)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        CartView()
                    } label: {
                        ZStack(alignment: .topTrailing) {
                            Image(systemName: "cart")
                                .font(.title3)
                            if cart.totalCount > 0 {
                                Text("\(cart.totalCount)")
                                    .font(.caption2.bold())
                                    .padding(4)
                                    .background(Color.red)
                                    .foregroundStyle(.white)
                                    .clipShape(Circle())
                                    .offset(x: 10, y: -10)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView().environmentObject(CartViewModel())
}
