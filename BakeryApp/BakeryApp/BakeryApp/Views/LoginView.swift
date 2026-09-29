import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @State private var email = ""
    @State private var password = ""
    @State private var isSignUp = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Spacer()

                Image(systemName: "birthday.cake.fill")
                    .font(.system(size: 64))
                    .foregroundStyle(.orange)

                Text("Sweet Bakery")
                    .font(.largeTitle.bold())

                VStack(spacing: 14) {
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)

                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.horizontal, 32)

                Button {
                    isLoggedIn = true
                } label: {
                    Text(isSignUp ? "Sign Up" : "Sign In")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding(.horizontal, 32)

                Button {
                    isSignUp.toggle()
                } label: {
                    Text(isSignUp ? "Already have an account? Sign In" : "New here? Sign Up")
                        .font(.footnote)
                }

                Spacer()
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView(isLoggedIn: .constant(false))
}
