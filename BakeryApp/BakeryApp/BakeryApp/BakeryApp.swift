import SwiftUI

@main
struct BakeryApp: App {
    @StateObject private var cart = CartViewModel()
    @State private var isLoggedIn = false

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                ContentView()
                    .environmentObject(cart)
            } else {
                LoginView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}
