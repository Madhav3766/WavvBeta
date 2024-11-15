⁠import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Email")
                    .font(.custom("Lexend", size: 64))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 247/255, green: 241/255, blue: 241/255))
                    .accessibilityAddTraits(.isHeader)
                
                TextField("Enter email address", text: $email)
                    .font(.custom("Lexend", size: 48))
                    .fontWeight(.thin)
                    .padding()
                    .frame(maxWidth: 862)
                    .background(Color(red: 68/255, green: 68/255, blue: 68/255))
                    .foregroundColor(Color(red: 247/255, green: 241/255, blue: 241/255))
                    .overlay(
                        RoundedRectangle(cornerRadius: 0)
                            .stroke(Color(red: 245/255, green: 245/255, blue: 245/255), lineWidth: 1)
                    )
                    .accessibilityLabel("Email input")
                
                Text("Password")
                    .font(.custom("Lexend", size: 64))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 247/255, green: 241/255, blue: 241/255))
                    .accessibilityAddTraits(.isHeader)
                
                SecureField("Enter Password", text: $password)
                    .font(.custom("Lexend", size: 48))
                    .fontWeight(.thin)
                    .padding()
                    .frame(maxWidth: 862)
                    .background(Color(red: 68/255, green: 68/255, blue: 68/255))
                    .foregroundColor(Color(red: 247/255, green: 241/255, blue: 241/255))
                    .overlay(
                        RoundedRectangle(cornerRadius: 0)
                            .stroke(Color(red: 245/255, green: 245/255, blue: 245/255), lineWidth: 1)
                    )
                    .accessibilityLabel("Password input")
                
                Button(action: {
                    // Handle login action
                }) {
                    Text("Let's get grooving")
                        .font(.custom("Lexend", size: 64))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(maxWidth: 795, maxHeight: 194)
                        .background(Color(white: 1, opacity: 0.8))
                        .clipShape(RoundedRectangle(cornerRadius: 200))
                }
                .accessibilityLabel("Login button")
            }
            .padding(.vertical, 303)
            .padding(.horizontal, 80)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 30/255, green: 30/255, blue: 30/255))
        }
        .navigationTitle("Login")
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
} ⁠
