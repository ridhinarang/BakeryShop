# Sweet Bakery — SwiftUI App

Since I can't run Xcode directly, this is a ready-to-drop-in set of Swift source files
rather than a pre-built `.xcodeproj`. It takes about a minute to wire up.

## How it maps to your sketch
- **Sign In / Sign Up** screen → `Views/LoginView.swift`
- **Item list with quantity boxes** → `Views/HomeView.swift` + `Views/ProductCardView.swift`
  (grid of bakery items, each with a +/- quantity stepper)
- **Row of category icons** → the horizontal filter pills at the top of `HomeView`
- **Cart** → `Views/CartView.swift`, reachable from the cart icon in the top bar

## Setup (1–2 minutes)
1. Open Xcode → **File → New → Project**.
2. Choose **iOS → App**, click Next.
3. Product Name: `BakeryApp`. Interface: **SwiftUI**. Language: **Swift**. Uncheck "Use Core Data" / "Include Tests" (not needed).
4. Save it anywhere.
5. In the new project, **delete** the auto-generated `ContentView.swift` and `BakeryApp.swift` (or `BakeryAppApp.swift`).
6. Drag the `Models`, `ViewModels`, and `Views` folders — plus `ContentView.swift` and `BakeryApp.swift` from this download — into the Xcode project navigator. When prompted, check **"Copy items if needed"** and make sure your app target is checked.
7. Build & Run (⌘R) on any iOS simulator (iOS 16+ recommended, uses `NavigationStack`).

## Notes / assumptions I made
- The sketch was hard to read fully (rotated photo, handwriting), so I interpreted it as: **Login → Home (browse + add to cart) → Cart**, which is the most common bakery-app flow and matched the "Sign" and "Cart" labels I could make out, plus the row of small icon boxes as category filters.
- Product images are stand-ins using SF Symbols (no real photos) — swap `Image(systemName:)` in `ProductCardView.swift` / `ProductDetailView.swift` for real assets once you have them.
- Login is currently a UI stub (no real auth) — happy to wire up Firebase/Supabase/your backend if you tell me which one you're using.
- If I misread part of the wireframe (e.g. what the numbered boxes "1111" meant, or the small icon row), let me know and I'll adjust the structure.
