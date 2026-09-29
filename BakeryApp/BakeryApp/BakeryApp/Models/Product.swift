import Foundation

struct Product: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let category: String
    let price: Double
    let symbol: String // SF Symbol name used as a stand-in image

    static let sample: [Product] = [
        Product(name: "Sourdough Loaf", category: "Bread", price: 6.50, symbol: "birthday.cake"),
        Product(name: "Croissant", category: "Pastry", price: 3.25, symbol: "moon.stars"),
        Product(name: "Chocolate Muffin", category: "Muffin", price: 3.75, symbol: "circle.grid.2x2"),
        Product(name: "Cinnamon Roll", category: "Pastry", price: 4.00, symbol: "tornado"),
        Product(name: "Bagel", category: "Bread", price: 2.50, symbol: "circle"),
        Product(name: "Blueberry Scone", category: "Pastry", price: 3.50, symbol: "leaf")
    ]
}
