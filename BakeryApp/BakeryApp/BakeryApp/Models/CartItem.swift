import Foundation

struct CartItem: Identifiable {
    let id = UUID()
    let product: Product
    var quantity: Int

    var subtotal: Double {
        product.price * Double(quantity)
    }
}
